class A {
  a() {
    print("A.a()");
  }

  b() {
    print("A.b()");
  }
}

class A2 {
  a() {
    print("A2.a()");
  }
}

class B {
  a() {
    print("B.a()");
  }

  b() {
    print("B.b()");
  }

  c() {
    print("B.c()");
  }
}

class G extends B with A, A2 {

}


/// 就是相同方法被覆盖了，并且 with 后面的会覆盖前面的
testMixins() {
  G t = new G();
  t.a();
  t.b();
  t.c();
}

/// ***********************输出***********************
///I/flutter (13627): A2.a()
///I/flutter (13627): A.b()
///I/flutter (13627): B.c()