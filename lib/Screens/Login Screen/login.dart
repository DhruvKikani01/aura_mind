import 'package:aura_mind/Screens/Sign%20up%20Screen/signup.dart';
import 'package:aura_mind/Utils/MyValidator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Bottom Navigation Screen/bottomnav.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> ValidKey = GlobalKey<FormState>();

  bool isObsecure = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLogin = false;

  late SharedPreferences _preferences;

  void _initSharedPrefernces() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPrefernces();
  }

  bool isLoading = false;

  Future _loginAPI() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse("https://reqres.in/api/login");
    var responce = await http.post(url,
        body: {"email": emailController.text, "password": passwordController.text});
    if (responce.statusCode == 200) {
      _preferences.setBool("isLogin", true);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const BottomnavScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login failed! Please check your credentials."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: ValidKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
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
                  const Text(
                    "Hi, Welcome back!",
                    style: TextStyle(fontFamily: "PoppinsBold", fontSize: 18),
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
                        style: TextStyle(
                            fontFamily: "PoppinsRegular", fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                        style: TextStyle(
                            fontFamily: "PoppinsRegular", fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: Colors.black),
                          )),
                      const SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (ValidKey.currentState!.validate()) {
                          _loginAPI();
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
                            "Login",
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
                        style: TextStyle(
                            fontFamily: "PoppinsRegular", fontSize: 14),
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
                          backgroundColor:
                              const WidgetStatePropertyAll(Colors.white),
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
                                  fontFamily: "PoppinsRegular",
                                  color: Colors.black),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
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
                                        const SignupScreen()));
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: Colors.black,
                                fontSize: 12),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
