/*
* Dart 는 배열을 따로 제공하지 않는다.
* list 와 Map 을 제공하고, 데이터의 추가 조회 수정 삭제가 가능하다.
*
* */

void collectionTest(){

  print("---------- list ----------------");

  List<String> foods = ["동파육", "탕수육"];
  print(foods);
  print(foods.length);
  print(foods.first);

  // 배열이니 인덱스 접근도 가능
  print(foods[0]);
  print(foods[1]);

  // 수정
   foods[0] = "크림새우";
   print(foods);

   // 삭제
  foods.remove('탕수육'); // remove 는 값으로 넣고
  print(foods);

  foods.removeAt(0); // removeAt 은 인덱스 번호로 넣는다.
  print(foods);


  print("---------- Map ----------------");

  // dynamic - 타입을 명시적으로 지정하지 않고 동적으로 결정할 수 잇다.
  // 서로 다른 타입의 값도 할당할 수 있다.
  Map<String, dynamic> person = {"name": "홍길동", "age": 20, "gender": "남"};
  print(person);
  print(person['name']); // 이게 map 의 value 값을 가지고 오는 방법 (자바에서는 .)

  // 없는 값을 조회해도 에러가 나지 않는다.
  print(person["test"]);

  // 새로운 key 를 넣어서 값을 추가할 수 있다.
  person['hobby'] = ['축구', "농구"];
  print(person);

  // 수정 - 기존에 존재하는 key value 값에 새로운 값을 넣는다.
  person['age'] = 21;
  print(person);

  // 삭제
  person.remove('hobby');
  print(person);
  
}