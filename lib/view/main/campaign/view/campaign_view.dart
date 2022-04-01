import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/constants/size.dart';
import 'package:paycode/core/extensions/size_extension.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/main/campaign/model/campaign_model.dart';
import 'package:paycode/view/main/campaign/viewmodel/campaign_viewmodel.dart';
import 'package:provider/provider.dart';

class CampaingView extends StatefulWidget {
  const CampaingView({Key? key}) : super(key: key);

  @override
  State<CampaingView> createState() => _CampaingViewState();
}

class _CampaingViewState extends State<CampaingView> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _campaignViewModel = Provider.of<CampaignViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.mediumPadding,
          child: Text(
            "Kampanyalar",
            style: theme!.themeData!.textTheme.headline6,
            maxLines: 1,
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: _campaignViewModel.getAllCampaign(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CampaignModel>> snapshots) {
              if (snapshots.hasData) {
                return ListView.builder(
                    itemCount: snapshots.data!.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: context.mediumPadding,
                        child: Container(
                          width: context.getWidth,
                          height: context.getHeight * 0.35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: context.minimumPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: Image.network(
                                    "https://www.getirecem.com/Uploads/Blog/Kampanya-Detaylari-e0f5.jpg",
                                    width: context.getWidth,
                                    height: context.getHeight * 0.2,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: context.getHeight * 0.01,
                                ),
                                Text(
                                  "Anında 25 TL İndirim",
                                  style: theme.themeData!.textTheme.headline6,
                                  maxLines: 1,
                                ),
                                SizedBox(
                                  height: context.getHeight * 0.01,
                                ),
                                Divider(
                                  height: 1,
                                ),
                                SizedBox(
                                  height: context.getHeight * 0.01,
                                ),
                                Expanded(
                                  child: Text(
                                    "İçerik yazısı için yapılmış demo bir yazıdır. Bu alanda ilgili kampanyalar hakkında broşür bilgisi yer alacak. Belki bir kampanya kodu da eklenebilir. Daha sonra farklı içerikler yer alabilir. İlk kampanya kodu daha deetaylıdırds ad asd asd asd asdasdasd asdsds",
                                    style: theme.themeData!.textTheme.headline4,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
