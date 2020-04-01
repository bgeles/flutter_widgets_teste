import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: body(),
    );
  }

  body() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Hello Wolrd",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy),
        ),
      ),
    );
  }
}
