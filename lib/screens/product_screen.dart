import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/data/product_data.dart';
import 'package:delivery_app_forn/tiles/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_forn/models/provider_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        ScopedModelDescendant<ProviderModel>(builder: (context, child, model) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(
                Icons.person_pin,
                color: Colors.black,
                size: 30,
              ),
              title: Text(model.provData["name"]),
              backgroundColor: Colors.blueAccent,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            body: FutureBuilder<QuerySnapshot>(
                future: Firestore.instance //============não testado.
                    .collection("providers")
                    .document(model.provData["uid"])
                    .collection("SaleProducts")
                    .getDocuments(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print("nao tem nada");
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else
                    return ListView.builder(
                      padding: EdgeInsets.all(4.0),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return ProductTile(ProductData.fromDocument(
                            snapshot.data.documents[index]));
                      },
                    );
                }),
          );
        }),
      ],
    );
  }
}

//class ProductScreen extends StatefulWidget {
//  @override
//  _ProductScreenState createState() => _ProductScreenState();
//}

//class _ProductScreenState extends State<ProductScreen> {
//final _pageController = PageController();

//@override
//Widget build(BuildContext context) {
//  return
// }
//}
