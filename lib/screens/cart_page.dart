import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen(
      {required this.cartItem,
      required this.resetCart,
      required this.increaseItem,
      required this.decreaseItem,
      super.key});
  final Map<String, int> cartItem;
  final void Function(String item) increaseItem;
  final void Function(String item) decreaseItem;
  final void Function() resetCart;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "Your cart is empty",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
    if (widget.cartItem.isNotEmpty) {
      content = Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItem.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 76, 230, 143),
                        Color.fromARGB(255, 105, 183, 247)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Dismissible(
                    key: Key(widget.cartItem.keys.elementAt(index)),
                    onDismissed: (direction) => {
                      setState(() {
                        widget.cartItem
                            .remove(widget.cartItem.keys.elementAt(index));
                      })
                    },
                    child: ListTile(
                      title: Text(widget.cartItem.keys.elementAt(index)),
                      subtitle: Text(widget
                          .cartItem[widget.cartItem.keys.elementAt(index)]
                          .toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () => widget.increaseItem(
                                  widget.cartItem.keys.elementAt(index)),
                              icon: const Icon(Icons.add)),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () => widget.decreaseItem(
                                  widget.cartItem.keys.elementAt(index)),
                              icon: const Icon(Icons.remove)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: widget.resetCart, child: const Text("reset")),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
      ),
      body: content,
    );
  }
}
