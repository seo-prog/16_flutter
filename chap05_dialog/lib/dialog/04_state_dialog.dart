import 'package:flutter/material.dart';

class DialogTest5 extends StatefulWidget {
  // 상태 변화니까 stateful 써야함(stf)
  const DialogTest5({super.key});

  @override
  State<DialogTest5> createState() => _State();
}

class _State extends State<DialogTest5> {
  var inputDate =
      TextEditingController(); // textField 안에서 값 변경을 담아주는 애 (하나만 가능)
  String name = "null";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // 중앙정렬
      children: [
        if (name != "null")
          Text(
            name,
            style: TextStyle(fontSize: 25),
          ),
        SizedBox(
          height: 20, // 위젯끼리의 간격 줄때 좋음
        ),
        ElevatedButton(
            child: Text(
              "등록",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("이름 입력"),
                      content: TextField(
                        controller: inputDate,
                        decoration: InputDecoration(hintText: "이름을 입력하세욧 !"),
                      ),
                      actions: [

                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("취소")),

                        TextButton(onPressed: (){
                          setState(() { // 바로 렌더링 되야하므로 setState
                            name = inputDate.text.isNotEmpty ? inputDate.text : name;
                          });
                          Navigator.pop(context);
                        }, child: Text("확인")),

                      ],
                    );
                  });
            })
      ],
    ));
  }
}
