
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text("LayOut-test"),
      ),
    ),
      body: Center(
          child: Text(
              "텍스트 스타일 적용",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 30),
            // fontSize -> 통상적으로 동일하지만 컴마다 다를 수 있음.
            /*
            * color
            * colors.red - 미리 정해진 색상표에서 고르는 법
            * Color.fromRGBO() - rgbo 로 고르는 방법
            * Color(0xfffff) - Hexadeccimal 색상 값으로 고르는 법
            *
            *
            * backgroundColor : 배경색
            * fontSize
            * fontWeight
            * fontFamily
            * 등등 .... 필요한 속성 찾아 씀면 된다.
            *
            * */
          ),
    )
    );
  }
}
