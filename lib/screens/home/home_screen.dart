import 'package:beavers_prototype/screens/login/login_page.dart';
import 'package:beavers_prototype/utils/colors.dart';
import 'package:beavers_prototype/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      hintText: '??? ??????',
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
                        "????????? ????????? ??????",
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
                    '?????? ????????? ?????? ??????',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.05,
                        height: height * 0.03,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        '?????? ?????????',
                        style: mainTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.05,
                        height: height * 0.03,
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        '?????? ??? ????????? ??????',
                        style: mainTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.05,
                        height: height * 0.03,
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        '???????????? ?????? 1??????',
                        style: mainTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.05,
                        height: height * 0.03,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        '???????????? ????????????(20??????)',
                        style: mainTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width * 0.05,
                        height: height * 0.03,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        '?????? ?????? ??? ??????',
                        style: mainTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
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
