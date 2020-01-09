import 'dart:async';

void main() async { 
//  test4(12).then((t){
//    print("llq01: " + t);
//  }).catchError((onError) {
//    print("llq02: ");
//    print('error: ' + onError);
//  });

  try {
    String result = await test5();
    print(result);
  } catch(e) {
    print(e);
  }
  print('Another print statement.');
}

Future<String> test1() {
  return Future<String>((){
    return "hello";
  });
}

Future<String> test2() {
  return Future.value("rrr");
}

Future<String> test3() {
  return Future.delayed(Duration(seconds: 3), (){
    return "eee";
  });
}

Future<String> test4(int a) {
  if (a > 5) {
    throw Exception("error");
  }
  return Future.value("a <= 5");
}

Future<String> test5() {
  return new Future<String>.delayed(new Duration(milliseconds: 2000),() {
    //Do a long running task. E.g. Network Call.
    //Return the result
    return "This is a joke";
  });
}
