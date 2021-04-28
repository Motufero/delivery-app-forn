import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProductTab extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String prodType;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _addTitleController = TextEditingController();
  TextEditingController _addPriceController = TextEditingController();
  TextEditingController _addDescriptController = TextEditingController();
  TextEditingController _addLinkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Scaffold(
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text("Adicionar um Produto",
                    style: TextStyle(fontSize: 25.0, color: Colors.black)),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                      Text(
                        "Titulo:",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _addTitleController,
                  decoration: new InputDecoration(
                    hintText: ("Titulo do produto"),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (text) {
                    if (text.isEmpty || text.length < 5)
                      return "Titulo invalido!";
                  },
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
                      Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                      Text(
                        "Preço:",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _addPriceController,
                  decoration: new InputDecoration(
                    hintText: ("'X' R\$"),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (text) {
                    if (text.isEmpty || text.contains("-"))
                      return "Preço invalido!";
                  },
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(
                  height: 10.0,
                ),
                //para descriçao ================================================
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                      Text(
                        "descrição:",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _addDescriptController,
                  decoration: new InputDecoration(
                    hintText: ("Volume ou qntd"),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (text) {
                    if (text.isEmpty || text.length < 5)
                      return "Descrição invalida!";
                  },
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                //para a imagem ================================================
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                      Text(
                        "Imagem:",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: _addLinkController,
                  decoration: new InputDecoration(
                    hintText: ("insira o link da imagem (opcional)"),
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
                MyDropDown(),
                SizedBox(
                  height: 70.0,
                ),
                SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text(
                        "Adicionar Produto",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        prodType = MyDropDown().getValue();
                        if (_addLinkController.text.isEmpty &&
                            prodType == "água") {
                          _addLinkController.text =
                              "https://firebasestorage.googleapis.com/v0/b/delivery-gas-water.appspot.com/o/agua.jpg?alt=media&token=c13dd39b-59bd-44b1-9f34-5ba5d26b8a42";
                        }
                        if (_addLinkController.text.isEmpty &&
                            prodType == "gás") {
                          _addLinkController.text =
                              "https://firebasestorage.googleapis.com/v0/b/delivery-gas-water.appspot.com/o/gas.jpg?alt=media&token=115935a9-e38d-497a-af19-97a76dcff84d";
                        }
                        Firestore.instance
                            .collection("providers")
                            .document("1TD11Kw9nrWWfGcQeP7c0f3Vv422")
                            .collection("SaleProducts")
                            .document()
                            .setData({
                          'title': _addTitleController.text,
                          'price': _addPriceController.text,
                          'description': _addDescriptController.text,
                          'image': _addLinkController.text
                        });
                        _onSuccess();
                        Navigator.pop(context);
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Fornecedor criado com sucesso!"),
      duration: Duration(seconds: 2),
    ));
  }
}

class MyDropDown extends StatefulWidget {
  @override
  _MyDropDownState createState() => _MyDropDownState();

  String getValue() {}
}

class _MyDropDownState extends State<MyDropDown> {
  String getValue() {
    return dropValue;
  }

  String dropValue = "água";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 34.0,
      elevation: 20,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 3,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropValue = newValue;
        });
      },
      items:
          <String>['água', 'gás'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

//agua: https://firebasestorage.googleapis.com/v0/b/delivery-gas-water.appspot.com/o/agua.jpg?alt=media&token=c13dd39b-59bd-44b1-9f34-5ba5d26b8a42
//gas: https://firebasestorage.googleapis.com/v0/b/delivery-gas-water.appspot.com/o/gas.jpg?alt=media&token=115935a9-e38d-497a-af19-97a76dcff84d
