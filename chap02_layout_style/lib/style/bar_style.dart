import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GangnamStagram",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        // title 기준으로 우측 추가 -> actions
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                  Icons.favorite_border,
                color: Colors.black,
              )),

          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.message_outlined,
                color: Colors.black,
              ))
        ],
      ),
      
      body: Column(
        children: [
          // Expanded -> 가로로 꽉 채운다.
          Expanded(child: Container(color: Colors.lightBlueAccent,)),
          Container(height: 100,
          child: Row( // row 로 했으니까 가로 공간을 등분
            children: [ // 이 공간에서 몇등분의
              Flexible( // row -> 가로에서 얼마만큼 차지할껀지 // column -> 세로로 얼만큼 차지할껀지
                  child: Container(
                    color: Colors.cyan,
                  ),
              flex: 1,), // flex -> 이만큼의 공간 차지

              Flexible(
                child: Container(
                  color: Colors.greenAccent,
                ),
                flex: 1,)

            ],
          ),)
        ],
      ),
      
      
      bottomNavigationBar: BottomAppBar(
        color: Colors.amberAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.home),
              color: Colors.white,),

            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
              color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
