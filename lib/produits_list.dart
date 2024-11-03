import 'package:flutter/material.dart';
import 'produit_box.dart';
import 'add_produit.dart';
import 'produit.dart';

class ProduitsList extends StatefulWidget {
  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  List<Produit> produits = [
    Produit('Produit 1', 'Description 1', 10.0, 'assets/OIP.jpg'),
    Produit('Produit 2', 'Description 2', 20.0, 'assets/1.jpg'),
    Produit('Produit 3', 'Description 3', 30.0, 'assets/3.jpg'),
  ];
  
  List<bool> selectionne = [false, false, false];

  void ajouterProduit(Produit produit) {
    setState(() {
      produits.add(produit); // Add the new Produit instance
      selectionne.add(false); // Initialize selection state
    });
  }

  void supprimerProduit(int index) {
    setState(() {
      produits.removeAt(index); // Remove product at the index
      selectionne.removeAt(index); // Remove the selection state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final Produit? produit = await showDialog(
                context: context,
                builder: (_) => AddProduit(),
              );
              if (produit != null) {
                ajouterProduit(produit); // Add the new product if it is not null
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produits.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            produit: produits[index], // Pass the entire produit object
            selProduit: selectionne[index],
            onChanged: (bool? selected) {
              setState(() {
                selectionne[index] = selected ?? false; // Update selection state
              });
            },
            delProduit: () => supprimerProduit(index), // Delete product
          );
        },
      ),
    );
  }
}
