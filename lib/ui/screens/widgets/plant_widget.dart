import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';


import '../detail_page.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    super.key,
    required this.index,
    required this.plantList,
  });

  final int index;
  final List<Plant> plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageTransition(child: DetailPage(plantId: index), type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Constants.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(10)
        ),
        height: 80,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.5),
                      shape: BoxShape.circle
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(plantList[index].imageURL),
                  ),
                ),
                Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plantList[index].category),
                        Text(plantList[index].plantName, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Constants.blackColor
                        ),)
                      ],
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: Text(r"$" + plantList[index].price.toString(), style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Constants.primaryColor
              ),) ,
            )
          ],
        ),


      ),
    );
  }
}