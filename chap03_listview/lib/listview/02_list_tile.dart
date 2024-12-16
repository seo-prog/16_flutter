import 'package:flutter/material.dart';

/*
* ListtILE
* - fLUTTER 에서 리스트 아이템을 간편하게 구설할 수 있는 위젯
* - 텍스트, 아이콘, 이미지 등륵 간단하게 배치할 수 있어 설정 화면, 채팅 목록, 연락처 목록 등의
*    리스트에서 자주 사용된다..
*
* */
class listApp2 extends StatelessWidget {
  const listApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("리스트 테스트~!"),
        ),
      ),
      body: ListView(
        children: [

        ListTile(
          leading: Image.asset("assets/1.png"), // 왼쪽에 위치
          title: Text("서연이"),// list 파일의 제목
          subtitle: Text("배고프다"), // 부제목
          trailing: Icon(Icons.favorite_border),
          onTap: (){}, // list tile 선택가능하도록
        ),

          Padding(padding: EdgeInsets.only(top:10)),
          ListTile(
            leading: Image.asset("assets/1.png"), // 왼쪽에 위치
            title: Text("서연이"),// list 파일의 제목
            subtitle: Text("배고프다"), // 부제목
            trailing: Icon(Icons.favorite_border),
            onTap: (){}, // list tile 선택가능하도록
          ),

          ListTile(
            leading: Image.asset("assets/1.png"), // 왼쪽에 위치
            title: Text("서연이"),// list 파일의 제목
            subtitle: Text("배고프다"), // 부제목
            trailing: Icon(Icons.favorite_border),
            onTap: (){}, // list tile 선택가능하도록
          ),
      ],),
    );
  }
}
