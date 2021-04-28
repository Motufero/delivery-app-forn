import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/tabs/add_product_tab.dart';
import 'package:delivery_app_forn/tabs/product_tab.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Seus produtos"),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("providers")
              .document("1TD11Kw9nrWWfGcQeP7c0f3Vv422")
              .collection("SaleProducts")
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductTab(
                              snapshot.data.documents[index].documentID)));
                      //  print(snapshot.data.documents[index].documentID);
                    },
                    child: Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data.documents[index].data["title"]}",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                width: 219,
                                child: Text(
                                  "${snapshot.data.documents[index].data["description"]}",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blueGrey),
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                              Text(
                                "R\$${snapshot.data.documents[index].data["price"]}",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          Expanded(
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image:
                                  snapshot.data.documents[index].data["image"],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProductTab()),
            );
          },
          tooltip: 'Adicionar itens',
          child: new Icon(Icons.add),
        ),
      ),
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
