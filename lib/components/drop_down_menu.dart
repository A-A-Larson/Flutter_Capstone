import 'package:flutter/material.dart';
import 'package:capstone_assignment/plant_model.dart';

class DropdownMenu extends StatelessWidget {
  final PlantModel dropdownValue;
  final List<PlantModel> plantList;
  final Function(String?) onChanged;

  const DropdownMenu({key, required this.dropdownValue, required this.plantList, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue.name,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      elevation: 16,
      style: const TextStyle(color: Colors.white),
      underline: Container(
        height: 2,
      ),
      dropdownColor: Colors.blueGrey[200],
      onChanged: (String? newValue) {
        onChanged(newValue);
      },
      items: plantList.map<DropdownMenuItem<String>>((PlantModel plant) {
        return DropdownMenuItem<String>(
            value: plant.name,
            child: Text(plant.name),
        );
      }).toList(),
    );
  }
}
