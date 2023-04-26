import 'dart:io' as io;
import 'dart:typed_data' show Uint8List;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webcontent_converter/webcontent_converter.dart';
import 'package:webcontent_converter_example/services/demo.dart';
import 'package:webcontent_converter_example/services/esc_printer_service.dart';
import 'package:image/image.dart' as img;

// import 'package:webcontent_converter_example/services/webview_helper.dart';

const Map<int, String> Types = {
  1: "Short receipt",
  2: "Long receipt",
  3: "Simple ticket",
  4: "Complex ticket",
  10: "Test ticket",
};

class ContentToImageScreen extends StatefulWidget {
  @override
  _ContentToImageScreenState createState() => _ContentToImageScreenState();
}

class _ContentToImageScreenState extends State<ContentToImageScreen> {
  int _type = 1;
  String _ip = "192.168.117.211";
  int _port = 9100;
  Uint8List? _bytes;
  io.File? _file;
  bool _printing = false;

  late TextEditingController _ip_controller;
  late TextEditingController _port_controller;

  _handleIpChanged(String value) {
    setState(() {
      _ip = value;
    });
  }

  _handlePortChanged(String value) {
    setState(() {
      _port = int.parse(value);
    });
  }

  String _getContent(int? type) {
    final checkType = type ?? _type;

    switch (checkType) {
      case 1: return Demo.getShortReceiptContent();
      case 2: return Demo.getReceiptContent();
      case 3: return Demo.getTicketReceiptContent();
      case 4: return Demo.getComplexTicketReceiptContent();
      default: return Demo.getTestTicketContent();
    }
  }
  @override
  void initState() {
    super.initState();

    _ip_controller = TextEditingController(text: _ip);
    _port_controller = TextEditingController(text: _port.toString());

    _convert(null);
  }

  @override
  void dispose() {
    _ip_controller.dispose();
    _port_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Content to Image"),
        actions: [
          IconButton(
             icon: Icon(Icons.refresh),
             onPressed: () => _convert(null),
          ),
          _printing ? Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white,),
            ),
          ) : IconButton(
            icon: Icon(Icons.print),
            onPressed: () => _startPrintWireless(context),
          ),
          SizedBox(width: 40)
          // IconButton(
          //   icon: Icon(Icons.bluetooth),
          //   onPressed: () => _startPrintBluetooth(context),
          // ),
        ],
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            children: [
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: _ip_controller,
                          onSubmitted: _handleIpChanged,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Printer IP',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _port_controller,
                          onSubmitted: _handlePortChanged,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Port',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: DropdownButton<int>(
                        value: _type,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (int? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            _type = value!;
                          });

                          _convert(value);
                        },
                        items: Types.keys.map<DropdownMenuItem<int>>((int key) {
                          return DropdownMenuItem<int>(
                            value: key,
                            child: Text(Types[key]!),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              if (_file != null)
                Container(
                  width: 400,
                  alignment: Alignment.topCenter,
                  child: Image.memory(
                    _file!.readAsBytesSync(),
                  ),
                ),
              Divider(),
              if (_bytes?.isNotEmpty == true)
                Container(
                  width: 400,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Image.memory(_bytes!),
                )
            ],
          ),
        ),
      ),
    );
  }

  ///[convert html] content into bytes
  _convert(int? type) async {
    var stopwatch = Stopwatch()..start();

    setState(() {
      _bytes = null;
      _file = null;
    });

    WebcontentConverter.contentToImage(
      content: _getContent(type),
      executablePath: WebViewHelper.executablePath(),
      scale: 5
    ).then((bytes) {
      WebcontentConverter.logger.info("completed executed in ${stopwatch.elapsed}");

      if (bytes.isNotEmpty) {
        _saveFile(bytes);
        WebcontentConverter.logger.info("bytes.length ${bytes.length}");
      }
    });
  }

  ///[save bytes] into file
  _saveFile(Uint8List bytes) async {
    img.Image _img = img.decodeImage(bytes)!;

    //_img = img.copyResize(_img, width: 512, interpolation: img.Interpolation.nearest);
    //_img = img.flipHorizontal(_img);

    //_img = img.gaussianBlur(_img, 10);

    final result = Uint8List.fromList(img.encodePng(_img));

    setState(() => _bytes = result);

    if (kIsWeb) {
      return;
    }

    var dir = await getTemporaryDirectory();
    var path = join(dir.path, "receipt.jpg");

    io.File file = io.File(path);
    await file.writeAsBytes(result);

    WebcontentConverter.logger.info(file.path);

    setState(() => _file = file);
  }

  _startPrintWireless(BuildContext context) async {
    var p = ESCPrinterService(_ip, _port, _bytes);

    setState(() {
      _printing = true;
    });

    p.startPrint().catchError((e) {
      debugPrint(e.toString());

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Printing error"),
          content: Text(e.toString()),
        ),
        barrierDismissible: true,
      );
    }).whenComplete(() {
      setState(() {
        _printing = false;
      });
    });
  }

// _startPrintBluetooth(BuildContext context) {
//   // var p = ESCPrinterService(_bytes);
//   // p.startBluePrint();
// }
}
