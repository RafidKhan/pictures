import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pictures/widgets/bottom_sheet_widget.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var uri = Uri.parse(
      "https://api.unsplash.com/photos/?client_id=Z6LZTMDBlJMKvlMfXLgSyLRe8N1vspLth2llGFTodbQ");

  List imageData = [];
  List<String> networkImages = [];
  List<String> userNames = [];
  List<String> creationDate = [];
  bool showImage = false;

  getImage() async {
    http.Response response = await http.get(uri);

    imageData = json.decode(response.body);
    assign();
    setState(() {
      showImage = true;
    });
  }

  assign() {
    for (var i = 0; i < imageData.length; i++) {
      networkImages.add(imageData.elementAt(i)["urls"]["regular"]);
      userNames.add(imageData.elementAt(i)["user"]["name"]);
      creationDate.add(imageData.elementAt(i)["created_at"]);
    }
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getImage();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "𝓟𝓲𝓬𝓽𝓾𝓻𝓮𝓼",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w100),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Expanded(
              child: showImage==false? Center(child: CircularProgressIndicator()) : ListView.builder(
                itemCount: imageData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            child:
                                Image.network(networkImages.elementAt(index)),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (builder) {
                                  return BottomSheetWidget(
                                    name: userNames.elementAt(index),
                                    date: creationDate.elementAt(index),
                                    image: networkImages.elementAt(index),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
