import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/components/Stockprediction.dart';
import 'firebase_options.dart';
import 'package:flutter_app/widget_tree.dart';
import 'package:flutter_app/Components/VocalAssistant.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
      '/Voice': (context)=> const VocalAssistant(),
      '/Stock': (context)=> const Stockprediction()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const WidgetTree(),
    );
  }
}


