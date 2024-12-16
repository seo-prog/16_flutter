import 'package:flutter/material.dart';

class ContextTest extends StatefulWidget {
  const ContextTest({super.key});

  @override
  State<ContextTest> createState() => _State();
}

class _State extends State<ContextTest> {
   var inputTitle = TextEditingController();
   var inputContents = TextEditingController();
   
  String title = "null";
  String contents = "null";
  
  List<String> titleList = [];
  List<String> contentsList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:
        ListView.builder(
            itemCount: titleList.length,
            itemBuilder: (context, i){
              return ListTile(
                leading: Text((i+1).toString()),
                title: Text(titleList[i]),
               //  subtitle: Text(contentsList[i]),
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text(titleList[i]),
                    content: Text(contentsList[i]),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("닫기"))
                      ],
                    );
                  });
                },
                trailing: TextButton(onPressed: (){
                  titleList.removeAt(i);
                  contentsList.removeAt(i);
                },
                    child: Text("삭제")),
              );
            }
        ),
        ),

      TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("일정 등록"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min, // 안에 내용뭃에 맞게 작아진다.
                      children: [
                        TextField(
                          controller: inputTitle,
                          decoration: InputDecoration(
                            labelText: "제목을 입력하세요",
                          ),
                        ),
                        TextField(
                          controller: inputContents,
                          decoration: InputDecoration(
                            labelText: "상세내용을 입력하세요",
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("취소")),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              title = inputTitle.text.isNotEmpty
                                  ? inputTitle.text
                                  : title;
                              titleList.add(title);
                              // inputTitle.text = "";
                              inputTitle.clear();
                            });
                            setState(() {
                              contents = inputContents.text.isNotEmpty
                                  ? inputContents.text
                                  : contents;
                              contentsList.add(contents);
                              inputContents.text = "";
                            });
                            Navigator.pop(context);
                          },
                          child: Text("완료"))
                    ],
                  );
                });
          },
          child: Text("등록")),
    ]
    );
  }
}
