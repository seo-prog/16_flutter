import 'package:flutter/material.dart';

class DialogTest4 extends StatelessWidget {
  const DialogTest4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          child: Text("버튼"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("텍스트 입력"),
                    content: TextField( // TextField -> 텍스트 입력가능한 위젯
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "내용", // 얘는 그냥 바로 뜨는 애 (placeholder)
                        hintText: "내용을 입력하세욧", // 얘는 input 창 클릭하면 뜨는애
                        helperText: "도움되는 텍스트"
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("취소")),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("완료")),
                    ],
                  );
                });
          }),
    );
  }
}
