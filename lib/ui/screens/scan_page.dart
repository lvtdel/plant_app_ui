import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Scanpage extends StatefulWidget {
  const Scanpage({super.key});

  @override
  State<Scanpage> createState() => _ScanpageState();
}

class _ScanpageState extends State<Scanpage> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants _constants = Constants();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 50,
              left: 50,
              right: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint("Favorited");
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(.15),
                      ),
                      child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.share,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/code-scan.png", height: 100,),
                    const SizedBox(height: 20,),
                    Text("Tap to scan", style: TextStyle(
                      color: Constants.primaryColor.withOpacity(.8),
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),)
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
