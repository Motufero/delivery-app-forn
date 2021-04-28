import 'package:delivery_app_forn/models/provider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

// ignore: camel_case_types
class configFornecedor extends StatefulWidget {
  @override
  _configFornecedorState createState() => _configFornecedorState();
}

// ignore: camel_case_types
class _configFornecedorState extends State<configFornecedor> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController novoNomeFornController = TextEditingController();
  TextEditingController novaSenhaFornController = TextEditingController();
  TextEditingController novoEmailController = TextEditingController();
  TextEditingController novoTelefoneController = TextEditingController();
  TextEditingController novoBairroFornController = TextEditingController();
  TextEditingController novaCepFornController = TextEditingController();
  TextEditingController novaCidadeController = TextEditingController();
  TextEditingController novoEstadoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _pageControler;
    return PageView(
      controller: _pageControler,
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
              ),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text("Menu de Configuração",
                          style:
                              TextStyle(fontSize: 25.0, color: Colors.black)),
                      Padding(padding: EdgeInsets.all(10)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                            Text(
                              "Seu nome:",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          hintText: model.provData["name"],
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

                      //mudar email
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                            Text(
                              "Seu Email: ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          hintText: model.provData["email"],
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),

                      //mudar a senha
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                            Text(
                              "Redefinir senha:   ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            IconButton(
                                icon: const Icon(Icons.help), onPressed: null),
                          ],
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),

                      //confirmação de senha
                      Padding(padding: const EdgeInsets.all(10.0)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                            Text(
                              "Confirmar nova senha: ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),

                      //config do telefone
                      Padding(padding: const EdgeInsets.all(20.0)),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                            Text(
                              "Seu Telefone: ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          hintText: model.provData["tel"],
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(10.0)),

                      //para mudar endereço automaticamente usando o mapa
                      // ignore: deprecated_member_use
                      RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        color: Colors.blueAccent,
                        elevation: 4.0,
                        splashColor: Colors.lightBlueAccent,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Mudar endereço",
                                style: TextStyle(fontSize: 20.0)),
                            Icon(
                              Icons.map_sharp,
                            )
                          ],
                        ),
                      ),

                      //Para as abas de endereço manualmente agora.
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 20, 0, 10)),
                              Text(
                                "Bairro: ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 90, 10)),
                              Text(
                                "CEP: ",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(90, 0, 0, 10)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                              new Flexible(
                                child: new TextFormField(
                                  decoration: new InputDecoration(
                                    hintText: model.provData["address"],
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              new Flexible(
                                child: new TextFormField(
                                  decoration: new InputDecoration(
                                    hintText: model.provData["cep"],
                                    fillColor: Colors.white,
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                      borderSide: new BorderSide(),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  style: new TextStyle(
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 20, 0, 10)),
                              Text(
                                "Cidade:",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 90, 10)),
                              Text(
                                "Estado:",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(90, 0, 0, 10)),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 10)),
                                new Flexible(
                                  child: new TextFormField(
                                    decoration: new InputDecoration(
                                      hintText: model.provData["city"],
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                                new Flexible(
                                  child: new TextFormField(
                                    decoration: new InputDecoration(
                                      hintText: model.provData["state"],
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(25.0),
                                        borderSide: new BorderSide(),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    style: new TextStyle(
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // ignore: deprecated_member_use
                          RaisedButton(
                            padding: EdgeInsets.all(10.0),
                            color: Colors.blueAccent,
                            elevation: 4.0,
                            splashColor: Colors.lightBlueAccent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Salvar",
                                    style: TextStyle(fontSize: 20.0)),
                                Icon(
                                  Icons.check,
                                )
                              ],
                            ),
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            padding: EdgeInsets.all(10.0),
                            color: Colors.blueAccent,
                            elevation: 4.0,
                            splashColor: Colors.lightBlueAccent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Voltar",
                                    style: TextStyle(fontSize: 20.0)),
                                Icon(
                                  Icons.exit_to_app,
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
        })
      ],
    );
  }
}
