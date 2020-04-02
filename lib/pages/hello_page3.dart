import 'package:flutter/material.dart';
import 'package:flutter_widgets_teste/utils/nav.dart';
import 'package:flutter_widgets_teste/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page 3"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: BlueButton(
        "Voltar",
        () => pop(context, text: "Tela 3"),
      ),
    );
  }
}
