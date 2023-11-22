import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/screens/widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(16),
          // height: size.height,
          // width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Constants.primaryColor.withOpacity(.5),
                    width: 5
                  )
                ),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: ExactAssetImage("assets/images/profile.jpg"),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("John Doe", style: TextStyle(
                    color: Constants.blackColor,
                    fontSize: 20
                  ),),
                  SizedBox(
                    height: 24,
                    child: Image.asset("assets/images/verified.png"),
                  )
                ],
              ),
              Text("johndoe@gmail.com", style: TextStyle(
                color: Constants.blackColor.withOpacity(.3),
              ),),
              const SizedBox(height: 30,),
              SizedBox(
                height: size.height*.7,
                width: size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileWidget(icon: Icons.person, title: "My Profile",),
                    ProfileWidget(icon: Icons.settings, title: "Setting",),
                    ProfileWidget(icon: Icons.notifications, title: "Notification",),
                    ProfileWidget(icon: Icons.chat, title: "FAQs",),
                    ProfileWidget(icon: Icons.share, title: "Share",),
                    ProfileWidget(icon: Icons.logout, title: "Log Out",),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

