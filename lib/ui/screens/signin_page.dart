import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/ui/root_page.dart';
import 'package:plant_app/ui/screens/forgot_password.dart';
import 'package:plant_app/ui/screens/signup_page.dart';
import 'package:plant_app/ui/screens/widgets/custom_textfield.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/signin.png", height: size.height * .3),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomTextField(
                obscureText: false,
                hintText: "Enter Email",
                icon: Icons.alternate_email),
            const CustomTextField(
                obscureText: true,
                hintText: "Enter Password",
                icon: Icons.lock),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const RootPage(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: const Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const ForgotPassword(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Center(
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: "Forgot Password? ",
                      style: TextStyle(color: Constants.blackColor),
                    ),
                    TextSpan(
                      text: "Reset Here",
                      style: TextStyle(color: Constants.primaryColor),
                    ),
                  ],
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR'),
                ),
                Expanded(child: Divider())
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Constants.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.asset("assets/images/google.png"),
                  ),
                  Text(
                    "Sign In with Google",
                    style: TextStyle(color: Constants.blackColor, fontSize: 18),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const SignUp(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Center(
                child: Text.rich(TextSpan(
                  children: [
                    TextSpan(
                      text: "New to Planty? ",
                      style: TextStyle(color: Constants.blackColor),
                    ),
                    TextSpan(
                      text: "Register",
                      style: TextStyle(color: Constants.primaryColor),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}