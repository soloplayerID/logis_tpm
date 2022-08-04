class HomeModel {
  bool isloading = false;
  bool isSuccess = false;
  String nama = "";
  String namaMenu = "";
  String selectedMenu = "Dashboard";
  List<MenuHome> menuHome = [
    MenuHome("Dashboard", true),
    MenuHome("Input", false),
    MenuHome("Project", false),
    MenuHome("akun", false),
  ];
}

class MenuHome {
  late String name;
  late bool menuActive;
  MenuHome(this.name, this.menuActive);
}
