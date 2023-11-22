import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

class RawPrinter {
  final String printerName;
  final Arena alloc;

  RawPrinter(this.printerName, this.alloc);

  Pointer<HANDLE> _startRawPrintJob({
    required String printerName,
    String dataType = 'RAW',
  }) {
    final pPrinterName = printerName.toNativeUtf16(allocator: alloc);
    final phPrinter = alloc<HANDLE>();
    var fSuccess = OpenPrinter(pPrinterName, phPrinter, nullptr);
    if (fSuccess == 0) {
      final error = GetLastError();
      throw Exception('OpenPrint error, status: $fSuccess, error: $error');
    }

    final pDocInfo = alloc<DOC_INFO_1>()
      ..ref.pDocName = printerName.toNativeUtf16(allocator: alloc)
      ..ref.pDatatype =
          dataType.toNativeUtf16(allocator: alloc) // RAW, TEXT or XPS_PASS
      ..ref.pOutputFile = nullptr;

    fSuccess = StartDocPrinter(
        phPrinter.value,
        1, // Version of the structure to which pDocInfo points.
        pDocInfo);
    if (fSuccess == 0) {
      final error = GetLastError();
      throw Exception(
          'StartDocPrinter error, status: $fSuccess, error: $error');
    }
    return phPrinter;
  }

  bool _startRawPrintPage(Pointer<HANDLE> phPrinter) {
    return StartPagePrinter(phPrinter.value) != 0;
  }

  bool _endRawPrintPage(Pointer<HANDLE> phPrinter) {
    return EndPagePrinter(phPrinter.value) != 0;
  }

  bool _endRawPrintJob(Pointer<HANDLE> phPrinter) {
    return EndDocPrinter(phPrinter.value) > 0 &&
        ClosePrinter(phPrinter.value) != 0;
  }

  Pointer<Int8> toNativeUtf8(List<int> codeUnitsData, {Allocator allocator = malloc}) {
    final units = codeUnitsData;
    final Pointer<Int8> result = allocator<Int8>(units.length + 1);
    final Int8List nativeString = result.asTypedList(units.length + 1);
    nativeString.setAll(0, units);
    nativeString[units.length] = 0;
    return result.cast();
  }

  bool _printRawData(Pointer<HANDLE> phPrinter, List<int> codeUnitsData) {
    final cWritten = alloc<DWORD>();
    final data = toNativeUtf8(codeUnitsData, allocator: alloc);
    final result = WritePrinter(
      phPrinter.value,
      data,
      codeUnitsData.length,
      cWritten,
    );
    if (codeUnitsData.length != cWritten.value) {
      final error = GetLastError();
      throw Exception('WritePrinter error, status: $result, error: $error');
    }
    return result != 0;
  }

  bool printLines(List<List<int>> codeUnitsData) {
    var res = false;
    if (codeUnitsData.isEmpty) {
      return res;
    }
    final printerHandle = _startRawPrintJob(
      printerName: printerName,
      dataType: 'RAW',
    );
    res = _startRawPrintPage(printerHandle);
    for (final item in codeUnitsData) {
      if (res) {
        res = _printRawData(printerHandle, item);
      }
    }
    _endRawPrintPage(printerHandle);
    _endRawPrintJob(printerHandle);
    return res;
  }
}

