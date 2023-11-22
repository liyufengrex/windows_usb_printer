# windows_usb_printer

flutter 能力提供：（Windows 平台） 
+ 搜索 Windows 端已安装的打印机（驱动），获取打印机名称
+ 通过打印机名称，向打印机发送打印任务

### 使用方法

```dart
//添加依赖
windows_usb_printer: ^0.0.1
```

### 提供API方法

#### 1.搜索本机已安装的打印机驱动
```dart
List<WindowsPrinterInfo> printerList = await WindowsUsbPrinterProvider.queryLocalUsbDevice()
for (var printer in printerList) {
  // 打印已安装驱动的打印机名称
  log(printer.pPrinterName);
}
```


#### 2.向指定打印机发送打印任务
```dart
// pPrinterName 即上面方法获取到的打印机名称
// data 是打印内容的字节数据，类型为 List<int>
WindowsUsbPrinterProvider.usbWrite(pPrinterName,data)
```

> 完整的 demo 示例可查阅： https://github.com/liyufengrex/flutter_printer_plus 中 example。 包含了 Android 、 Windows 示例。