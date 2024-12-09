

void classTest(){
  Human human = new Human.empty();
  print(human);
  // toString 오버라이드 안되어있으면 Instance of 'Human' 일케 나옴.
  // 자바에서는 주솟값이 나왔지만 다트에서는 현재 객체의 타입이 찍힌다.

  Human human2 = new Human("서연", 20);
  print(human2);
  print(human2.doHello());
  print(human2.name);

  Human2 human3 = new Human2("서연", 20);
  print(human3);
  print(human3.name);
  print(human3._name);

}

class Human{
  String name;
  int age;

  // 다트에서는 동일한 이름을 가진 생성자를 만들 수 없고,
  // 공식문서를 기준으로 매개변수를 받는 생성자를 권장한다.
  Human(this.name, this.age);

  // 명명된 생성자
  // 초기화 리스트 -> 생성자가 실행되기 전에 클래스의 변수를 초기화 하는 방법
  // : 뒤에 변수 초기화를 나열한다.
  Human.empty()
    :name = '',
     age = 0;

  String doHello(){
    return "안녕하세요 $name 입니다.";
  }

  @override
  String toString() {
    return "Human{name : $name, age: $age}";

  }
}

/*
* Dart 에서 private 접근 제어자는 클래스 수준이 아니라 라이브러리 수준에서 작동한다.
* 같은 파일 내에서는 언더스코프라도 (_) 자유롭게 접근할 수 있다.
* 다른 파일일시에 접근이 불가능하다.
* */

class Human2{
  // _ 는 private 를 뜻한다. // 게터.세터는 private(_) 일때만 가능하다.
  String _name;
  int _age;

  Human2(this._name, this._age);

  // 게터.세터가 getName, setName 이 아니라 그냥 둘 다 name 으로 사용가능하다.
  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}