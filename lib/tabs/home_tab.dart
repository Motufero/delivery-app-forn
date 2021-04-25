import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:delivery_app_forn/widgets/background.dart';
import 'package:delivery_app_forn/models/provider_model.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTab extends StatelessWidget {
  PageController controller;

  HomeTab(this.controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //chamando o drawer para ficar aquele fundo com degradê
        Background(),
        ListView(
          padding: EdgeInsets.all(30.0),
          children: [
            FutureBuilder<QuerySnapshot>(
              //para puxar a imagem que está no BD em "home"
              future: Firestore.instance.collection("home").getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  String urlLogo = snapshot.data.documents.first.data["logo"];
                  //para a imagem sumir ao der scroll
                  return FadeInImage.memoryNetwork(
                    //para ficar com fundo transparente
                    placeholder: kTransparentImage,
                    image: urlLogo,
                    height: 300,
                  );
                }
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Bem vindo ao Pida-lá",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Container(
              child: Column(
                children: <Widget>[
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    color: Theme.of(context).primaryColor,
                    elevation: 4.0,
                    splashColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Administrar o Estoque",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Icon(
                          Icons.shopping_bag,
                        )
                      ],
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    color: Theme.of(context).primaryColor,
                    elevation: 4.0,
                    splashColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Lista de Solicitações",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Icon(
                          Icons.list,
                        )
                      ],
                    ),
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    color: Theme.of(context).primaryColor,
                    elevation: 4.0,
                    splashColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Configurações",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Icon(
                          Icons.construction,
                        )
                      ],
                    ),
                  ),
                  // ignore: deprecated_member_use
                  ScopedModelDescendant<ProviderModel>(
                    builder: (context, child, model) {
                      return RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        color: Theme.of(context).primaryColor,
                        elevation: 4.0,
                        splashColor: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        onPressed: () {
                          model.signOut();
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Sair do App",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Icon(
                              Icons.logout,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
