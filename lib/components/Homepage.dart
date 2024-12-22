import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';
import 'package:flutter_app/components/Login.dart';
import 'package:flutter_app/components/Signup.dart';
import 'package:flutter_app/components/menu.dart';
import 'package:flutter_app/components/VocalAssistant.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Homepage extends StatelessWidget {
  Homepage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title(){
    return const Text('Homepage');
  } 

  Widget _userUid(){
    return Text(user?.email ?? 'user email');
  }

  Widget _signOutButton(){
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(

        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            _signOutButton(),
          ],
        ),
      ),
      drawer: const Menu(),
    );
  }
}


