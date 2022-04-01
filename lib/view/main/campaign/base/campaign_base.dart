import 'package:paycode/view/main/campaign/model/campaign_model.dart';

abstract class CampaignBASE {
  Future<List<CampaignModel>> getAllCampaign();
}
