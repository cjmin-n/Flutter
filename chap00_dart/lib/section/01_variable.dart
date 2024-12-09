/*
 * 변수
 * - 변수명은 일반적으로 카멜 케이스를 따른다.
 *
 * 타입 변수명 = 초기화값;
 *
 * var / 자료형
 *
 * var - 변수의 타입을 명시하지 않고 선언.
 * 할당되는 값에 따라 타입이 결정된다.
 * 타입이 고정되기 때문에 해당 변수에 다른 타입의 값을 할당할 수 없다.
 *
 * 하지만 Dart 는 강타입 언어이다.
 * 타입에 대한 규칙이 엄격하다.
 * 따라서 다른 타입 자료형들도 제공하고 있다.
 *
 * - int 정수
 * - double 실수 (** int/double 둘다 8바이트 이다. < bigInt)
 * - num (int, double 을 둘다 담을 수 있는 부모클래스)
 * - bool
 * - String
 *
 *
 * */
void variableTest(){
  // 타입 추론
  var hello = "hi";
  hello = 123.toString(); // 한번 할당되면 자료형이 정해지기 때문에 다른 자료형을 넣을 수 없다.
  print(hello); // 123

  // 논리형
  bool wrong = false;
  print(wrong); // false

  // 정수, 실수
  int num1 = 5;
  int num2 = 10;

  print(num1 + num2); // 15

  double num3 = 5.5;
  double num4 = 1.1;

  print(num3 / num4); // 5.0

  // String
  String name1 = '홍길동'; // '' "" 둘다 가능
  String name2 = "유관순";

  // 문자열 내에서의 변수 사용
  print("안녕하세요 " + name1); // 안녕하세요 홍길동
  print('안녕하세요 $name2'); // 안녕하세요 유관순
  print('안녕하세요 ${name1 + name2}'); // 안녕하세요 홍길동유관순

}