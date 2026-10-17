import 'package:flutter/material.dart';
import 'package:mini_catalog/models/products_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data findProduct;
  final Set<int> cartIds;

  const new({super.key, required this.cartIds, required this.findProduct});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Back"), backgroundColor: Colors.white),
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Image.network(
                widget.findProduct.image!,
                width: double.infinity,
                height: 350,
                fit: BoxFit.cover,
              ),
          
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      widget.findProduct.name!,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    
                    Text(
                      widget.findProduct.tagline!,
                      style: TextStyle(
                        fontSize: 16, 
                        color: Colors.grey, 
                        overflow: TextOverflow.ellipsis),
                    ),
          
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18, 
                        color: Colors.black,
                        fontWeight: FontWeight.bold, 
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
          
                    Text(
                      widget.findProduct.description!,
                      style: TextStyle(fontSize: 16),
                    ),
                    
                    Text(
                      widget.findProduct.price!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold, 
                        color: Colors.blue.shade700),
                    ),
          
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.cartIds.add(widget.findProduct.id!);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Added to cart"),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                          ),
                        );
                      }, 

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text(
                        "Buy Now", 
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}