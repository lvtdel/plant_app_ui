import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screens/widgets/plant_widget.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addedToCartPlants;

  const CartPage({super.key, required this.addedToCartPlants});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int _calTotals() {
    int result = 0;

    widget.addedToCartPlants.forEach((element) {
      result += element.price;
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: widget.addedToCartPlants.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your cart is empty",
                      style: TextStyle(
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    )
                  ],
                ),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.addedToCartPlants.length,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => PlantWidget(
                            index: index, plantList: widget.addedToCartPlants),
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(thickness: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Totals", style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w300
                            ),
                            ),
                            Text("\$${_calTotals()}", style: TextStyle(
                              fontSize: 24,
                              color: Constants.primaryColor,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
  }
}
