import 'package:flutter/material.dart';
import 'produits_list.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produits App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProduitsList(),
    );
  }
}
