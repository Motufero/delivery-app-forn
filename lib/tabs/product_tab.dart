import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductTab extends StatelessWidget {
  final String id;

  ProductTab(this.id);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptController = TextEditingController();
  TextEditingController _dellController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: FutureBuilder<DocumentSnapshot>(
            future: Firestore.instance
                .collection("providers")
                .document("1TD11Kw9nrWWfGcQeP7c0f3Vv422")
                .collection("SaleProducts")
                .document(id)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox(
                    child: Scaffold(
                  body: SingleChildScrollView(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Text("Configurações do Produto",
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.black)),
                          Padding(padding: EdgeInsets.all(10)),
                          //para o titulo====================================================
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                                Text(
                                  "Titulo:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: _titleController,
                            decoration: new InputDecoration(
                              hintText: snapshot.data["title"],
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),
                          //para o preço ================================================
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                                Text(
                                  "Preço:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: _priceController,
                            decoration: new InputDecoration(
                              hintText: snapshot.data["price"],
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            keyboardType: TextInputType.numberWithOptions(),
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),

                          SizedBox(
                            height: 10.0,
                          ),

                          //para descrição ==================================================
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                                Text(
                                  "Descrição",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: _descriptController,
                            decoration: new InputDecoration(
                              hintText: snapshot.data["description"],
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // ignore: deprecated_member_use
                              RaisedButton(
                                padding: EdgeInsets.all(8.0),
                                color: Colors.blue.shade400,
                                elevation: 4.0,
                                splashColor: Colors.lightBlueAccent,
                                onPressed: () {
                                  if (_titleController.text.isEmpty) {
                                    _titleController.text =
                                        snapshot.data["title"];
                                  }
                                  if (_priceController.text.isEmpty) {
                                    _priceController.text =
                                        snapshot.data["price"];
                                  }
                                  if (_descriptController.text.isEmpty) {
                                    _descriptController.text =
                                        snapshot.data["description"];
                                  }
                                  Firestore.instance
                                      .collection("providers")
                                      .document("1TD11Kw9nrWWfGcQeP7c0f3Vv422")
                                      .collection("SaleProducts")
                                      .document(id)
                                      .updateData({
                                    "title": _titleController.text,
                                    "price": _priceController.text,
                                    "description": _descriptController.text
                                  });
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Alterar",
                                        style: TextStyle(fontSize: 20.0)),
                                    Icon(
                                      Icons.check,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                                Text(
                                  "Deletar este item",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: _dellController,
                            decoration: new InputDecoration(
                              hintText: "para deletar, digite 'dell' ",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            validator: (text) {
                              if (text != "dell")
                                return "Digite 'dell' para deletar!";
                            },
                            style: new TextStyle(
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // ignore: deprecated_member_use
                              FloatingActionButton(
                                elevation: 4.0,
                                splashColor: Colors.lightBlueAccent,
                                onPressed: () {
                                  if (_dellController.text == "dell") {
                                    Firestore.instance
                                        .collection("providers")
                                        .document(
                                            "1TD11Kw9nrWWfGcQeP7c0f3Vv422")
                                        .collection("SaleProducts")
                                        .document(id)
                                        .delete();
                                    Navigator.pop(context);
                                  }
                                },
                                child: Icon(Icons.remove, color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
              }
            }));
  }

  void succsess() {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Item Removido com sucesso!"),
      duration: Duration(seconds: 2),
    ));
  }
}
