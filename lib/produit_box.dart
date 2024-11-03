import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'produit.dart';

class ProduitBox extends StatelessWidget {
  final Produit produit; // Use the entire Produit object
  final bool selProduit;
  final Function(bool?) onChanged;
  final VoidCallback delProduit;

  ProduitBox({
    required this.produit,
    required this.selProduit,
    required this.onChanged,
    required this.delProduit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => delProduit(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Supprimer',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(produit.photo, width: 50, height: 50), // Display product photo
                  SizedBox(width: 10),
                  Text(produit.libelle), // Display product name
                ],
              ),
              Checkbox(
                value: selProduit,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
