import 'package:bai4/screens/cart_page.dart';
import 'package:bai4/screens/detail_page.dart';
import 'package:bai4/screens/list_item_page.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final Map<String, int> _cartItem = {};
  void addItem(String item) {
    setState(
      () {
        if (_cartItem.containsKey(item)) {
          _cartItem[item] = (_cartItem[item] ?? 0) + 1;
        } else {
          _cartItem[item] = 1;
        }
      },
    );
  }

  void increase(String item) {
    setState(() {
      _cartItem[item] = (_cartItem[item] ?? 0) + 1;
    });
  }

  void decrease(String item) {
    setState(() {
      if (_cartItem[item]! > 1 || _cartItem[item] != null) {
        _cartItem[item] = _cartItem[item]! - 1;
      } else {
        _cartItem.remove(item);
      }
    });
  }

  void reset() {
    setState(() {
      _cartItem.clear();
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          ListItemScreen(
            addToCart: addItem,
          ),
          CartScreen(
            cartItem: _cartItem,
            resetCart: reset,
            increaseItem: increase,
            decreaseItem: decrease,
          ),
          const DetailScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Menu",
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart_outlined),
          ),
          BottomNavigationBarItem(
            label: "Food",
            icon: Icon(Icons.fastfood),
          )
        ],
      ),
    );
  }
}
