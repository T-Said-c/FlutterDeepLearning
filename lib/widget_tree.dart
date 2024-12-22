import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';
import 'package:flutter_app/components/SignUp_LogIn.dart';
import 'package:flutter_app/components/Homepage.dart';


class WidgetTree extends StatefulWidget{
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          } else {
            return const SignupLogin();
          }
      },
    );
  }
}