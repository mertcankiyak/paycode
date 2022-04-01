import 'package:flutter/material.dart';
import 'package:paycode/locator.dart';
import 'package:paycode/view/main/campaign/base/campaign_base.dart';
import 'package:paycode/view/main/campaign/model/campaign_model.dart';
import 'package:paycode/view/main/campaign/service/campaign_service.dart';

class CampaignViewModel with ChangeNotifier implements CampaignBASE {
  CampaignService _campaignService = locator<CampaignService>();

  @override
  Future<List<CampaignModel>> getAllCampaign() async {
    try {
      return await _campaignService.getAllCampaign();
    } catch (e) {
      throw "Campaign Model Service Error: " + e.toString();
    }
  }
}
