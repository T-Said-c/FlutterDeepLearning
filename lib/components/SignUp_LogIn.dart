import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';

class SignupLogin extends StatefulWidget {
  const SignupLogin({super.key});


  @override
  State<SignupLogin> createState() => _SignupLoginState();
  }


class _SignupLoginState extends State<SignupLogin>{

  String? errorMessege ='';
  bool isLogin = true;
  final TextEditingController  _emailController = TextEditingController();
  final TextEditingController  _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessege = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessege = e.message;
      });
    }
  }

  Widget _title(){
    return  Text(isLogin ? 'Log-in' : 'Sign-up');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ){
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _errorMessege(){
    return Text(errorMessege == '' ? '' : 'Humm ? $errorMessege');
  }

  Widget _submitButton(){
    return ElevatedButton(
      onPressed: isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Log-in' : 'Sign-up'),
    );
  }

  Widget _switchLoginorSignup(){
    return TextButton(
      onPressed: (){
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Create an account' : 'Already have an account'),
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
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _entryField('Email', _emailController),
                _entryField('Password', _passwordController),
                _errorMessege(),
                _submitButton(),
                _switchLoginorSignup()
            ] 
            ),
            )

        );
  }
}


