import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future _openEmailFromLink() async {
    final Uri emailLink = Uri(
        scheme: 'mailto',
        path: 'dhruvkikani01@gmail.com',
        query: encodeQueryParameters({
          'subject': 'Book An Appointment',
          'body': 'I want to book an appointment at'
        }));
    if (!await canLaunchUrl(emailLink) == true) {
      launchUrl(emailLink);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Could't open $emailLink"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future _openPhone() async {
    final Uri phoneLink = Uri(scheme: 'tel', path: '+91 8849936961');
    if (await canLaunchUrl(phoneLink) == true) {
      await launchUrl(phoneLink);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Could't open $phoneLink"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/Back.png",
                width: 500,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                top: 80,
                left: 350,
                child: Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/images/Crown.png")),
                    ),
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                            onPressed: () {},
                            icon: Image.asset("assets/images/Profile.png"))),
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: IconButton(
                            onPressed: () {},
                            icon:
                                Image.asset("assets/images/Notification.png")))
                  ],
                ),
              ),
              Positioned(
                top: 310,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const Text(
                      "Start each day with a new step.",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular", color: Colors.white),
                    ),
                    const Text(
                      "Book your first appointment now!",
                      style: TextStyle(
                          fontFamily: "PoppinsRegular", color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _openPhone();
                          },
                          style: const ButtonStyle(
                            side: WidgetStatePropertyAll(
                                BorderSide(color: Color(0XFFEBD82F))),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.transparent),
                          ),
                          child: const Text(
                            "Book By A Call",
                            style: TextStyle(color: Color(0XFFEBD82F)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _openEmailFromLink();
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.transparent),
                              side: WidgetStatePropertyAll(
                                  BorderSide(color: Color(0XFFEBD82F)))),
                          child: const Text(
                            "Book By A Mail",
                            style: TextStyle(color: Color(0XFFEBD82F)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Therapy Categories",
                    style: TextStyle(fontFamily: "PoppinsBold", fontSize: 22),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 119,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/Family.png",
                              fit: BoxFit.cover,
                              height: 119,
                              width: 196,
                            ),
                            const Positioned(
                              top: 90,
                              left: 15,
                              child: Text(
                                "Family And Couple",
                                style: TextStyle(
                                    fontFamily: "PoppinsRegular",
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/Exam.png",
                                fit: BoxFit.cover,
                                width: 196,
                                height: 119,
                              ),
                            ),
                            const Positioned(
                              top: 90,
                              left: 15,
                              child: Text(
                                "Exam Anxiety",
                                style: TextStyle(
                                    fontFamily: "PoppinsRegular",
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/adult.jpg",
                                fit: BoxFit.cover,
                                width: 196,
                                height: 119,
                              ),
                            ),
                            const Positioned(
                              top: 90,
                              left: 15,
                              child: Text(
                                "Adult Psychology",
                                style: TextStyle(fontFamily: "PoppinsRegular"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "General Therapist",
                        style:
                            TextStyle(fontFamily: "PoppinsBold", fontSize: 22),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          "assets/images/Aarav.png",height: 221,width: 150,)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Aarav Sharma",
                                          style: TextStyle(
                                              fontFamily: "PoppinsRegular",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          "5",
                                          style: TextStyle(
                                              fontFamily: "PoppinsRegular"),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Expert Therapist",
                                      style: TextStyle(
                                          fontFamily: "PoppinsRegular",
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          // Button-like padding
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            // Transparent background
                                            border: Border.all(
                                                color: const Color(0XFFEBD82F)),
                                            // Yellow border
                                            borderRadius: BorderRadius.circular(
                                                30), // Optional: Add rounded corners
                                          ),
                                          child: const Text(
                                            "Social Anxiety",
                                            style: TextStyle(
                                              color: Color(0XFFEBD82F),
                                              // Yellow text
                                              fontSize:
                                                  12, // Adjust text size if needed
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          // Button-like padding
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            // Transparent background
                                            border: Border.all(
                                                color: const Color(0XFFEBD82F)),
                                            // Yellow border
                                            borderRadius: BorderRadius.circular(
                                                30), // Optional: Add rounded corners
                                          ),
                                          child: const Text(
                                            "Depression",
                                            style: TextStyle(
                                              color: Color(0XFFEBD82F),
                                              // Yellow text
                                              fontSize:
                                                  12, // Adjust text size if needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _openPhone();
                                      },
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0XFFEBD82F)),
                                      ),
                                      child: const Text(
                                        "Book Appointment",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PoppinsRegular"),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "CBT Therapist",
                        style:
                            TextStyle(fontFamily: "PoppinsBold", fontSize: 22),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          "assets/images/Jiten.jpg",height: 221,width: 150,fit: BoxFit.fitHeight,)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Jiten Rathi",
                                          style: TextStyle(
                                              fontFamily: "PoppinsRegular",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          "5",
                                          style: TextStyle(
                                              fontFamily: "PoppinsRegular"),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Expert Therapist",
                                      style: TextStyle(
                                          fontFamily: "PoppinsRegular",
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          // Button-like padding
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            // Transparent background
                                            border: Border.all(
                                                color: const Color(0XFFEBD82F)),
                                            // Yellow border
                                            borderRadius: BorderRadius.circular(
                                                30), // Optional: Add rounded corners
                                          ),
                                          child: const Text(
                                            "Cognitive Restructuring",
                                            style: TextStyle(
                                              color: Color(0XFFEBD82F),
                                              // Yellow text
                                              fontSize:
                                                  12, // Adjust text size if needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _openPhone();
                                      },
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0XFFEBD82F)),
                                      ),
                                      child: const Text(
                                        "Book Appointment",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PoppinsRegular"),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),const Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Relationship & Family",
                        style:
                            TextStyle(fontFamily: "PoppinsBold", fontSize: 22),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          "assets/images/Rachel.jpg",height: 221,width: 150,fit: BoxFit.fitHeight,)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "Rachel Jones",
                                          style: TextStyle(
                                              fontFamily: "PoppinsRegular",
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          "5",
                                          style: TextStyle(
                                              fontFamily: "PoppinsRegular"),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Expert Therapist",
                                      style: TextStyle(
                                          fontFamily: "PoppinsRegular",
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          // Button-like padding
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            // Transparent background
                                            border: Border.all(
                                                color: const Color(0XFFEBD82F)),
                                            // Yellow border
                                            borderRadius: BorderRadius.circular(
                                                30), // Optional: Add rounded corners
                                          ),
                                          child: const Text(
                                            "Couple Counseling",
                                            style: TextStyle(
                                              color: Color(0XFFEBD82F),
                                              // Yellow text
                                              fontSize:
                                                  12, // Adjust text size if needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _openPhone();
                                      },
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color(0XFFEBD82F)),
                                      ),
                                      child: const Text(
                                        "Book Appointment",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "PoppinsRegular"),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
