void main() {
  // int a = test4(3, y: 2);

  int a = test3(2, 10, 4);
  int b = test3(2, 10);
  int c = test4(2, z: 10);
  int d = test4(2);

  print(a);
  print(b);
  print(c);
  print(d);
}

// 普通的函数z
int test1(int x) {
  return x;
}

// 可选参数
int test2(int x, [int y, int z]) {
  if (y == null || z == null) {
    return x;
  }
  return x + y + z;
}

// 可选参数有默认参数
int test3(int x, [int y = 3, int z = 100]) {
  return x + y + z;
}

// 具名参数（named parameters）
int test4(int x, {int y = 3, int z = 100}) {
  return x + y + z;
}

int test5(int x, {int y, int z}) {
  return x + y + z;
}

class Point2D {
  int x;
  int y;
  // 由于是在 initializer list 中，Dart 知道第一个 x 是 this.x，
  // 第二个 x 是构造函数的参数
  Point2D(int x, int y)
      : x = x,
        y = y {
    // ...
  }
}
