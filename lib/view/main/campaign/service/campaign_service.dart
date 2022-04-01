import 'package:paycode/view/main/campaign/base/campaign_base.dart';
import 'package:paycode/view/main/campaign/model/campaign_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignService implements CampaignBASE {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<CampaignModel>> getAllCampaign() async {
    try {
      QuerySnapshot<Map<String, dynamic>> campaignMap =
          await _firebaseFirestore.collection("kampanyalar").get();
      return CampaignModel.maptoList(map: campaignMap);
    } catch (e) {
      throw "Campaign Service getAllCampaign Error: " + e.toString();
    }
  }
}
