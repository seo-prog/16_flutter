import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  List<String> list = ["피자", "돈까스", "치킨"];
  List<int> list2 = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  title: Text(list[i]),
                 subtitle:  Text(list2[i].toString()),
                  trailing: TextButton(
                    onPressed: () {
                      setState(() {
                        list2[i] ++;
                        // if (list[i] == "피자") {
                        //   Text(a.toString());
                        //   a++;
                        // } else if (list[i] == "돈까스") {
                        //   b++;
                        //   Text(b.toString());
                        // } else {
                        //   c++;
                        //   Text(c.toString());
                        }
                      );
                    },
                    child: const Text("좋아용"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
