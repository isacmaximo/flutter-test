import 'package:app_test1/app/modules/home/pages/home_page.dart';
import 'package:app_test1/app/modules/home/pages/profile_page.dart';
import 'package:app_test1/app/modules/home/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  //Navigation bar
  @observable
  int currentPage = 0;

  List<Widget> pages = [
    HomePage(),
    RegisterPage(),
    ProfilePage(),
  ];

  @action
  void onSelectPage(int index) {
    currentPage = index;
  }
}
