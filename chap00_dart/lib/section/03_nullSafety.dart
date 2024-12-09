void nullSafetyTest() {


/*
*   Dart 에서는 기본적으로 변수를 선언할 때, 초기화를 하지 않으면 에러가 나도록 되어있다.
*   null-aware 연산자를 통해 Null 처리를 고려할 수 있다.
*
* */

// 선언시 초기화를 하지 않으면 에러 발생
String? name;
print(name);

/*
* ?? =
* null 병합 할당
* - null 이 할당되어 있는 경우에만 값을 할당하는 연산자.
* - 기본값을 설정하거나 초기값을 주는데 유용하다.
* - 사용자가 입력하지 않거나 값이 null 인 경우에 자동으로 기본값을 할당할 수 있다.
*
* */

String? value1;
String value2 = "not null";

value1 ??= "null 값이여서 할당됨";
value2 ??= "null 이 아니라서 할당되지 않음";
print(value1);
print(value2);

// is, is!  - 타입 확인

int x = 10;
if(x is int){
  print('${x} 는 정수형 입니다.');
}

// 스프레드 연산자
var number = [1,2,3];
var moreNumbers = [...number, if (number.length < 5 ) 4];
print(moreNumbers);



}