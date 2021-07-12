import 'package:flutter/material.dart';

class ShowImageScreen extends StatefulWidget {
  String getName;
  String getDate;
  String getImage;

  ShowImageScreen({this.getName, this.getDate, this.getImage});

  @override
  _ShowImageScreenState createState() => _ShowImageScreenState();
}

class _ShowImageScreenState extends State<ShowImageScreen> {
  String setName;
  String setDate;
  String setImage;

  @override
  void initState() {
    setName = widget.getName.toString();
    setDate = widget.getDate.toString();
    setImage = widget.getImage.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.black,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0))),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  child: Image.network(setImage),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Name: " + setName,
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Created At: " + setDate,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
