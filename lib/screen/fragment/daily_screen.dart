import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tims_logistics/src/model/daily_model.dart';
import 'package:tims_logistics/src/state/daily_state.dart';

import '../../src/presenter/daily_presenter.dart';
import 'loading.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({Key? key}) : super(key: key);

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> implements DailyState {
  late DailyModel _dailyModel;
  late DailyPresenter _dailyPresenter;

  _DailyScreenState() {
    _dailyPresenter = DailyPresenter();
  }

  @override
  void initState() {
    super.initState();
    _dailyPresenter.view = this;
  }

  @override
  Widget build(BuildContext context) {
    return _dailyModel.isloading
        ? const Loading()
        : SafeArea(
            child: Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                child: Column(
                  children: [
                    Container(
                      color: Colors.blue,
                      padding:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Icon(LineIcons.arrowLeft,
                                color: Colors.white, size: 30),
                          ),
                          const Text(
                            'Data daily',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      color: const Color(0xffecedf2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 13,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    //blurRadius: 3,
                                    //spreadRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "12.00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "14.00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "total inbound",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "total outbound",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: const Center(
                                      child: Text(
                                        "Inbound",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 13,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    //blurRadius: 3,
                                    //spreadRadius: 1,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "12.00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "14.00",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "total inbound",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "total outbound",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange),
                                    child: const Center(
                                      child: Text(
                                        "Outbound",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void onError(String error) {}

  @override
  void onSuccess(String success) {}

  @override
  void refreshData(DailyModel dailyModel) {
    setState(() {
      _dailyModel = dailyModel;
    });
  }
}
