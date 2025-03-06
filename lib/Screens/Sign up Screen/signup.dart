import 'package:aura_mind/Screens/Bottom%20Navigation%20Screen/bottomnav.dart';
import 'package:aura_mind/Screens/Login%20Screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Utils/MyValidator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> SignUpKey = GlobalKey<FormState>();

  bool isObsecure = true;

  bool isConfirmObssecure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: SignUpKey,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 65,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Mind_Icon.png",
                  height: 66.31,
                  width: 88,
                ),
              ],
            ),
            Image.asset(
              "assets/images/AURA mind.png",
            ),
            const SizedBox(
              height: 15,
            ),
            const Column(
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(fontFamily: "PoppinsBold", fontSize: 18),
                ),
                Text(
                  "Start your mental  health journey today!",
                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Email",
                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: emailController,
                validator: (String? value) {
                  return MyValidator.emailValidator(value);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: Colors.black,
                cursorHeight: 25,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: " Enter an email",
                  hintStyle: const TextStyle(
                      fontFamily: "PoppinsRegular", fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Password",
                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextFormField(
                controller: passwordController,
                validator: (String? value) {
                  return MyValidator.passwordValidator(value);
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: isObsecure,
                cursorColor: Colors.black,
                cursorHeight: 25,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (isObsecure == true) {
                          isObsecure = false;
                        } else {
                          isObsecure = true;
                        }
                        setState(() {});
                      },
                      icon: isObsecure
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: " Enter a password",
                  hintStyle: const TextStyle(
                      fontFamily: "PoppinsRegular", fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Confirm Password",
                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 18),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextFormField(
                controller: confirmPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password";
                  }
                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: isConfirmObssecure,
                cursorColor: Colors.black,
                cursorHeight: 25,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (isConfirmObssecure == true) {
                          isConfirmObssecure = false;
                        } else {
                          isConfirmObssecure = true;
                        }
                        setState(() {});
                      },
                      icon: isConfirmObssecure
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: " Confirm password",
                  hintStyle: const TextStyle(
                      fontFamily: "PoppinsRegular", fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (SignUpKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                BottomnavScreen()));
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        const WidgetStatePropertyAll(Color(0XFFEBD82F)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: const SizedBox(
                  width: 372,
                  height: 60,
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontFamily: "PoppinsBold",
                          fontSize: 22,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/line.png"),
                const Text(
                  "Or",
                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 14),
                ),
                Image.asset("assets/images/line.png"),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
                onPressed: () {},
                child: SizedBox(
                  width: 372,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Login with google",
                        style: TextStyle(
                            fontFamily: "PoppinsRegular", color: Colors.black),
                      ),
                      const SizedBox(
                        width: 167,
                      ),
                      SizedBox(
                          height: 35,
                          width: 35,
                          child: Image.asset("assets/images/google.png"))
                    ],
                  ),
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Already have an account?",
                style: TextStyle(
                    fontFamily: "PoppinsRegular",
                    color: Colors.grey,
                    fontSize: 12),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen()));
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                        fontFamily: "PoppinsRegular",
                        color: Colors.black,
                        fontSize: 12),
                  ))
            ])
          ]),
        ),
      ),
    ));
  }
}
