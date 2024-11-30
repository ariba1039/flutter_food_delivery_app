import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/model/cart_model.dart';
import 'package:flutter_food_delivery_app/provider/cart_provider.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';
import 'package:flutter_food_delivery_app/widgets/cart_items.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
      CartProvider cartProvider = Provider.of<CartProvider>(context);
    List<CartModel> carts = cartProvider.carts.reversed.toList();
    return Scaffold(
      backgroundColor: kbgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "My Cart",
                    style: TextStyle(
                      color: kblack,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    carts.length,
                    (index) => Container(
                      height: 145,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                        top: index == 0 ? 30 : 0,
                        right: 25,
                        left: 25,
                        bottom: 30,
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          FadeInUp(
                            delay: Duration(
                                milliseconds: (index + 1) *
                                    200), // after this animation is applied in all items one by one
                            child: CartItems(
                              cart: carts[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
