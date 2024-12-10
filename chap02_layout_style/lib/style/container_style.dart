
import 'package:flutter/material.dart';

// class  MyContainer extends StatelessWidget {
//   const MyContainer({super.key});

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Center(
//         child: Text("LayOut-test"),
//       ),
//     ),
//     body: Container(
//       decoration:
//           BoxDecoration(
//             border:  Border.all(color: Colors.black),
//           ),
//       // margin, padding 은 container 에만 줄 수 있다. row 나 column 에는 안된다.
//       margin: EdgeInsets.all(90),
//       padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
//       child: Text("컨테이너 테스트"),
//     ),
//   );
// }
// }

/*
* 직접 포지션을 지정해서 위젝을 움직이는 방법은 보통 Positioned 위젯과 같은 방법으로 이루어 지지만.
* 플러터에서는 일반적으로 위젝의 위치를 직접 설정하기 보다는
* 레이아웃 위젯 (ex) Column, Row, Center 등) 을 사용하여 자동으로 배치되는 방식을 권장한다.
*
* */

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  // 컬럼 로우 컨테이너 ->> 세로 가로...
  // row 는 가로로 꽉차는것이므로 크기 조정은 자식으로 크기 조정을 해줘야 한다.
  // column 은 세로 전체. ( 최대 높이)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Center(
        child: Text("LayOut-test"),
      ),
    ),
    body:
    // Row(
    // mainAxisAlignment: MainAxisAlignment.center,
    // children: [
    //
    //   Container(
    // decoration: BoxDecoration(border: Border.all(color: Colors.black),),
    //   margin: EdgeInsets.all(30),
    //   padding: EdgeInsets.all(30),
    // child: Text("컨테이너 1번"),
    // ),
    //
    // Container(
    // decoration: BoxDecoration(border: Border.all(color: Colors.black),),
    // margin: EdgeInsets.all(30),
    // padding: EdgeInsets.all(30),
    // child: Text("컨테이너 2번"),
    // ),
    // ],
    // ),
      Align(
        // 부모 크기 안에서 즉, 여기서는 body 칸을 넘지 않는다. bottom 이 있으면 그 bottom 까지 침법하지 않음.(헤더도)
        // 컨테이너를 특정 위치에 배치시킬 수 있다.
        alignment: Alignment.topLeft,
        child: Container(width: 50,height: 50,color: Colors.cyanAccent,),
      ),
    );
  }
}




