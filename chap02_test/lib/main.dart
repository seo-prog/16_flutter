import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '두번째 test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "실습 앱~!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.safety_check),
           ),

          IconButton(
          onPressed: (){},
          icon: Icon(Icons.favorite_border),
          ),

          IconButton(
          onPressed: (){},
          icon: Icon(Icons.delete),
          ),
          ],
      ),


      body: Column(
          children: [
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
      margin: EdgeInsets.all(30),
    child:
        Row(
    children: [
      Image.asset("assets/1.png", width: 150, height: 180),
      SizedBox(width:20),
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("흰둥이"),
          Text("비숑"),
          Text("서울시 구로구"),
          Text("흰둥이"),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
              Text("4")
            ],
          )]
      )

    ],
        )

        ),
          Container(
              margin: EdgeInsets.all(30),
              child:
              Row(
                  children: [
                    Image.asset("assets/2.jpg", width: 150,  height: 180,),
                    SizedBox(width:20),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("흰둥이"),
                        Text("비숑"),
                        Text("서울시 구로구"),
                        Text("흰둥이"),
                        Row(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                            Text("4")
                          ],
                        )]
                    )

                      ],
                    )

          )
        ],
          )
          ],
    ),

      bottomNavigationBar: BottomAppBar(
          color: Colors.greenAccent,
            child:
            Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_back)
                      ),

              IconButton(
              onPressed: (){},
              icon: Icon(Icons.star)
              ),

              IconButton(
              onPressed: (){},
              icon: Icon(Icons.settings)
              ),

              IconButton(
              onPressed: (){},
              icon: Icon(Icons.arrow_forward)
              ),
              ],
            ),),
    );
               }
            }



