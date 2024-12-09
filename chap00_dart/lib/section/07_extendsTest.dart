
void extendsTest(){
  Dog dog = new Dog("흰둥이", 6);
  dog.eat();
}

// 부모 클래스
class Animal{

  String _name;

  Animal(this._name);

  void eat(){
    print("$_name 이(가) 밥을 먹습니다.");
  }
}

// 자식 클래스
class Dog extends Animal {

  // private 이므로 getter, setter 만들어줘야 접근 가능.

  // 나중에 초기화
  late int _age;
  // 생성자가 실행될 때 바로 값이 안들어가면 에러가 나는데
  // 여기에 late 를 붙여주므로 에러가 나지 않게 잡는다.

  // ? 는 null 허용이라 int 면 에러가 나는거고, late 는 초기화만 미루는것이다.

  // : 은 초기화 리스트 !

  // dog 생성자를 입력받을 떄 name 과 age 두개를 받는다는 의미로,
  // 먼저 받은 name 은 부모에게 name 을 넘겨주는것이다. 그 이후 저 밑에 setter 에 바로
  // age 가 들어가게되므로 에러가 난다. 따라서 late 를 붙여서 초기화를 뒤로 미뤄주면 에러가 나지 않는다.
  Dog(String name, int age) : super(name) { // 먼저 부모에게 name 을 준다. (부모 생성자 호출)
    this.age = age; // 이 부분이 dog 생성자의 본문 !
  }

  int get age => _age;

  set age(int value) {

    if (value <= 0){
      throw ArgumentError("나이가 너무 어려요");
    }

    _age = value;
  }
}