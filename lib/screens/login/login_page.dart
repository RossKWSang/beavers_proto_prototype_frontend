// ignore_for_file: unnecessary_const

import 'package:beavers_prototype/screens/main_screen.dart';
import 'package:beavers_prototype/utils/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  static const String loginEmail = 'demo@beavers.com';
  static const String loginPassword = 'beavers1234';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _pwController.dispose();
  }

  void userAuthentication() {
    print(_idController.text);
    // print(_pwController.text);
    if (_idController.text == loginEmail &&
        _pwController.text == loginPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const MainScreen(),
        ),
      );
    } else if (_idController.text != '' || _pwController.text != '') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '아이디 / 비밀번호를 모두 입력하십시오!',
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '잘못된 아이디 또는 비밀번호를 입력하셨습니다!',
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: width,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.10,
              ),
              const Text(
                '국내 최초 청약 커뮤니티',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Text(
                '비버스',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Container(
                // width: width * 0.8,
                child: TextField(
                  controller: _idController,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    hintText: '아이디',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          18.0,
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
                          18.0,
                        ),
                      ),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: secondaryColor,
                      ),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 16,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextField(
                controller: _pwController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  hintText: '비밀번호',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        18.0,
                      ),
                    ),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: primaryColor,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        18.0,
                      ),
                    ),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: secondaryColor,
                    ),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 16,
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ElevatedButton(
                onPressed: () {
                  userAuthentication();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: const Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        18.0,
                      ),
                      side: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  backgroundColor:
                      (_idController.text != '' && _pwController.text != '')
                          ? MaterialStateProperty.all(primaryColor)
                          : MaterialStateProperty.all(greyBackgroundColor),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: greyTextColor,
                    ),
                    child: Text('회원가입'),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: greyTextColor,
                    ),
                    child: Text('아이디/비밀번호 찾기'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
