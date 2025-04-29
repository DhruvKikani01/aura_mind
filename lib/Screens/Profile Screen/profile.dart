import 'package:aura_mind/Screens/Login%20Screen/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late SharedPreferences _preferences;

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();
  }

  Future _isLogOut() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen()),
        (Route r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(color: Color(0XFFEBD82F)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/img_1.png"),
                    radius: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Dhruv Kikani",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              height: 117,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.camera_alt_outlined),
                    Text(
                      "Therapy Goal",
                      style: TextStyle(fontFamily: "PoppinsBold", fontSize: 20),
                    ),
                    Text(
                      "Healthy individuals should be advised to undergo therapy once or twice every 15 days.",
                      style:
                          TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 132,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Track your journey!",
                            style: TextStyle(
                                fontFamily: "PoppinsBold", fontSize: 20),
                          ),
                          Text(
                            "Monitor your daily emotional and mental state, track your progress, and continue your personalized journey to achieve your goals.",
                            style: TextStyle(
                                fontFamily: "PoppinsRegualr", fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Image.asset("assets/images/img_2.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Your journey!",
              style: TextStyle(fontFamily: "PoppinsBold"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 37,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 28,
                      width: 102,
                      decoration: BoxDecoration(
                          color: Color(0XFF41CCE8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "This Week",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    Container(
                      height: 28,
                      width: 102,
                      decoration: BoxDecoration(
                          color: Color(0XFF41CCE8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Months",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    Container(
                      height: 28,
                      width: 102,
                      decoration: BoxDecoration(
                          color: Color(0XFF41CCE8),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Total",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 97,
              width: 370,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 70,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          Text("Therapy"),
                          Text("0")
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text("Minute"),
                          Text("0")
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.monitor_heart_outlined),
                          Text("Activity"),
                          Text("0")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _isLogOut();
                _preferences.setBool("isLogin", false);
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
