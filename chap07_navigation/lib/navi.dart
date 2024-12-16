import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* 네비게이터 (Navigator)
* - 플러터에서 화면 전환을 관리하는 위젯이다.
* - 스택 구조를 사용하여 화면을 위에 쌓거나, 아래로 제거 함으로써 유저가 여러 화면 사이에 탐색할 수 있게 도와준다.
*   제거 함으로써 유저가 여러 화면 사이를 탐색할 수 있게 도와준다.
* - push  - 새로운 화면을 스택 위에 추가
* - pop - 스택에서 현재 화면 제거
* */

class NavigationPage extends StatelessWidget {
  NavigationPage({super.key});

  // 상품 데이터 리스트
  final List<Map<String, String>> products = [
    {"name": "상품1", "description": "상품 1의 상세 정보"},
    {"name": "상품2", "description": "상품 2의 상세 정보"},
    {"name": "상품3", "description": "상품 3의 상세 정보"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, i) {
        final product = products[i];
        return ListTile(
          title: Text(product['name'] ?? "이름 없음"), // "이름 없음" 은 그냥 반환이기 때문에 글자만 찍어주고
          // 밑에 onTap 에서도 또 대응을 해줘야 에러가 안난다.
          // 밑에 대응 ->  DetailPage(productName: product['name'] ??= "이름없음"
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(context, // 스택으로 쌓는다
                MaterialPageRoute( // 기본적인 material 에서 위젯을 쌓을 때 기본적인 것.
                    builder:
                    (context) => // 매개변수로 context 는 필요 !
                    DetailPage(productName: product['name']!, // 비어있지 않다는것을 알려주기 위한 ! (requierd 가 있기에 nu;ll 이 아님을 알려줘야 한다.)
                        productDescription: product['description']!)
                )); // 즉, MaterialPageRoute 를 활용해서 특정 위젯(DetailPage) 을 쌓아주고 있다.
          },
        );
      },
    );
  }
}

// 상세 페이지
class DetailPage extends StatelessWidget {
  final String productName;
  final String productDescription;

  const DetailPage(
      {super.key, required this.productName, required this.productDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(productName),
        ),
        body: Padding(padding: EdgeInsets.all(16),
            child: Text(
              productDescription,
              style: TextStyle(fontSize: 20),
            )));
  }
}
