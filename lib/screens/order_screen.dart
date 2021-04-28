import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/tabs/order_tab.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  const OrderScreen(this.snapshot);
  @override
  Widget build(BuildContext context) {
    //String name = getName(snapshot.data["clientID"]);
    return SizedBox(
      height: 200,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => OrderTab()));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cliente: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Distância: TO-DO",
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Data: ${snapshot.data["dateOrder"].toString()}",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size: 15,
                      ),
                    ],
                  ),
                  Text(
                    "Valor: ${snapshot.data["totalPrice"].toString()}",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getName(Ident) {
    return Ident.data["name"];
  }
}
