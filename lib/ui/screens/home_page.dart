import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screens/widgets/plant_widget.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final List<Plant> _plantList;

  const HomePage({super.key, required plantList}) : _plantList = plantList;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool toggleIsFavorite(bool isFavorite) {
    return !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery
        .of(context)
        .size;

    final List<Plant> plantList = widget._plantList;

    final List<String> plantTypes = [
      "Recommended",
      "Indoor",
      "Outdoor",
      "Garden",
      "Supplement"
    ];



    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      width: size.width * .9,
                      decoration: BoxDecoration(
                          color: Constants.primaryColor.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.black54.withOpacity(0.6),
                          ),
                          const Expanded(
                              child: TextField(
                                showCursor: false,
                                decoration: InputDecoration(
                                  hintText: "Search plant",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              )),
                          Icon(Icons.mic, color: Colors.black54.withOpacity(.6),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 50,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plantTypes.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(padding: const EdgeInsets.all(8.0),
                      child:GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          plantTypes[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.w300,
                            color: selectedIndex == index ? Constants.primaryColor : Constants.blackColor
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: size.height * .3,
                child: ListView.builder(
                  itemCount: plantList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(context, PageTransition(child: DetailPage(plantId: index), type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: 300,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Positioned(top: 10,
                          right: 20,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorite = toggleIsFavorite(plantList[index].isFavorite);
                                    plantList[index].isFavorite = isFavorite;
                                  });
                                },
                                icon: Icon(plantList[index].isFavorite ? Icons.favorite : Icons.favorite_border),
                                color: Constants.primaryColor,
                                iconSize: 30,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 50,
                            right: 50,
                            bottom: 50,
                            child: Image.asset(plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(plantList[index].category,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16
                                ),),
                                Text(plantList[index].plantName,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),),

                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Text(r"$" + plantList[index].price.toString(), style: TextStyle(
                                color: Constants.primaryColor,
                                fontSize: 16
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: const Text("New Plants", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: size.height * .5,
                child: ListView.builder(
                  itemCount: plantList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => PlantWidget(index: index, plantList: plantList),
                ),
              )

            ],
          ),
        ));
  }
}

