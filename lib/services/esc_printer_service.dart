import 'dart:io';
import 'dart:typed_data';

// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class ESCPrinterService {
  final Uint8List? receipt;
  final String ip;
  final int port;

  List<int>? _bytes;

  List<int> get bytes => _bytes ?? [];
  PaperSize? _paperSize;
  CapabilityProfile? _profile;

  ESCPrinterService(this.ip, this.port, this.receipt);

  Future<List<int>> getBytes({
    PaperSize paperSize: PaperSize.mm58,
    CapabilityProfile? profile,
  }) async {
    List<int> bytes = [];
    _profile = profile ?? (await CapabilityProfile.load());
    _paperSize = paperSize;

    assert(receipt != null);
    assert(_paperSize != null);
    assert(_profile != null);

    Generator generator = Generator(_paperSize!, _profile!);

    final _img = img.decodeImage(receipt!);

    bytes += generator.image(_img!);
    bytes += generator.cut();
    bytes += generator.reset();

    return bytes;
  }

  Future<bool> startPrint({List<int>? data}) async {
    if (data != null) {
      _bytes = data;
    } else if (_bytes == null) {
      _bytes = await getBytes(paperSize: PaperSize.mm80);
    }

    //final socket = await Socket.connect(ip, port);
    final socket = await Socket.connect(ip, port);

    socket.add(_bytes ?? []);
    //socket.flush();
    socket.close();

    return true;
  }

// startBluePrint({List<int> data}) async {
//   if (data != null) {
//     _bytes = data;
//   } else if (_bytes == null) {
//     _bytes = await getBytes(paperSize: PaperSize.mm58);
//   }
//
//   BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
//   var isConnected = await bluetooth.isConnected;
//   if (isConnected) {
//     bluetooth.writeBytes(Uint8List.fromList(_bytes));
//     bluetooth.disconnect();
//   }
//   BluetoothDevice device = BluetoothDevice.fromJson({
//     "name": "BlueTooth Printer",
//     "address": "66:22:DC:52:98:AF",
//     "type": 0,
//     "connected": true,
//   });
//   bluetoothPrint.connect(device);
//   var connected = await bluetoothPrint.isConnected;
//   print("connected $connected");
//   Map<String, dynamic> config = Map();
//   List<LineText> list = [];
//   list.add(LineText(
//       type: LineText.TYPE_TEXT,
//       content: 'A Title',
//       weight: 1,
//       align: LineText.ALIGN_CENTER,
//       linefeed: 1));
//   await bluetoothPrint.printReceipt(config, list);
//   await bluetoothPrint.disconnect();
//
//   var p = proto.BluetoothDevice(
//       name: "BlueTooth Printer",
//       remoteId: "66:22:DC:52:98:AF",
//       type: proto.BluetoothDevice_Type.DUAL);
//
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//
//   var devices = await flutterBlue.connectedDevices;
//   print(devices);
//   var p = proto.BluetoothDevice(
//       name: "BlueTooth Printer",
//       remoteId: "66:22:DC:52:98:AF",
//       type: proto.BluetoothDevice_Type.DUAL);
//   BluetoothDevice device = BluetoothDevice.fromProto(p);
//   // var device = devices?.first;
//   if (device != null) {
//     // Connect to the device
//     await device.requestMtu(12);
//     await device.connect(timeout: const Duration(seconds: 10));
//     List<BluetoothService> services = await device.discoverServices();
//     print(" services $services");
//   var service = services?.first;
//     if (service != null) {
//       var characters = service?.characteristics;
//       var character = characters?.first;
//       if (character != null) {
//         var descriptors = character.descriptors;
//         var descriptor = descriptors?.first;
//         if (descriptor != null) {
//           descriptor.write(bytes);
//           device.disconnect();
//         }
//         // await character.write(_bytes);
//         // Disconnect from device
//         // device.disconnect();
//       }
//     }
//   }
// }
}
