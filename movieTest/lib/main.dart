
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navi.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  List<Map<String, String>> allList = [];

  int _selectedIndex = 0;

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0: // 영화 list
        return MovieList(allList);
      case 1: // 영화 등록 페이지
        return AddMovie(allList, changeIndex: (int index) {  },);
      case 2:// 영화 검색 페이지
        return FindMovie(allList.isNotEmpty ? allList : []);
      default:
        return Center(
          child: Text("페이지 없음"),
        );
    }
  }

  // 선택된 인덱스를 변경하는 함수
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화 관리 앱"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false, // 선택되지 않은 라벨 숨김
        currentIndex: _selectedIndex, // 이 currentIndex를 넣어줘야 클릭한 라벨에 색이 들어온다.
        onTap: _onItemTapped,
        items: [

          BottomNavigationBarItem(
            label: "영화 목록",
            icon: Icon(Icons.list),
            activeIcon: Icon(Icons.list_outlined)
          ),

          BottomNavigationBarItem(
              label: "영화 등록",
              icon: Icon(Icons.add),
              activeIcon: Icon(Icons.add_outlined)
          ),

          BottomNavigationBarItem(
              label: "영화 검색",
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.search_outlined)
          )
        ],
      ),
    );
  }
}

