import 'package:flutter/material.dart';

class CampaingView extends StatefulWidget {
  const CampaingView({Key? key}) : super(key: key);

  @override
  State<CampaingView> createState() => _CampaingViewState();
}

class _CampaingViewState extends State<CampaingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Campaign View"),
    );
  }
}
