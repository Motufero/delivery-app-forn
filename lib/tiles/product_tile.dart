import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/data/product_data.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  //final DocumentSnapshot snapshot;

  final ProductData product;

  //ProductTile(this.product, this.snapshot);
  //ProductTile(this.snapshot);
  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    print(product.title);
    return InkWell(
      child: Card(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.title,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    //TODO mudar paera string as fixed.
                    Text(
                      "R\$ ${product.price.toString()}",
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
