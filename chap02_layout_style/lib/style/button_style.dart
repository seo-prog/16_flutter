import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("레이아웃 테스트 !"),
        ),
      ),

      // 센터 -> 컨테이너 -> 컬럼(세로) -> 버튼 (그럼 버튼들 세로 정렬)
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextButton(
                onPressed: (){},
                child: Text("버튼"), // 얘는 커서를 가져다 대면 버튼
                style: TextButton.styleFrom(minimumSize: Size(100, 60)),
              ),

              ElevatedButton(
                  onPressed: (){},
                  child: Text("버뜬")),
              // 얘는 처음부터 버튼(버튼같은 버튼임)
              
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.favorite),
                iconSize: 60,)
          ],
          ),
        ),
      ),
    );

  }
}
