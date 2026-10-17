import 'package:flutter/material.dart';
import 'package:mini_catalog/models/products_model.dart';

class ProductsCardTile extends StatelessWidget {
  final Data findProduct;

  const new({super.key, required this.findProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                findProduct.image!,
                width: double.infinity,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  findProduct.name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                
                Text(
                  findProduct.tagline!,
                  style: TextStyle(
                    fontSize: 12, 
                    color: Colors.grey, 
                    overflow: TextOverflow.ellipsis),
                ),
                
                Text(
                  findProduct.price!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.blue.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}