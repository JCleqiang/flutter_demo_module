class A {
  void a() {
    print('fun a => by a');
  }
}

class B implements A {
  @override
  void a() {
    print('fun a => by b');
  }
}

class C {

  void a() {
    print('fun a => by c');
  }

  void c() {
    print('fun c => by c');
  }

  void s(){
    print('fun s => by c');
  }
}

class E {
  String e = 'eeee';

  void s(){
    print('fun s => by e');
  }
}

class D extends A with E, C {
  void c() {
    print('fun c => by d');
  }
}

void main() {
  D d = new D();
  d.a(); // fun a => by a
  d.s();
  d.c(); // fun c => by d
}
