//import 'package:delivery_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app_forn/models/provider_model.dart';
import 'package:delivery_app_forn/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //scoped model serve para poder acessar as interações com o firebase
    //de todos os lugares do código (por exemplo login), no app, queremos
    //que seja exibido o nome do usuário nas outras telas depois de logar,
    //então vamos definir as outras telas como sendo 'filhas' do scoped model,
    //quando o scoped model verificar que houve a mudança no app (o usuário
    //logou, por exemplo) ele mandará essa informação para todos os seus filhos,
    //e assim o nome do usuário aparece em todas as telas.
    //
    //na pasta 'models' teremos funções como signup, signin, isLooged, etc.
    return ScopedModel<ProviderModel>(
      model: ProviderModel(),
      child: MaterialApp(
        title: 'pida-lá',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromARGB(255, 90, 100, 200),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProviderModel>(
        builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Olá, ${!model.isLoggedIn() ? "" : model.provData["name"]}",
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  model.signOut();
                })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Login Screen"),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )
          ],
        ),
      );
    });
  }
}
