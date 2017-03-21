package com.vn.hungtq.peace.common;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Supplier;
import java.util.stream.Collectors;

/**
 * 
 * The ExportUtil.java class 
 * Provider export the model data to excel(*.xls,*.xlsx)
 * or csv format
 * 
 * @author napt2017
 * 
 * 
 */
public class ExportorUtil<T extends IExport>{
    private List<T> listOfModel;

    private ExportorUtil(List<T> lstModel){
        this.listOfModel = lstModel;
    }

    public static <T extends IExport> ExportorUtil<? extends IExport> newInstanceWithModel(List<T> lstModel){
        return new ExportorUtil<T>(lstModel);
    }

    public void tryExportToCsv(String savePath,String delim) throws IOException {
        if("".equals(delim)){
            delim=",";
        }

        this.exportTo(IExport.ExportType.CSV,savePath,delim);
    }

    public void tryExportToXlsx(String savePath) throws IOException {
        this.exportTo(IExport.ExportType.EXCEL_XLSX,savePath,null);
        System.out.println("OK");
    }

    public void tryExportToXls(String savePath) throws IOException {
        this.exportTo(IExport.ExportType.EXCEL_XLS,savePath,null);
    }

    private void exportTo(final IExport.ExportType exportType ,String savePath,String delim) throws IOException {
         Tuple<Boolean,String> validateTuple = this.validateConfiguration();
         if(validateTuple.getFirst()){
             if(exportType.equals(IExport.ExportType.CSV)){
                 if(!savePath.endsWith(".csv")){
                     savePath = savePath+".csv";
                 }
             }else if(exportType.equals(IExport.ExportType.EXCEL_XLSX)){
                if(!savePath.endsWith(".xlsx")){
                    savePath = savePath+".xlsx";
                }
             }else if(exportType.equals(IExport.ExportType.EXCEL_XLS)){
                 if(!savePath.endsWith(".xls")){
                     savePath = savePath+".xls";
                 }
             }

             Path path = Paths.get(savePath);
             if(!Files.exists(path)){
                 Files.createFile(path);
             }

             //Try to export
             try(final FileOutputStream fout = new FileOutputStream(path.toFile())){
                 switch (exportType){
                     case CSV:
                         this.exportToCSV(fout,delim);
                         break;
                     case EXCEL_XLS:
                     case EXCEL_XLSX:
                         this.exportToExcel(exportType,fout);
                         break;
                 }
             }
         }else{
             throw new RuntimeException(validateTuple.getSecond());
         }
    }

    private void exportToExcel(IExport.ExportType exportType,final FileOutputStream fout) throws IOException {
        Workbook wb = null ;
        if(exportType.equals(IExport.ExportType.EXCEL_XLS)){
            wb = new XSSFWorkbook();
        }else if(exportType.equals(IExport.ExportType.EXCEL_XLSX)){
            wb = new HSSFWorkbook();
        }

        if(wb!=null){
            //Create sheet
            Sheet sheet = wb.createSheet();

            //Append title column to sheet
            this.appendTitleColumn(sheet);

            //Try to write data to sheet
            this.writeDataToSheet(sheet);

            //Save
            wb.write(fout);
        }else{
            throw new IOException("Cannot found the type of excel document!!!");
        }
    }

    private void appendTitleColumn(Sheet sheet){
        Row headerRow = sheet.createRow(0);
        Iterator<String> iterColumnHeaders = this.listOfModel.get(0)
                                                             .getMapTitleWithSupplier()
                                                             .keySet()
                                                             .iterator();
        int cellIndex = 0;
        while(iterColumnHeaders.hasNext()){
            Cell cell = headerRow.createCell(cellIndex++);
            cell.setCellValue(iterColumnHeaders.next());
        }
    }

    private void writeDataToSheet(Sheet sheet){
        final IntValHolder rIndex = new IntValHolder(1);
        this.listOfModel.stream().forEach(model->{
            final Row newRow = sheet.createRow(rIndex.incrementAfterGet());
            final IntValHolder cellIndex = new IntValHolder(0);
            model.getMapTitleWithSupplier().values().stream().forEachOrdered(sl->{
                Cell newCell = newRow.createCell(cellIndex.incrementAfterGet());
                String cellValue = sl.get()!=null?sl.get().toString():"";
                newCell.setCellValue(cellValue);
            });
        });
    }

    private void exportToCSV(final FileOutputStream fout,String delim) throws IOException {
        try(final OutputStreamWriter oWrite = new OutputStreamWriter(fout)){
            this.listOfModel.stream().forEach(model ->{
                String lineData = model.getMapTitleWithSupplier()
                                        .values()
                                        .stream()
                                        .map(sl -> String.valueOf(Optional.ofNullable(sl.get()).orElse("")))
                                        .collect(Collectors.joining(delim));
                try {
                    oWrite.write(lineData);
                    oWrite.write("\n");
                }catch (IOException ex){
                    ex.printStackTrace();
                }
            });
        }
    }

    private Tuple<Boolean,String> validateConfiguration(){
        if(this.listOfModel == null ||this.listOfModel.size()==0){
            return Tuple.make(false,"Empty model to export!");
        }

        IExport iExport = this.listOfModel.get(0);

        @SuppressWarnings("rawtypes")
		Map<String,Supplier> mapTitleWithSupplier = iExport.getMapTitleWithSupplier();
        if(mapTitleWithSupplier ==null || mapTitleWithSupplier.size()==0){
            return Tuple.make(false,"Empty map title with supplier!!");
        }

        return Tuple.make(true,"OK");
    }
}
