import 'package:flutter/material.dart';
import 'produit.dart';

class AddProduit extends StatelessWidget {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController prixController = TextEditingController();
  final TextEditingController photoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ajouter un Produit'),
      content: SingleChildScrollView( // Use SingleChildScrollView to handle keyboard overlay
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomController,
              decoration: InputDecoration(hintText: 'Nom du Produit'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: 'Description du Produit'),
            ),
            TextField(
              controller: prixController,
              decoration: InputDecoration(hintText: 'Prix du Produit'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: photoController,
              decoration: InputDecoration(hintText: 'URL de la photo'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Annuler'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Ajouter'),
          onPressed: () {
            final String nom = nomController.text;
            final String description = descriptionController.text;
            final double? prix = double.tryParse(prixController.text);
            final String photo = photoController.text;

            // Validate inputs before creating the produit
            if (nom.isNotEmpty && prix != null && photo.isNotEmpty) {
              Navigator.of(context).pop(Produit(nom, description, prix, photo));
            } else {
              // Show a message if validation fails
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Veuillez remplir tous les champs correctement.')),
              );
            }
          },
        ),
      ],
    );
  }
}
