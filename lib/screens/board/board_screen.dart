import 'package:beavers_prototype/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatefulWidget {
  BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  DateTime now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    print(now);
    return SafeArea(
      child: DefaultTabController(
        length: 10,
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
            title: Text(
              '비버게시판',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            elevation: 0,
            bottom: const TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  text: '전체',
                ),
                Tab(
                  text: '대출',
                ),
                Tab(
                  text: '서류/자격요건/계약',
                ),
                Tab(
                  text: '분양가/시세',
                ),
                Tab(
                  text: '교통/학교/인프라',
                ),
                Tab(
                  text: '옵션/인테리어',
                ),
                Tab(
                  text: '시공사 관련',
                ),
                Tab(
                  text: '시공 현황',
                ),
                Tab(
                  text: '동네주변/취미생활',
                ),
                Tab(
                  text: '입주자협의회',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text('전체'),
              ),
              Center(
                child: Text('대출'),
              ),
              Center(
                child: Text('서류/자격요건/계약'),
              ),
              Center(
                child: Text('분양가/시세'),
              ),
              Center(
                child: Text('교통/학교/인프라'),
              ),
              Center(
                child: Text('옵션/인테리어'),
              ),
              Center(
                child: Text('시공사 관련'),
              ),
              Center(
                child: Text('시공 현황'),
              ),
              Center(
                child: Text('동네주변/취미생활'),
              ),
              Center(
                child: Text('입주자협의회'),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Image.asset('write.png'),
            backgroundColor: primaryColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
