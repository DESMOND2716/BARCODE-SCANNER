import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class  QRSCANNER extends StatefulWidget {
  @override
  _QRSCANNERState createState() => _QRSCANNERState();
}

class _QRSCANNERState extends State< QRSCANNER> {

 String _scanBarcode = '';
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.cyan,
          onPrimary: Colors.black
        ),
        onPressed:  () => scanBarcodeNormal(),

       icon: Icon(Icons.camera_alt),
      
       label: Text('Scan Now')),
       SizedBox(height: 20,),
       SelectableText(
         // ignore: unnecessary_null_comparison
         _scanBarcode == null ? 'Scan a code !' : 'Scan now \n\n\n $_scanBarcode', style: TextStyle(fontSize: 20),)

          ],
        ),
      ),
    );
  }

     Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }}