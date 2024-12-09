void functionTest(){
  test1("홍길동"); // hello 홍길동
  
  // 클로저 - 내부 함수 : 객체지향에서는 클래스가 있기때문에 고려하지 않아도됨
  void innerFun(){
    print("hello");
  }
  
  innerFun(); // hello


  print("----- 매개변수와 반환타입 -----");

  print(add(1, 2)); // Sum : 3


  print("----- Optional 매개변수 -----");
  print(add2(1,2)); // Sum2 : 3
  print(add2(1,2,3)); // Sum2 : 6
}

void test1(String name){
  print("hello ${name}");
}

String add(int a, int b){
  return "Sum : ${a + b}";
}

String add2(int a, int b, [int c = 0]){ // [] 안의 값은 값을 주면 그 값으로 들어가고, 안주면 기본 설정값으로 들어간다.
  int sum = a + b + c;
  return "Sum2 : ${sum}";
}

