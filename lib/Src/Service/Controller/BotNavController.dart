import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Screen/Page/Home.dart';
import '../../Screen/Page/SearchScreen.dart';
import '../../Screen/Page/WatchListScreen.dart';

class BottomNavigatorController extends GetxController {
  var screens = [
    HomeScreen(),
    const SearchScreen(),
    WatchList(),
  ];
  var index = 0.obs;
  void setIndex(indx) => index.value = indx;
}
