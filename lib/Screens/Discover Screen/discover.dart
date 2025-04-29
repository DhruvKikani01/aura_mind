import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover",
          style: TextStyle(fontFamily: "PoppinsBold", fontSize: 22),
        ),
        backgroundColor: Color(0XFFEBD82F),
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(color: Color(0XFFEBD82F)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.white)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    hintText: "Search here",
                    hintStyle:
                        TextStyle(fontFamily: "PoppinsRegular", fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended for you",
                  style: TextStyle(fontFamily: "PoppinsBold", fontSize: 22),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "view all",
                      style: TextStyle(
                          color: Color(0XFF41CCE8),
                          fontFamily: "PoppinsRegular"),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 220,
              child: ListView.separated(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/Aarav.png",
                      height: 221,
                      width: 150,
                    )),
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 10,
                  width: 10,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "What's New In AuraMind",
                  style: TextStyle(fontFamily: "PoppinsBold", fontSize: 22),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/nature.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 80,
                  width: 370,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explore Breathing Exercises",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "PoppinsBold",
                              fontSize: 22),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.book_outlined,color: Colors.white,),
                            Text("Guide",style: TextStyle(color: Colors.white),),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.watch_later_outlined,color: Colors.white,),
                            Text("1:37",style: TextStyle(color: Colors.white),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
