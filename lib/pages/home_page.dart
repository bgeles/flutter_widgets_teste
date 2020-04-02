import 'package:flutter/material.dart';
import 'package:flutter_widgets_teste/pages/hello_listview.dart';
import 'package:flutter_widgets_teste/pages/hello_page1.dart';
import 'package:flutter_widgets_teste/pages/hello_page2.dart';
import 'package:flutter_widgets_teste/pages/hello_page3.dart';
import 'package:flutter_widgets_teste/utils/nav.dart';
import 'package:flutter_widgets_teste/widgets/blue_button.dart';

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
            BlueButton(
                "ListView", () => _onClickNavigator(context, HelloListView())),
            BlueButton(
                "Page 2", () => _onClickNavigator(context, HelloPage2())),
            BlueButton(
                "Page 3", () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("Snack", _onClickSnack),
            BlueButton("Dialog", _onClickDialog),
            BlueButton("Toast", _onClickToast),
          ],
        )
      ],
    );
  }

  _onClickToast() => _onClickToast;

  _onClickSnack() => _onClickSnack;

  _onClickDialog() => _onClickDialog;

  
  
  
  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context,page);
    print('>>>>$s');
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
