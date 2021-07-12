import 'package:flutter/material.dart';
import 'package:pictures/pages/bottom_sheet_screen.dart';

class BottomSheetWidget extends StatefulWidget {
  String name;
  String date;
  String image;

  BottomSheetWidget({this.name,this.date,this.image});
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  String getName;
  String getDate;
  String getImage;

  @override
  void initState() {
    getName= widget.name.toString();
    getDate= widget.date.toString();
    getImage= widget.image.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "𝓟𝓲𝓬𝓽𝓾𝓻𝓮𝓼",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w100),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 2.0,
        color: Colors.black,
        child: ShowImageScreen(
          getName: getName,
          getDate: getDate,
          getImage: getImage,
        ),
      ),
    );
  }
}
