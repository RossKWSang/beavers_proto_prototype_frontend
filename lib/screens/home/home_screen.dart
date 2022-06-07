import 'package:beavers_prototype/screens/login/login_page.dart';
import 'package:beavers_prototype/utils/colors.dart';
import 'package:beavers_prototype/utils/style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Container(
              height: height * 0.07,
              width: width * 0.9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My 댐',
                          style: mainTextStyle,
                        ),
                        Text(
                          '오산세교 2지구 호반써밋',
                          style: mainTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/beaver_character.png',
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      0,
                      0,
                      10,
                    ),
                    child: Image.asset(
                      'assets/beaver_house.png',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.25,
              width: width * 0.40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '현재 단계',
                            style: mainTextStyle,
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              '서류접수중!\n(5/6~5/13)',
                              style: alertTextStyle,
                            ),
                          ),
                          Text(
                            '필요서류 확인하기',
                            style: subTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.15,
              width: width * 0.8,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/beaver_house.png',
                            color: primaryColor,
                          ),
                          Text(
                            '일정 확인하기',
                            style: subTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        '댐 입주까지\nD-720',
                        style: mainTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              height: height * 0.15,
              width: width * 0.8,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '비버 게시판',
                        style: mainTextStyle,
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        children: [
                          Container(
                            width: width * 0.15,
                            child: Text(
                              '# 대출',
                              style: subTextStyle,
                            ),
                          ),
                          Text(
                            '주택담보대출은 언제부터 받을 수 있나요?',
                            style: subTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: width * 0.15,
                            child: Text(
                              '# 인테리어',
                              style: subTextStyle,
                            ),
                          ),
                          Text(
                            '중문 확장 하실 분 있나요?',
                            style: subTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 40,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '질문하기',
                        style: mainTextStyle,
                      ),
                      Text(
                        '질문하기\n탭에 대한 설명',
                        style: subTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  Image.asset(
                    'assets/beaver_question.png',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
