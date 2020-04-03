import 'package:flutter/material.dart';
import 'package:flutter_widgets_teste/pages/dog_page.dart';
import 'package:flutter_widgets_teste/utils/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("Lista");
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              print("Grid");
              setState(() {
                _gridView = true;
              });
            },
          ),
        ],
        title: Text("List View"),
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rottweiler", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];

    if (_gridView) {
      return GridView.builder(
          itemCount: dogs.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            Dog dog = dogs[index];

            return _itemView(dog);
          });
    } else {
      return ListView.builder(
          itemCount: dogs.length,
          itemExtent: 350,
          itemBuilder: (BuildContext context, int index) {
            Dog dog = dogs[index];

            return _itemView(dog);
          });
    }
  }

  _itemView(Dog dog) {
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 30,
                color: Colors.black54,
                alignment: Alignment.topCenter,
                child: Text(
                  dog.nome,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _img(String caminhoImagem) {
    return Image.asset(
      caminhoImagem,
      fit: BoxFit.fill,
    );
  }
}
