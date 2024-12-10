import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialApp-> 안드로이드 디자인의 앱
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "우리들의 첫 플러터 앱"), // home -> 초기 화면
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title}); // 호출 시 title 필수라는 뜻
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.blue, // 속성은 가질 수 있다.
        title:
                const Center(
                  child:
                  Text("네비 바 테스트",
                    style: TextStyle(fontSize: 30,),

                  ),
                ),
      ),

      body: Center(
        child: Image.asset("assets/aaa.webp"),
      ),

      bottomNavigationBar: BottomAppBar(

        child:
        Row(
          mainAxisSize: MainAxisSize.max,// row 크기 안에서 가장 큰  // min 으로 한다면
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.list),
            Icon(Icons.delete)
          ],
        )
      ),

    );
  }
}


