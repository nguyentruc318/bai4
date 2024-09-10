import 'package:flutter/material.dart';

class ListItemScreen extends StatelessWidget {
  const ListItemScreen({required this.addToCart, super.key});
  final void Function(String item) addToCart;

  @override
  Widget build(BuildContext context) {
    final products = List.generate(9, (index) => 'Product $index');
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Product"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 72, 164, 239),
                  Color.fromARGB(255, 224, 110, 102)
                ])),
            child: ListTile(
              trailing: IconButton(
                  onPressed: () {
                    addToCart(products[index]);
                  },
                  icon: const Icon(Icons.add)),
              title: Text(products[index]),
            ),
          );
        },
      ),
    );
  }
}
