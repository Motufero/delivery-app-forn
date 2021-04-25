import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

//Model = objeto que vai guaradr os estados de alguma coisa,
//nesse caso, do login do nosso app
class ProviderModel extends Model {
  //para não precisar ficar escrevendo 'FirebaseAuth.instance' toda hora.
  FirebaseAuth _auth = FirebaseAuth.instance; //singleton

  //usuário que está logado no momento, null caso contrario.
  FirebaseUser firebaseUser;

  //para os dados mais importantes do usuário.
  Map<String, dynamic> provData = Map();
  bool isLoading = false;

  //criar um novo usuário.
  void signUp(
      {@required Map<String, dynamic> provData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: provData["email"], password: pass);
      firebaseUser = await _auth.currentUser() as FirebaseUser;
      await _saveUserData(provData);
      await _loadCurrentUser();
      onSuccess();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString() + " erro \n");
      onFail();
      isLoading = false;
      notifyListeners();
    }
  }

  //para logar
  void signIn(
      {@required String email,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
      await _loadCurrentUser();
      onSuccess();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("eu\n\n" + e.toString());
      onFail();
      isLoading = false;
      notifyListeners();
    }
  }

  Future<Null> _saveUserData(Map<String, dynamic> provData) async {
    this.provData = provData;
    await Firestore.instance
        .collection("providers")
        .document(firebaseUser.uid)
        .setData(provData);
  }

  Future<Null> _loadCurrentUser() async {
    if (firebaseUser == null) firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      DocumentSnapshot docProv = await Firestore.instance
          .collection("providers")
          .document(firebaseUser.uid)
          .get();
      this.provData = docProv.data;
    }
  }

  void signOut() async {
    await _auth.signOut();

    provData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }
}
