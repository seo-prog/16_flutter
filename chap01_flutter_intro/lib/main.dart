import 'package:flutter/material.dart';


// Flutter 어플리케이션의 진입점이 되는 메소드
void main() {

  // 주어진 위젯을 기준으로 위젝 트리를 만든다
  runApp(const MyApp());
}

// 한 번 생성되면 변경되지 않을 위젯
// MyApp 은 Flutter 앱의 루트 위젯이다.

/*
* 앱의 전반적인 테마 설정 - 텍스트 스타일, 버튼 스타일 등
* 홈 페이지 설정 - home 속성을 통해서 처음 앱을 실행할 때 보여줄 초기 화면 지정
* 라우팅 밑 네비게이션 설정 등등
*
* */
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // 부모에게 키를 전달을 해줘야 위젯트리에 들어간다 생각


  /*
  * build()
  * - 위젯 트리를 구성하고 해당 트리를 기반으로 화면에 표시 될 UI 를 정의하는 메소드
  *
  * + 해당 클래스 위젯 화면 그려주는 역할 (클래스 당 1개)
  * */
  @override
  Widget build(BuildContext context) {

    /*
    * 메테리얼 - 안드로이드에 적응하려고 구글이 만든 디자인 규칙이다.
    * - 하지만 꼭 안드로이드 전용으로 동작하는 것은 아니다.
    * 플러터는 크로스 플랫폼 프레임워크이기 떄문에, MaterialApp 을 사용한 앱도
    * IOS, 웹, 데스트톱 등 다양한 플랫폼에서 실행될 수 있다..
    *
    * flutter 어플리케이션은 Meterial Design 을 기반으로 전반적인 테마, 라우팅, 기본 스타일 및
    * 네비게이션을 관리한다..
    *
    *
    * 주요 속성
    * - title = 앱의 제목을 설정한다.
    * - theme = 앱의 기본 테마를 정의한다. 색상, 텍스트 등
    * - home = 앱의 기본 화면을 설정한다. 일반적으로 첫 번째 화면을 표시하는 위젯
    * - routes = 라우팅을 정의하는데 사용한다.
    *
    * */

    return MaterialApp( // MaterialApp-> 안드로이드 디자인의 앱
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "우리들의 첫 플러터 앱"), // home -> 초기 화면
    );
  }
}

/*
* 위젯 ?
* - HTML 의 개발방식은 태그
* - <p>안녕하세요<p/>
*
* - Flutter 는 위젯을 사용한다.
* - 글자를 넣고 싶으면 Text, 이미지는 Image
* - 네모박스 혹은 컨테이너는 Container()
*
* */

// stless -> 기본 틀 나옴
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title}); // 호출 시 title 필수라는 뜻
  final String title;

  @override
  Widget build(BuildContext context) {

    /*
    * Scafford 는 기본적인 화면의 구조를 제공한다.
    * Flutter 에서 기본적인 화면 구조를 쉽게 설정할 수 있게 해주는 위젯
    * 속성
    * - appbar = 앱의 상단에 표시되는 앱 바
    * - body = 화면의 메인 콘텐츠 영역
    * - drawer = 앱의 왼쪽에서 오른쪽으로 스와이프 해 열 수 있는 네비
    * - bottomNavigationBar = 앱의 하단 네비 바
    *
    * */
    return Scaffold(
      appBar: AppBar( // 상단 앱 바
        title:
        //  const Center( // 앱바의 가운데
          // child: Text("플러터 앱"),
        // child 는 자식이 1개, 여러개로 할꺼면 children
        // 가로로 여러개 둘꺼면 row, 아니면 column 이런거 넣어야 함. 그 안에 children[] 한 후 여러개 넣을 수 있다.
       // ),
        Row(
          mainAxisSize: MainAxisSize.max,// row 크기 안에서 가장 큰  // min 으로 한다면
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 비트윈 그 느낌.. 그거
          children: [
          Text("플러터 앱"),
          SizedBox(
            width: 8,
          ),
          Icon(Icons.star)
        ],) // 
      ),

      // 화면의 메인 컨텐츠 영역
      body: Center(
        // 텍스트
      //  child: Text(title, style: TextStyle(fontSize: 30, color: Colors.yellow),),
        // child: Icon(Icons.favorite),

        // 이미지
        child: Image.asset("assets/aaa.webp"),
      ),

        bottomNavigationBar: BottomAppBar(
          child: Center(
    child: Text("하단바 입니다"),),),

    );
  }
}


