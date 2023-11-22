import 'dart:developer';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

import '../model/windows_printer_info.dart';

class ListPrinter {
  final int _flags;

  ListPrinter(this._flags);

  List<WindowsPrinterInfo> queryPrinterList({
    bool filterStatus = false,
  }) {
    final result = <WindowsPrinterInfo>[];
    final usbPrinters = ListPrinter(PRINTER_ENUM_LOCAL);
    try {
      for (final device in usbPrinters.all()) {
        if (!device.pDriverName.toLowerCase().contains('microsoft')) {
          if (device.status != 0 && filterStatus) {
            continue;
          }
          result.add(device);
        }
      }
    } catch (e) {
      log('queryLocalUsbDevice error : ${e.toString()}');
    }
    return result;
  }

  Iterable<WindowsPrinterInfo> all() sync* {
    try {
      _getBufferSize();
      try {
        _readRawBuff();
        yield* parse();
      } finally {
        free(_rawBuffer);
      }
    } finally {
      free(_pBuffSize);
      free(_bPrinterLen);
    }
  }

  late Pointer<DWORD> _pBuffSize;
  late Pointer<DWORD> _bPrinterLen;

  void _getBufferSize() {
    _pBuffSize = calloc<DWORD>();
    _bPrinterLen = calloc<DWORD>();

    EnumPrinters(_flags, nullptr, 2, nullptr, 0, _pBuffSize, _bPrinterLen);

    if (_pBuffSize.value == 0) {
      throw 'Read printer buffer size fail';
    }
  }

  late Pointer<BYTE> _rawBuffer;

  void _readRawBuff() {
    _rawBuffer = malloc.allocate<BYTE>(_pBuffSize.value);

    final isRawBuffFail = EnumPrinters(
          _flags,
          nullptr,
          2,
          _rawBuffer,
          _pBuffSize.value,
          _pBuffSize,
          _bPrinterLen,
        ) ==
        0;

    if (isRawBuffFail) {
      throw 'Read printer raw buffer fail';
    }
  }

  Iterable<WindowsPrinterInfo> parse() sync* {
    for (var i = 0; i < _bPrinterLen.value; i++) {
      final printer = _rawBuffer.cast<PRINTER_INFO_2>().elementAt(i);
      yield printer.ref.info;
    }
  }
}
