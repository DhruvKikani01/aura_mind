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

  void _initSharedPreferences() async{
    _preferences = await SharedPreferences.getInstance();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initSharedPreferences();
  }

  Future _isLogOut() async{
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>LoginScreen()), (Route r)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _isLogOut();
            _preferences.setBool("isLogin", false);
          },
          child: Text(
            "Log Out",
            style: TextStyle(color: Colors.white),
          ),
          style:
              ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
        ),
      ),
    );
  }
}
