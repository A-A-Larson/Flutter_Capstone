import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:capstone_assignment/components/drop_down_menu.dart';
import 'package:capstone_assignment/plant_model.dart';

List<PlantModel> plantList = [
new PlantModel("None", "images/munene-ngigi-ijIOnLnteLE-unsplash.jpg", "N/A'", "N/A", "N/A", "N/A"),
new PlantModel("Hazelnut", "images/anna-evans-i1vWRxk3Cxg-unsplash.jpg", "8-16'", "8-15'", "Full, Partial", "Wind"),
new PlantModel("Seabuckthorn", "images/krzysia-brzozowska-DD0BSJGsGKA-unsplash.jpg", "8-18'", "8-10'", "Full", "Wind"),
new PlantModel("Grapevine", "images/sophie-backes-P46YyIPHB2U-unsplash.jpg", "12-15'", "4-10'", "Full", "Self"),
new PlantModel("Hazkap", "images/hazkap.jpg", "4-6'", "3-6'", "Full, Partial", "Insect/Wind"),
new PlantModel("Pawpaw", "images/pawpaw.png", "15-30'", "15-30'", "Full, Partial", "Insect")
];


class HomePage extends StatefulWidget {
  const HomePage({key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlantModel _dropdownValue = plantList.first;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Andrew Larson's Plant Stats App"),
      ),
      body: SingleChildScrollView (
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 10.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 300,
                  width: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    child: Image.asset(getImageFileName()),
                  ),
                ),
                Container(
                  width: 200,
                  child: Text(
                    'Plant:',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  color: Colors.blueGrey[300],
                  child: DropdownMenu(dropdownValue: _dropdownValue, plantList: plantList, onChanged: choosePlant)
                ),
            Text(
              "Height: " + _dropdownValue.height,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 200.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Text(
              "Width: " + _dropdownValue.width,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 200.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Text(
              'Sun: ' + _dropdownValue.sun,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 200.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Text(
              'Pollination: ' + _dropdownValue.pollination,
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 200.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void choosePlant(String? value) {
    if (value != null) {
      setState(() {
        _dropdownValue = plantList.firstWhere((plant) => plant.name == value);
      });
    }
  }

  String getImageFileName() {
    return _dropdownValue.img;
  }
}
