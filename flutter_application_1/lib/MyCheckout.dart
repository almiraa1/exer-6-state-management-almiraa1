import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shoppingcart_provider.dart';

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<ShoppingCart>();

    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total: ${cart.cartTotal}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: cart.cart.isEmpty
                  ? null
                  : () {
                      context.read<ShoppingCart>().removeAll();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Payment Successful"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}