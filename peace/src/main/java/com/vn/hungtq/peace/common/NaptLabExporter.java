package com.vn.hungtq.peace.common;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by napt2017 on 3/19/2017.
 */
public class NaptLabExporter {
    public static void main(String[] args) {
        List<VnStudent> lstStudent = Arrays.asList(
                new VnStudent(1,"Ngocanh",22,false),
                new VnStudent(2,"Ngocanh",22,false),
                new VnStudent(3,"Ngocanh",22,false),
                new VnStudent(4,"Ngocanh",22,false),
                new VnStudent(5,"Ngocanh",22,false)
        );

        try {
            ExportorUtil.newInstanceWithModel(lstStudent).tryExportToXlsx("D:\\Hackathon");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
