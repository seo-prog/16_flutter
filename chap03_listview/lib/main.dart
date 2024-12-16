
import 'package:flutter/material.dart';

import 'listview/01_listview.dart';
import 'listview/02_list_tile.dart';
import 'listview/03_list_builder.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      // 일반 리스트 만들어보기
      // ListApp(),
      // listApp2(),
      listApp3(),
    );
  }
}
