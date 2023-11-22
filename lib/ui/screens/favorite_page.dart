import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/screens/widgets/plant_widget.dart';

import '../../models/plants.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritePlants;

  const FavoritePage({super.key, required this.favoritePlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: widget.favoritePlants.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/favorited.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your favorite plants",
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
                height: size.height * .5,
                child: ListView.builder(
                  itemCount: widget.favoritePlants.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => PlantWidget(
                      index: index, plantList: widget.favoritePlants),
                ),
              ));
  }
}
