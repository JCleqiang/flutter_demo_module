import 'dart:io';

void main() async {
//  Future<String> future = test2();
//  future.then((t) {
//    print("llq003: " + t);
//  });
  // String a = await test2();
  String a = "2222";
  print("llq003: " + a);
}

/*
 * @description: Future的使用
 * @author: leqiang222
 * @date: 2020/1/9
 */
void test1() {
  String filePath = "/Users/jinglian/Desktop/a.txt";
  new File(filePath).readAsString().then((t) {
    print("llq001: " + t);
    return "hello";

    ///这里可以返回值 继续传给下一个then方法来使用
  }).then((t) {
    //in/这里继续使用then方法
    print("llq002: " + t);
  });
}

/*
 * @description: async await的使用
 * async await 一般都是配合使用 他会阻塞 使其一步一步执行
 * @author: leqiang222
 * @date: 2020/1/9
 */
Future<String> test2() async {
  String filePath = "/Users/jinglian/Desktop/a.txt";
  String filePath2 = "/Users/jinglian/Desktop/a2.txt";
  String s1 = await new File(filePath).readAsString();

  ///这个执行完才能往下执行
  String s2 = await new File(filePath2).readAsString();

  return "$s1\n$s2";
}
