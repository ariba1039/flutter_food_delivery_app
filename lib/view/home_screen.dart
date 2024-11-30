import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/model/categories_model.dart';
import 'package:flutter_food_delivery_app/model/products_model.dart';
import 'package:flutter_food_delivery_app/utils/app_colors.dart';
import 'package:flutter_food_delivery_app/view/cart_screen.dart';
import 'package:flutter_food_delivery_app/widgets/food_products_item.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String category = "";
  List<MyProductModel> productModel = [];
  @override
  void initState() {
    super.initState();
    // set the initial category to the first item in myCategories and initially display the first category
    if (myCategories.isNotEmpty) {
      category = myCategories[0].name;

      filterProductByCategory(category);
    }
  }

  void filterProductByCategory(String selectedCayegory) {
    setState(() {
      category = selectedCayegory;
      productModel = myProductModel
          .where(
            (element) =>
                element.category.toLowerCase() ==
                selectedCayegory.toLowerCase(),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your Location , ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: kblack,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: korange,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Ariba , Germany ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kblack),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: kblack,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: kblack,
                        ),
                      ),
                      cartProvider.carts.isNotEmpty
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFf95f60),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    cartProvider.carts.length.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Let's finds the best food around you",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: -.4,
              color: kblack,
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Find by Category",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: kblack,
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                  color: Colors.orange,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                myCategories.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      filterProductByCategory(myCategories[index].name);
                    },
                    child: Container(
                      height: 120,
                      width: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: category == myCategories[index].name
                            ? Border.all(width: 2.5, color: korange)
                            : Border.all(color: Colors.white),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Container(
                                height: 30,
                                width: 47,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: kblack.withOpacity(0.4),
                                      offset: const Offset(0, 10),
                                      blurRadius: 12,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                myCategories[index].image,
                                width: 50,
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            myCategories[index].name,
                            style: const TextStyle(
                              color: kblack,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Result (${productModel.length})",
            style: TextStyle(
              color: kblack.withOpacity(0.6),
              fontWeight: FontWeight.bold,
              letterSpacing: -.2,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(
              productModel.length,
              (index) => Padding(
                padding: index == 0
                    ? const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      )
                    : const EdgeInsets.only(right: 25),
                child: FoodProductItems(
                  productModel: productModel[index],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
