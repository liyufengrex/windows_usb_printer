import 'dart:convert';
import 'package:win32/win32.dart';

class WindowsPrinterDevMode {
  final String dmDeviceName;
  final int dmSpecVersion;

  final int dmDriverVersion;

  final int dmSize;

  final int dmDriverExtra;

  final int dmFields;

  final int dmColor;

  final int dmDuplex;

  final int dmYResolution;

  final int dmTTOption;

  final int dmCollate;

  final String dmFormName;

  final int dmLogPixels;

  final int dmBitsPerPel;

  final int dmPelsWidth;

  final int dmPelsHeight;

  final int dmDisplayFrequency;

  final int dmICMMethod;

  final int dmICMIntent;

  final int dmMediaType;

  final int dmDitherType;

  final int dmReserved1;

  final int dmReserved2;

  final int dmPanningWidth;

  final int dmPanningHeight;
  WindowsPrinterDevMode({
    this.dmFormName = '',
    this.dmDeviceName = '',
    this.dmSpecVersion = 0,
    this.dmDriverVersion = 0,
    this.dmSize = 0,
    this.dmDriverExtra = 0,
    this.dmFields = 0,
    this.dmColor = 0,
    this.dmDuplex = 0,
    this.dmYResolution = 0,
    this.dmTTOption = 0,
    this.dmCollate = 0,
    this.dmLogPixels = 0,
    this.dmBitsPerPel = 0,
    this.dmPelsWidth = 0,
    this.dmPelsHeight = 0,
    this.dmDisplayFrequency = 0,
    this.dmICMMethod = 0,
    this.dmICMIntent = 0,
    this.dmMediaType = 0,
    this.dmDitherType = 0,
    this.dmReserved1 = 0,
    this.dmReserved2 = 0,
    this.dmPanningWidth = 0,
    this.dmPanningHeight = 0,
  });

  WindowsPrinterDevMode copyWith({
    String? dmDeviceName,
    int? dmSpecVersion,
    int? dmDriverVersion,
    int? dmSize,
    int? dmDriverExtra,
    int? dmFields,
    int? dmColor,
    int? dmDuplex,
    int? dmYResolution,
    int? dmTTOption,
    int? dmCollate,
    int? dmLogPixels,
    int? dmBitsPerPel,
    int? dmPelsWidth,
    int? dmPelsHeight,
    int? dmDisplayFrequency,
    int? dmICMMethod,
    int? dmICMIntent,
    int? dmMediaType,
    int? dmDitherType,
    int? dmReserved1,
    int? dmReserved2,
    int? dmPanningWidth,
    int? dmPanningHeight,
  }) {
    return WindowsPrinterDevMode(
      dmFormName: dmFormName,
      dmDeviceName: dmDeviceName ?? this.dmDeviceName,
      dmSpecVersion: dmSpecVersion ?? this.dmSpecVersion,
      dmDriverVersion: dmDriverVersion ?? this.dmDriverVersion,
      dmSize: dmSize ?? this.dmSize,
      dmDriverExtra: dmDriverExtra ?? this.dmDriverExtra,
      dmFields: dmFields ?? this.dmFields,
      dmColor: dmColor ?? this.dmColor,
      dmDuplex: dmDuplex ?? this.dmDuplex,
      dmYResolution: dmYResolution ?? this.dmYResolution,
      dmTTOption: dmTTOption ?? this.dmTTOption,
      dmCollate: dmCollate ?? this.dmCollate,
      dmLogPixels: dmLogPixels ?? this.dmLogPixels,
      dmBitsPerPel: dmBitsPerPel ?? this.dmBitsPerPel,
      dmPelsWidth: dmPelsWidth ?? this.dmPelsWidth,
      dmPelsHeight: dmPelsHeight ?? this.dmPelsHeight,
      dmDisplayFrequency: dmDisplayFrequency ?? this.dmDisplayFrequency,
      dmICMMethod: dmICMMethod ?? this.dmICMMethod,
      dmICMIntent: dmICMIntent ?? this.dmICMIntent,
      dmMediaType: dmMediaType ?? this.dmMediaType,
      dmDitherType: dmDitherType ?? this.dmDitherType,
      dmReserved1: dmReserved1 ?? this.dmReserved1,
      dmReserved2: dmReserved2 ?? this.dmReserved2,
      dmPanningWidth: dmPanningWidth ?? this.dmPanningWidth,
      dmPanningHeight: dmPanningHeight ?? this.dmPanningHeight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dmFormName': dmFormName,
      'dmDeviceName': dmDeviceName,
      'dmSpecVersion': dmSpecVersion,
      'dmDriverVersion': dmDriverVersion,
      'dmSize': dmSize,
      'dmDriverExtra': dmDriverExtra,
      'dmFields': dmFields,
      'dmColor': dmColor,
      'dmDuplex': dmDuplex,
      'dmYResolution': dmYResolution,
      'dmTTOption': dmTTOption,
      'dmCollate': dmCollate,
      'dmLogPixels': dmLogPixels,
      'dmBitsPerPel': dmBitsPerPel,
      'dmPelsWidth': dmPelsWidth,
      'dmPelsHeight': dmPelsHeight,
      'dmDisplayFrequency': dmDisplayFrequency,
      'dmICMMethod': dmICMMethod,
      'dmICMIntent': dmICMIntent,
      'dmMediaType': dmMediaType,
      'dmDitherType': dmDitherType,
      'dmReserved1': dmReserved1,
      'dmReserved2': dmReserved2,
      'dmPanningWidth': dmPanningWidth,
      'dmPanningHeight': dmPanningHeight,
    };
  }

  factory WindowsPrinterDevMode.fromMap(Map<String, dynamic> map) {
    return WindowsPrinterDevMode(
      dmFormName: map['dbFormName'] ?? '',
      dmDeviceName: map['dmDeviceName'] ?? '',
      dmSpecVersion: map['dmSpecVersion']?.toInt() ?? 0,
      dmDriverVersion: map['dmDriverVersion']?.toInt() ?? 0,
      dmSize: map['dmSize']?.toInt() ?? 0,
      dmDriverExtra: map['dmDriverExtra']?.toInt() ?? 0,
      dmFields: map['dmFields']?.toInt() ?? 0,
      dmColor: map['dmColor']?.toInt() ?? 0,
      dmDuplex: map['dmDuplex']?.toInt() ?? 0,
      dmYResolution: map['dmYResolution']?.toInt() ?? 0,
      dmTTOption: map['dmTTOption']?.toInt() ?? 0,
      dmCollate: map['dmCollate']?.toInt() ?? 0,
      dmLogPixels: map['dmLogPixels']?.toInt() ?? 0,
      dmBitsPerPel: map['dmBitsPerPel']?.toInt() ?? 0,
      dmPelsWidth: map['dmPelsWidth']?.toInt() ?? 0,
      dmPelsHeight: map['dmPelsHeight']?.toInt() ?? 0,
      dmDisplayFrequency: map['dmDisplayFrequency']?.toInt() ?? 0,
      dmICMMethod: map['dmICMMethod']?.toInt() ?? 0,
      dmICMIntent: map['dmICMIntent']?.toInt() ?? 0,
      dmMediaType: map['dmMediaType']?.toInt() ?? 0,
      dmDitherType: map['dmDitherType']?.toInt() ?? 0,
      dmReserved1: map['dmReserved1']?.toInt() ?? 0,
      dmReserved2: map['dmReserved2']?.toInt() ?? 0,
      dmPanningWidth: map['dmPanningWidth']?.toInt() ?? 0,
      dmPanningHeight: map['dmPanningHeight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WindowsPrinterDevMode.fromJson(String source) =>
      WindowsPrinterDevMode.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WindowsPrinterDevMode(dmDeviceName: $dmDeviceName, dmSpecVersion: $dmSpecVersion, dmDriverVersion: $dmDriverVersion, dmSize: $dmSize, dmDriverExtra: $dmDriverExtra, dmFields: $dmFields, dmColor: $dmColor, dmDuplex: $dmDuplex, dmYResolution: $dmYResolution, dmTTOption: $dmTTOption, dmCollate: $dmCollate, dmLogPixels: $dmLogPixels, dmBitsPerPel: $dmBitsPerPel, dmPelsWidth: $dmPelsWidth, dmPelsHeight: $dmPelsHeight, dmDisplayFrequency: $dmDisplayFrequency, dmICMMethod: $dmICMMethod, dmICMIntent: $dmICMIntent, dmMediaType: $dmMediaType, dmDitherType: $dmDitherType, dmReserved1: $dmReserved1, dmReserved2: $dmReserved2, dmPanningWidth: $dmPanningWidth, dmPanningHeight: $dmPanningHeight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WindowsPrinterDevMode &&
        other.dmDeviceName == dmDeviceName &&
        other.dmSpecVersion == dmSpecVersion &&
        other.dmDriverVersion == dmDriverVersion &&
        other.dmSize == dmSize &&
        other.dmDriverExtra == dmDriverExtra &&
        other.dmFields == dmFields &&
        other.dmColor == dmColor &&
        other.dmDuplex == dmDuplex &&
        other.dmYResolution == dmYResolution &&
        other.dmTTOption == dmTTOption &&
        other.dmCollate == dmCollate &&
        other.dmLogPixels == dmLogPixels &&
        other.dmBitsPerPel == dmBitsPerPel &&
        other.dmPelsWidth == dmPelsWidth &&
        other.dmPelsHeight == dmPelsHeight &&
        other.dmDisplayFrequency == dmDisplayFrequency &&
        other.dmICMMethod == dmICMMethod &&
        other.dmICMIntent == dmICMIntent &&
        other.dmMediaType == dmMediaType &&
        other.dmDitherType == dmDitherType &&
        other.dmReserved1 == dmReserved1 &&
        other.dmReserved2 == dmReserved2 &&
        other.dmPanningWidth == dmPanningWidth &&
        other.dmPanningHeight == dmPanningHeight;
  }

  @override
  int get hashCode {
    return dmDeviceName.hashCode ^
        dmSpecVersion.hashCode ^
        dmDriverVersion.hashCode ^
        dmSize.hashCode ^
        dmDriverExtra.hashCode ^
        dmFields.hashCode ^
        dmColor.hashCode ^
        dmDuplex.hashCode ^
        dmYResolution.hashCode ^
        dmTTOption.hashCode ^
        dmCollate.hashCode ^
        dmLogPixels.hashCode ^
        dmBitsPerPel.hashCode ^
        dmPelsWidth.hashCode ^
        dmPelsHeight.hashCode ^
        dmDisplayFrequency.hashCode ^
        dmICMMethod.hashCode ^
        dmICMIntent.hashCode ^
        dmMediaType.hashCode ^
        dmDitherType.hashCode ^
        dmReserved1.hashCode ^
        dmReserved2.hashCode ^
        dmPanningWidth.hashCode ^
        dmPanningHeight.hashCode;
  }
}

extension DevModeExt on DEVMODE {
  WindowsPrinterDevMode get devMode {
    return WindowsPrinterDevMode(
      dmDeviceName: dmDeviceName,
      dmFormName: dmFormName,
      dmSpecVersion: dmSpecVersion,
      dmDriverVersion: dmDriverVersion,
      dmSize: dmSize,
      dmDriverExtra: dmDriverExtra,
      dmFields: dmFields,
      dmColor: dmColor,
      dmDuplex: dmDuplex,
      dmYResolution: dmYResolution,
      dmTTOption: dmTTOption,
      dmCollate: dmCollate,
      dmLogPixels: dmLogPixels,
      dmBitsPerPel: dmBitsPerPel,
      dmPelsWidth: dmPelsWidth,
      dmPelsHeight: dmPelsHeight,
      dmDisplayFrequency: dmDisplayFrequency,
      dmICMMethod: dmICMMethod,
      dmICMIntent: dmICMIntent,
      dmMediaType: dmMediaType,
      dmDitherType: dmDitherType,
      dmReserved1: dmReserved1,
      dmReserved2: dmReserved2,
      dmPanningWidth: dmPanningWidth,
      dmPanningHeight: dmPanningHeight,
    );
  }
}
