void extendsTest(){

  Dog dog = Dog("흰둥이", 6);
  dog.eat(); // age 6 - 흰둥이 이(가) 밥을 먹습니다.
             // age -6 - Unhandled exception:
             //         Invalid argument(s): 나이가 너무 어려요
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
class Dog extends Animal{

  // late : 나중에 초기화
  late int _age; // 생성자가 실행될 때 바로 값이 안들어가기 때문에 late 를 넣어준다.

  // Dog 를 생성할 때 name, age 를 받아서 super 에 name 을 주고 {} 안에 Dog 를 정의한다.
  Dog(String name, int age) : super(name) {
    this.age = age; // 본인의 setter 에 age 값을 넣음
  }

  int get age => _age;

  set age(int value) {
    if(value <= 0){
      throw ArgumentError("나이가 너무 어려요"); // 생성자 호출하면서 유효성검사까지
    }
    _age = value;
  }
}