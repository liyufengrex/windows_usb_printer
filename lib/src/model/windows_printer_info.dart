import 'dart:convert';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'windows_printer_dev_mode.dart';

class WindowsPrinterInfo {
  final String pServerName;

  final String pPrinterName;

  final String pShareName;

  final String pPortName;

  final String pDriverName;

  final String pComment;

  final String pLocation;

  final WindowsPrinterDevMode pDevMode;

  final String pSepFile;

  final String pPrintProcessor;

  final String pDatatype;

  final String pParameters;

  final int priority;

  final int startTime;

  final int untilTime;

  final int status;

  final int cJobs;

  WindowsPrinterInfo({
    required this.pServerName,
    required this.pPrinterName,
    required this.pShareName,
    required this.pPortName,
    required this.pDriverName,
    required this.pComment,
    required this.pLocation,
    required this.pSepFile,
    required this.pPrintProcessor,
    required this.pDatatype,
    required this.pParameters,
    required this.priority,
    required this.startTime,
    required this.untilTime,
    required this.status,
    required this.cJobs,
    required this.pDevMode,
  });

  WindowsPrinterInfo copyWith({
    String? pServerName,
    String? pPrinterName,
    String? pShareName,
    String? pPortName,
    String? pDriverName,
    String? pComment,
    String? pLocation,
    String? pSepFile,
    String? pPrintProcessor,
    String? pDatatype,
    String? pParameters,
    int? priority,
    int? startTime,
    int? untilTime,
    int? status,
    int? cJobs,
  }) {
    return WindowsPrinterInfo(
      pServerName: pServerName ?? this.pServerName,
      pPrinterName: pPrinterName ?? this.pPrinterName,
      pShareName: pShareName ?? this.pShareName,
      pPortName: pPortName ?? this.pPortName,
      pDriverName: pDriverName ?? this.pDriverName,
      pComment: pComment ?? this.pComment,
      pLocation: pLocation ?? this.pLocation,
      pSepFile: pSepFile ?? this.pSepFile,
      pPrintProcessor: pPrintProcessor ?? this.pPrintProcessor,
      pDatatype: pDatatype ?? this.pDatatype,
      pParameters: pParameters ?? this.pParameters,
      priority: priority ?? this.priority,
      startTime: startTime ?? this.startTime,
      untilTime: untilTime ?? this.untilTime,
      status: status ?? this.status,
      cJobs: cJobs ?? this.cJobs,
      pDevMode: pDevMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pServerName': pServerName,
      'pPrinterName': pPrinterName,
      'pShareName': pShareName,
      'pPortName': pPortName,
      'pDriverName': pDriverName,
      'pComment': pComment,
      'pLocation': pLocation,
      'pSepFile': pSepFile,
      'pPrintProcessor': pPrintProcessor,
      'pDatatype': pDatatype,
      'pParameters': pParameters,
      'priority': priority,
      'startTime': startTime,
      'untilTime': untilTime,
      'status': status,
      'cJobs': cJobs,
      'pDevMode': pDevMode.toMap(),
    };
  }

  factory WindowsPrinterInfo.fromMap(Map<String, dynamic> map) {
    return WindowsPrinterInfo(
      pServerName: map['pServerName'] ?? '',
      pPrinterName: map['pPrinterName'] ?? '',
      pShareName: map['pShareName'] ?? '',
      pPortName: map['pPortName'] ?? '',
      pDriverName: map['pDriverName'] ?? '',
      pComment: map['pComment'] ?? '',
      pLocation: map['pLocation'] ?? '',
      pSepFile: map['pSepFile'] ?? '',
      pPrintProcessor: map['pPrintProcessor'] ?? '',
      pDatatype: map['pDatatype'] ?? '',
      pParameters: map['pParameters'] ?? '',
      priority: map['priority']?.toInt() ?? 0,
      startTime: map['startTime']?.toInt() ?? 0,
      untilTime: map['untilTime']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      cJobs: map['cJobs']?.toInt() ?? 0,
      pDevMode: WindowsPrinterDevMode.fromMap(map['pDevMode']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WindowsPrinterInfo.fromJson(String source) =>
      WindowsPrinterInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WindowsPrinterInfo(pServerName: $pServerName, pPrinterName: $pPrinterName, pShareName: $pShareName, pPortName: $pPortName, pDriverName: $pDriverName, pComment: $pComment, pLocation: $pLocation, pSepFile: $pSepFile, pPrintProcessor: $pPrintProcessor, pDatatype: $pDatatype, pParameters: $pParameters, priority: $priority, startTime: $startTime, untilTime: $untilTime, status: $status, cJobs: $cJobs)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WindowsPrinterInfo &&
        other.pServerName == pServerName &&
        other.pPrinterName == pPrinterName &&
        other.pShareName == pShareName &&
        other.pPortName == pPortName &&
        other.pDriverName == pDriverName &&
        other.pComment == pComment &&
        other.pLocation == pLocation &&
        other.pSepFile == pSepFile &&
        other.pPrintProcessor == pPrintProcessor &&
        other.pDatatype == pDatatype &&
        other.pParameters == pParameters &&
        other.priority == priority &&
        other.startTime == startTime &&
        other.untilTime == untilTime &&
        other.status == status &&
        other.cJobs == cJobs;
  }

  @override
  int get hashCode {
    return pServerName.hashCode ^
        pPrinterName.hashCode ^
        pShareName.hashCode ^
        pPortName.hashCode ^
        pDriverName.hashCode ^
        pComment.hashCode ^
        pLocation.hashCode ^
        pSepFile.hashCode ^
        pPrintProcessor.hashCode ^
        pDatatype.hashCode ^
        pParameters.hashCode ^
        priority.hashCode ^
        startTime.hashCode ^
        untilTime.hashCode ^
        status.hashCode ^
        cJobs.hashCode;
  }
}

extension FfiWindowsPrinterInfoExt on PRINTER_INFO_2 {
  WindowsPrinterInfo get info {
    return WindowsPrinterInfo(
      cJobs: cJobs,
      pDevMode:
          pDevMode == nullptr ? WindowsPrinterDevMode() : pDevMode.ref.devMode,
      pServerName: pServerName == nullptr ? '' : pServerName.toDartString(),
      pComment: pComment == nullptr ? '' : pComment.toDartString(),
      pDatatype: pDatatype == nullptr ? '' : pDatatype.toDartString(),
      pDriverName: pDriverName == nullptr ? '' : pDriverName.toDartString(),
      pPortName: pPortName == nullptr ? '' : pPortName.toDartString(),
      pShareName: pShareName == nullptr ? '' : pShareName.toDartString(),
      pLocation: pLocation == nullptr ? '' : pLocation.toDartString(),
      pParameters: pParameters == nullptr ? '' : pParameters.toDartString(),
      pPrintProcessor:
          pPrintProcessor == nullptr ? '' : pPrintProcessor.toDartString(),
      pPrinterName: pPrinterName == nullptr ? '' : pPrinterName.toDartString(),
      pSepFile: pSepFile == nullptr ? '' : pSepFile.toDartString(),
      priority: Priority,
      startTime: StartTime,
      status: Status,
      untilTime: UntilTime,
    );
  }
}
