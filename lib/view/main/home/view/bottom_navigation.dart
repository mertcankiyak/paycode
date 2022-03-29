import 'package:flutter/material.dart';
import 'package:paycode/core/constants/colors.dart';
import 'package:paycode/core/init/theme/theme_notifier.dart';
import 'package:paycode/view/main/barcode/view/barcode_view.dart';
import 'package:paycode/view/main/basket/view/basket_view.dart';
import 'package:paycode/view/main/campaign/view/campaign_view.dart';
import 'package:paycode/view/main/home/view/home_view.dart';
import 'package:paycode/view/main/profile/view/profile_view.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  SelectedItem selectedItem = SelectedItem();
  HomeView? _homeView;
  CampaingView? _campaingView;
  BarcodeView? _barcodeView;
  BasketView? _basketView;
  ProfileView? _profileView;
  List<Widget>? sayfalarim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeView = HomeView();
    _campaingView = CampaingView();
    _barcodeView = BarcodeView();
    _basketView = BasketView();
    _profileView = ProfileView();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstantColors.bodyColor,
        body: IndexedStack(
          children: [
            _homeView!,
            _campaingView!,
            _basketView!,
            _profileView!,
          ],
          index: selectedItem.selectedItemIndex,
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          color: ConstantColors.bodyColor,
          child: Container(
            height: 90,
            child: IconTheme(
              data:
                  IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedItem.selectedItemIndex = 0;
                              selectedItem.selectedItemText = "Anasayfa";
                            });
                          },
                          icon: Icon(
                            Icons.home_rounded,
                            size: 30,
                            color: selectedItem.selectedItemIndex == 0
                                ? ConstantColors.softBlackColor
                                : ConstantColors.softPurple,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedItem.selectedItemIndex = 1;
                              selectedItem.selectedItemText = "Kampanyalar";
                            });
                          },
                          icon: Icon(
                            Icons.campaign_sharp,
                            size: 30,
                            color: selectedItem.selectedItemIndex == 1
                                ? ConstantColors.softBlackColor
                                : ConstantColors.softPurple,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ConstantColors.bottomBarGreenIconColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Image.asset(
                              "assets/images/barcode-scanner.png",
                              scale: 18,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedItem.selectedItemIndex = 2;
                              selectedItem.selectedItemText = "Sepetim";
                            });
                          },
                          icon: Icon(
                            Icons.shopping_basket,
                            size: 30,
                            color: selectedItem.selectedItemIndex == 2
                                ? ConstantColors.softBlackColor
                                : ConstantColors.softPurple,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              selectedItem.selectedItemIndex = 3;
                              selectedItem.selectedItemText = "Profil";
                            });
                          },
                          icon: Icon(
                            Icons.person,
                            size: 30,
                            color: selectedItem.selectedItemIndex == 3
                                ? ConstantColors.softBlackColor
                                : ConstantColors.softPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedItem {
  //Singleton
  static final SelectedItem _selectedItem = SelectedItem._init();

  factory SelectedItem() {
    return _selectedItem;
  }

  SelectedItem._init();

  String? selectedItemText = "Anasayfa";
  int? selectedItemIndex = 0;
}
