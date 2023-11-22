import 'dart:developer';

import 'package:win32/win32.dart';
import 'package:ffi/ffi.dart';
import 'ffi/printer_list_ffi.dart';
import 'ffi/printer_raw_ffi.dart';
import 'model/windows_printer_info.dart';

class WindowsUsbPrinterProvider {
  /// 获取已安装驱动的打印机设备
  static Future<List<WindowsPrinterInfo>?> queryLocalUsbDevice() async {
    return ListPrinter(PRINTER_ENUM_LOCAL).queryPrinterList(filterStatus: true);
  }

  /// printerName 对应 WindowsPrinterInfo 中 pPrinterName 值
  /// bytes 打印内容对应的数据（指令集）
  static Future<int> usbWrite(
    String printerName,
    List<int> bytes,
  ) async {
    bool success = false;
    try {
      using((Arena alloc) {
        final printer = RawPrinter(
          printerName,
          alloc,
        );
        success = printer.printLines([bytes]);
      });
    } catch (e) {
      log('UsbConn writeBytes error : ${e.toString()}');
      rethrow;
    }
    return success ? bytes.length : -1;
  }
}
