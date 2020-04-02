import 'package:flutter/material.dart';
import 'package:flutter_widgets_teste/pages/hello_page1.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  _buttons(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, "ListView"),
            _button(context, "Page 2"),
            _button(context, "Page 3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button(context, "Snack"),
            _button(context, "Dialog"),
            _button(context, "Toast"),
          ],
        )
      ],
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _button(BuildContext context, String texto) {
    return RaisedButton(
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        color: Colors.blue,
        onPressed: () => _onClickOK(context));
  }

  void _onClickOK(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return HelloPage1();
    }));
  }

  _img(String caminhoImagem) {
    return Image.asset(
      caminhoImagem,
      fit: BoxFit.fill,
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
