import 'package:flutter/material.dart';

class BarcodeView extends StatefulWidget {
  const BarcodeView({Key? key}) : super(key: key);

  @override
  State<BarcodeView> createState() => _BarcodeViewState();
}

class _BarcodeViewState extends State<BarcodeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Barcode View"),
    );
  }
}
