import 'dart:io';

Future<int> addition() async {
  return Future.delayed(Duration(seconds: 5),() => 10+20,);
}
Future<void> main()
async {
  int z = await addition();
  print(z);
}