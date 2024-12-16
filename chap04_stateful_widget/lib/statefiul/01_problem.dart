import 'package:flutter/material.dart';

class StatelessTest extends StatelessWidget {
  StatelessTest({super.key});
  var a = 1; // 변수 추가 시 const 빼기

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(a.toString()),
      onPressed: (){
        print(a);
        a++;
      },
    );
  }
}
