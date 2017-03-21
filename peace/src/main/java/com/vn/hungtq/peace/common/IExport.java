package com.vn.hungtq.peace.common;

import java.util.LinkedHashMap;
import java.util.function.Supplier;

/**
 * Created by napt2017 on 3/19/2017.
 */
public interface IExport {
    enum ExportType{
        EXCEL_XLSX,EXCEL_XLS,CSV,
    }

    @SuppressWarnings("rawtypes")
	LinkedHashMap<String,Supplier> getMapTitleWithSupplier();
}
