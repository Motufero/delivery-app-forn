import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/screens/order_screen.dart';
import 'package:delivery_app_forn/screens/product_screen.dart';
import 'package:delivery_app_forn/tiles/product_tile.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("orders").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          dynamic orderTiles = snapshot.data.documents.map((doc) {
            //  if (doc.data["supplierId"] == "1TD11Kw9nrWWfGcQeP7c0f3Vv422") {
            return OrderScreen(doc);
            //  }
          }).toList();

          return ListView(padding: EdgeInsets.all(10), children: orderTiles);
        }
      },
    );
  }
}
