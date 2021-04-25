import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/screens/product_screen.dart';
import 'package:delivery_app_forn/tiles/product_tile.dart';
import 'package:flutter/material.dart';

class ProviderTab extends StatelessWidget {
  const ProviderTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("providers").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          dynamic supplierTiles = snapshot.data.documents.map((doc) {
            return ProductScreen();
          }).toList();
          return ListView(padding: EdgeInsets.all(10), children: supplierTiles);
        }
      },
    );
  }
}
