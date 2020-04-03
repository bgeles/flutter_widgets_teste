import 'package:flutter/material.dart';
import 'package:flutter_widgets_teste/pages/hello_listview.dart';
import 'package:flutter_widgets_teste/pages/hello_page1.dart';
import 'package:flutter_widgets_teste/pages/hello_page2.dart';
import 'package:flutter_widgets_teste/pages/hello_page3.dart';
import 'package:flutter_widgets_teste/utils/nav.dart';
import 'package:flutter_widgets_teste/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onClickFab(),
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: Text("Hello Flutter"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _onClickFab() {
    print("Adicionar");
  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    () => _onClickNavigator(context, HelloListView())),
                BlueButton(
                    "Page 2", () => _onClickNavigator(context, HelloPage2())),
                BlueButton(
                    "Page 3", () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", () => _onClickSnack(context)),
                BlueButton("Dialog", () => _onClickDialog(context)),
                BlueButton("Toast", _onClickToast),
              ],
            )
          ],
        );
      },
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Olá Flutter'),
        action: SnackBarAction(
          label: "OK",
          textColor: Colors.deepOrange,
          onPressed: () {
            print("Snack OK");
          },
        ),
      ),
    );
  }

  _onClickToast() {
    print("TOAST!!!");
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _onClickDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é muito Legal"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    print("Dialog Cancelar");
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("Dialog OK");
                  },
                ),
              ],
            ),
          );
        });
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
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
