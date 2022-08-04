import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tims_logistics/screen/fragment/dashboard_screen.dart';
import 'package:tims_logistics/src/model/home_model.dart';
import 'package:tims_logistics/src/presenter/home_presenter.dart';
import 'package:tims_logistics/src/state/home_state.dart';
import '../src/resources/session.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'fragment/daily_screen.dart';
import 'fragment/home/item_card.dart';
import 'fragment/loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin
    implements HomeState {
  late HomeModel _homeModel;
  late HomePresenter _homePresenter;
  late String idUser;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  _HomeState() {
    _homePresenter = HomePresenter();

    Session.checkUser().then((check) {
      if (check) {
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _homePresenter.view = this;
    Session.getName().then((value) {
      setState(() {
        _homeModel.nama = value.toString();
      });
    });
    Session.getId().then((value) {
      setState(() {
        idUser = value.toString();
      });
    });
  }

  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      Navigator.popAndPushNamed(context, '/home');
    });

    return;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homeModel.isloading
          ? const Loading()
          : SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                color: const Color(0xfff5f5f5),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 30, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "TPM ",
                                    style: GoogleFonts.poppins(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "LOGISTICS",
                                    style: GoogleFonts.poppins(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ),
                        )),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(15),
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                          color: Color(0xffecedf2),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // ProgressScreen(),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                height: 50,
                                color: const Color(0xffecedf2),
                                child: ListView.builder(
                                    itemCount: _homeModel.menuHome.length,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          _homePresenter.selectMenu(
                                              _homeModel.menuHome[index].name,
                                              index);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          margin:
                                              const EdgeInsets.only(left: 8),
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: _homeModel.selectedMenu ==
                                                      _homeModel
                                                          .menuHome[index].name
                                                  ? Colors.blue
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: Text(
                                            _homeModel.menuHome[index].name,
                                            style: TextStyle(
                                                color: _homeModel
                                                            .selectedMenu ==
                                                        _homeModel
                                                            .menuHome[index]
                                                            .name
                                                    ? Colors.white
                                                    : const Color(0xffA1A1A1)),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              _homeModel.selectedMenu == 'Dashboard'
                                  ? CarouselSlider(
                                      items: [
                                        ItemCard(
                                          title: 'Dashboard',
                                          svgSrc: 'assets/img/dashboard.svg',
                                          press: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return DashboardScreen();
                                              },
                                            ));
                                          },
                                        ),
                                        ItemCard(
                                          title: 'Daily',
                                          svgSrc: 'assets/img/calendar.svg',
                                          press: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return const DailyScreen();
                                              },
                                            ));
                                          },
                                        ),
                                      ],
                                      options: CarouselOptions(
                                        height: 220.0,
                                        enlargeCenterPage: true,
                                        autoPlay: true,
                                        aspectRatio: 16 / 9,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enableInfiniteScroll: false,
                                        autoPlayAnimationDuration:
                                            const Duration(seconds: 7),
                                        viewportFraction: 0.8,
                                      ),
                                    )
                                  : _homeModel.selectedMenu == 'Input'
                                      ? CarouselSlider(
                                          items: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              padding: const EdgeInsets.all(15),
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            Color(0xffaaaaaa),
                                                        blurRadius: 20,
                                                        spreadRadius: -12)
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 15),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              25),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black
                                                            .withOpacity(0.13),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        'assets/img/input.svg',
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.18,
                                                      )),
                                                  Text(
                                                    'Input',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue
                                                            .withOpacity(0.7)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                          options: CarouselOptions(
                                            height: 220.0,
                                            enlargeCenterPage: true,
                                            autoPlay: true,
                                            aspectRatio: 16 / 9,
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            enableInfiniteScroll: false,
                                            autoPlayAnimationDuration:
                                                const Duration(seconds: 7),
                                            viewportFraction: 0.8,
                                          ),
                                        )
                                      : _homeModel.selectedMenu == 'Project'
                                          ? CarouselSlider(
                                              items: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5.0),
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color(
                                                                    0xffaaaaaa),
                                                                blurRadius: 20,
                                                                spreadRadius:
                                                                    -12)
                                                          ],
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  bottom: 15),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(25),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.13),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/img/project.svg',
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.18,
                                                          )),
                                                      Text(
                                                        'Project',
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .blue
                                                                    .withOpacity(
                                                                        0.7)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                              options: CarouselOptions(
                                                height: 220.0,
                                                enlargeCenterPage: true,
                                                autoPlay: true,
                                                aspectRatio: 16 / 9,
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                enableInfiniteScroll: false,
                                                autoPlayAnimationDuration:
                                                    const Duration(seconds: 7),
                                                viewportFraction: 0.8,
                                              ),
                                            )
                                          : Container(),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("History",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff485460),
                                          wordSpacing: 4,
                                          letterSpacing: 1.5,
                                        ),
                                      )),
                                  InkWell(
                                    child: Text("Lihat semua",
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xff0066cc),
                                            wordSpacing: 4,
                                          ),
                                        )),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/profile_nilai");
                                    },
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // HistoryWidget(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void refreshData(HomeModel homeModel) {
    setState(() {
      _homeModel = homeModel;
    });
  }
}
