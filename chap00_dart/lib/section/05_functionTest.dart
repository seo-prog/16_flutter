void functionTest(){
  test1("최서연");

  // 클로저 - 내부 함수 (가능은 하지만 객체지향에선 고려하지 않는부분)
  void innerFun(){
    print("헬로");
  }

  innerFun();

  print("---- 매개변수와 반환타입 ---- ");
  print(add(1,2));

  print("---- Optionam 매개변수 ----");
  print(add2(1,2,3));
  print(add2(1,2));


}

void test1(String name){
  print("hello ${name}");
}

String add(int a, int b){
  return "Sum : ${a+b}";
}

// 3번째 매개변수를 주면 그 값으로 c 를 초기화, 값을 주지 않으면 기본값인 0으로 초기화.
String add2(int a, int b, [int c = 0]){
  int sum = a+b+c;

  return "Sum2 : ${sum}";
}