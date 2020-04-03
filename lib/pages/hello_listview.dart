import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: _body(),
    );
  }

  _body() {
    
    List<Image> imgs = [
      _img("assets/images/dog1.png"),
      _img("assets/images/dog2.png"),
      _img("assets/images/dog3.png"),
      _img("assets/images/dog4.png"),
      _img("assets/images/dog5.png")
    ];

    return ListView.builder(
      itemCount: imgs.length,
      itemExtent: 300,
      itemBuilder: (BuildContext context, int index){
        return imgs[index];
    });
  }
  

  Widget _img(String caminhoImagem) {
    return Image.asset(
      caminhoImagem,
      fit: BoxFit.fill,
    );
  }
}
