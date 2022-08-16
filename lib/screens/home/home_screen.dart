import 'package:beavers_prototype/screens/login/login_page.dart';
import 'package:beavers_prototype/utils/colors.dart';
import 'package:beavers_prototype/utils/style.dart';
import 'package:beavers_prototype/method/board_api.dart';
import 'package:beavers_prototype/widget/apartment_complex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _mainBannerTabController;

  @override
  void initState() {
    super.initState();
    _mainBannerTabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _mainBannerTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: mobileBackgroundColor,
            actions: [
              IconButton(
                icon: const Icon(
                  CupertinoIcons.bell,
                ),
                onPressed: () {},
                color: Colors.black,
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.settings,
                ),
                onPressed: () {},
                color: Colors.black,
              ),
            ],
            elevation: 0,
            title: const Text(
              '비버홈',
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const TextField(
                    decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: '댐 검색',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: primaryColor,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10.0,
                          ),
                        ),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        "오늘의 당첨자 발표",
                        style: mainTextStyle,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/beaver_character.png',
                          width: width * 0.15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: TabBarView(
                            controller: _mainBannerTabController,
                            children: [
                              Image.asset(
                                'assets/images/banner_1.jpg',
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                'assets/images/banner_2.jpg',
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                'assets/images/banner_3.jpg',
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 230,
                        child: Column(
                          children: [
                            Spacer(),
                            TabPageSelector(
                              controller: _mainBannerTabController,
                              selectedColor: secondaryColor,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    '최근 당첨자 발표 단지',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  FutureBuilder(
                    future: getApts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: height * 0.5,
                          child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AptComAno(
                                deviceWidth: width,
                                deviceHeight: height,
                                name: snapshot.data[index]['name'],
                                announceDate: snapshot.data[index]
                                    ['announce_date'],
                                moveIntoDate: snapshot.data[index]
                                    ['move_into_date'],
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  // ListView.builder(
                  //   itemCount: ,
                  //   itemBuilder: itemBuilder)

                  // Row(
                  //   children: [
                  //     Container(
                  //       width: width * 0.05,
                  //       height: height * 0.03,
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: width * 0.05,
                  //     ),
                  //     Text(
                  //       '봉담 파라곤',
                  //       style: mainTextStyle,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: width * 0.05,
                  //       height: height * 0.03,
                  //       decoration: BoxDecoration(
                  //         color: Colors.green,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: width * 0.05,
                  //     ),
                  //     Text(
                  //       '주영 더 팰리스 지븐',
                  //       style: mainTextStyle,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: width * 0.05,
                  //       height: height * 0.03,
                  //       decoration: BoxDecoration(
                  //         color: Colors.green,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: width * 0.05,
                  //     ),
                  //     Text(
                  //       '트리마제 순천 1단지',
                  //       style: mainTextStyle,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: width * 0.05,
                  //       height: height * 0.03,
                  //       decoration: BoxDecoration(
                  //         color: Colors.blue,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: width * 0.05,
                  //     ),
                  //     Text(
                  //       '강서자이 에고델타(20블록)',
                  //       style: mainTextStyle,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: width * 0.05,
                  //       height: height * 0.03,
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: width * 0.05,
                  //     ),
                  //     Text(
                  //       '포항 자이 더 시티',
                  //       style: mainTextStyle,
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
