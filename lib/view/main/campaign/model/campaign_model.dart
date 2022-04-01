import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignModel {
  static List<CampaignModel> maptoList(
      {QuerySnapshot<Map<String, dynamic>>? map}) {
    List<CampaignModel> campaignList = [];
    map!.docs.forEach((element) {
      campaignList.add(CampaignModel.fromMap(element.data()));
    });
    campaignList.sort((a, b) => b.campaignDate!.compareTo(a.campaignDate!));
    return campaignList;
  }

  String? campaignId;
  String? campaignTitle;
  String? campaignContent;
  String? campaignFoto;
  Timestamp? campaignDate;

  CampaignModel(
      {this.campaignId,
      this.campaignTitle,
      this.campaignContent,
      this.campaignDate,
      this.campaignFoto});

  CampaignModel.fromMap(Map<String, dynamic> map)
      : campaignId = map['kampanya_id'],
        campaignTitle = map['kampanya_baslik'],
        campaignContent = map['kampanya_icerik'],
        campaignFoto = map['kampanya_foto'],
        campaignDate = map['kampanya_tarih'];
}
