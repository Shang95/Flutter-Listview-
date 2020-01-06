import 'package:flutter/material.dart';
import 'package:testlayout_app/LvRandom.dart';


void main () => runApp(MyTest());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wellcome back",
      home: LvRandom(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(brightness: Brightness.light, color: Colors.pink,elevation: 10.0,
            iconTheme: IconThemeData(color: Colors.white, ),)
      ),
    );

  }
}

class MyTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(width: 100, height: 200, decoration: BoxDecoration(color: Colors.green), child: Center(child: Text("jabsdgasd"),),),
            Container(width: 100, height: 200, decoration: BoxDecoration(color: Colors.red)),
            Container(width: 100, height: 200, decoration: BoxDecoration(color: Colors.blue))
          ],
        ),
      ),
    );
  }

}


