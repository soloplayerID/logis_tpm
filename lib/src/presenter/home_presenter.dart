// ignore_for_file: avoid_print

import 'package:tims_logistics/src/model/home_model.dart';
import 'package:tims_logistics/src/state/home_state.dart';

abstract class HomePresenterAbstract {
  set view(HomeState view) {}
  void getData() {}
  void selectMenu(String namaMenu, int index) {}
}

class HomePresenter implements HomePresenterAbstract {
  final HomeModel _homeModel = HomeModel();
  late HomeState _homeState;

  @override
  void getData() {}

  @override
  set view(HomeState view) {
    _homeState = view;
    _homeState.refreshData(_homeModel);
  }

  @override
  void selectMenu(String namaMenu, int index) {
    _homeModel.isloading = true;
    _homeState.refreshData(_homeModel);
    _homeModel.menuHome[0].menuActive = false;
    _homeModel.menuHome[1].menuActive = false;
    _homeModel.menuHome[2].menuActive = false;
    _homeState.refreshData(_homeModel);
    // print('true ={$index}');
    _homeModel.selectedMenu = namaMenu;
    _homeModel.menuHome[index].menuActive = true;
    _homeModel.isloading = false;
    _homeState.refreshData(_homeModel);
  }
}
