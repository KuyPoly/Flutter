import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
          )
      )
    )
  );
}

enum Product{
  dart(
    title: 'Dart',
    description: 'The best object language',
    image: 'assets/ex3/dart.png'
  ),
  flutter(
    title: 'Flutter',
    description: 'The best mobile widget library',
    image: 'assets/ex3/flutter.png'
  ),
  firebase(
    title: 'Firebase',
    description: 'The best cloud database',
    image: 'assets/ex3/firebase.png'
  );

  final String title;
  final String description;
  final String image;

  const Product({required this.title, required this.description, required this.image});
}

class ProductCard extends StatelessWidget{
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        );
    const descStyle = TextStyle(
                          fontSize: 16,
                        );

    return SizedBox(
      width: double.infinity, // makes all cards fill same width
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 100, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.image, height: 70, width: 70, fit: BoxFit.contain),
              const SizedBox(height: 8),
              Text(product.title, style: titleStyle),
              Text(product.description, style: descStyle),
            ],
          ),
        ),
      ),
    );
  }
}