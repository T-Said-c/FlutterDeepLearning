import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/auth.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {

      final User? user = Auth().currentUser;

    String _userEmail() {
    return user?.email ?? 'user email';
  }


    // return const Placeholder();
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white54,
                Color.fromARGB(255, 157, 219, 241),
                Colors.white54,
              ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    child: Text("NA"),
                  ),
                  // SizedBox(width: 10.0),
                  Text(
                    _userEmail(),
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          ExpansionTile(
            childrenPadding: const EdgeInsets.only(left: 40.0),
            leading: const Icon(Icons.ad_units),
            trailing: const Icon(Icons.arrow_downward),
            title: const Text("Image Classification Model"),
            subtitle: const Text(
              "Fruits",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              ListTile(
                onTap: () => {Navigator.pushNamed(context, '/ann')},
                title: const Text("ANN Model"),
              ),
              const ListTile(
                title: Text("CNN Model"),
              ),
            ],
          ),
          const Divider(thickness: 3.0),
          const ListTile(
            leading: Icon(Icons.access_time_filled_outlined),
            title: Text("Stock Price Prediction"),
            subtitle: Text("LSTM"),
          ),
          const Divider(thickness: 3.0),
          ListTile(
            leading: const Icon(Icons.ac_unit_outlined),
            title: const Text("Vocal Assistant"),
            subtitle: const Text("Gemeni"),
            onTap: () {
              Navigator.pushNamed(context, '/Voice');
            },
          ),
          const Divider(thickness: 3.0),
          const ListTile(
            leading: Icon(Icons.abc_sharp),
            title: Text("Retrieval Augmented Generation"),
            subtitle: Text("RAG"),
          ),
          const Divider(thickness: 3.0),
        ],
      ),
    );
  }
}
