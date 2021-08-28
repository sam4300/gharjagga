import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Screens/TabScreens/addProduct.dart';

class FacilitiesCheckBoxes extends StatefulWidget {
  const FacilitiesCheckBoxes({Key? key}) : super(key: key);

  @override
  _FacilitiesCheckBoxesState createState() => _FacilitiesCheckBoxesState();
}

class _FacilitiesCheckBoxesState extends State<FacilitiesCheckBoxes> {
  List<String> facilities = [];
  final facilitiesList = [
    CheckBoxState(title: "Internet"),
    CheckBoxState(title: "Swimming Pool"),
    CheckBoxState(title: "Cable TV"),
    CheckBoxState(title: "Water Supply"),
    CheckBoxState(title: "Garbage Disposal"),
    CheckBoxState(title: "Garden"),
    CheckBoxState(title: "Peaceful"),
    CheckBoxState(title: "Solar Water"),
    CheckBoxState(title: "Electricity"),
    CheckBoxState(title: "Well"),
    CheckBoxState(title: "Drainage"),
    CheckBoxState(title: "Reserve Tank"),
    CheckBoxState(title: "Earthquake resistant"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: double.infinity,
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 3.5,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        children: [
          ...facilitiesList.map(builderCheckBox).toList(),
        ],
      ),
    );
  }

  Widget builderCheckBox(CheckBoxState checkBox) => ListTile(
        leading: Checkbox(
          activeColor: Colors.green,
          value: checkBox.value,
          onChanged: (value) {
            facilities.add(checkBox.title);
            setState(() {
              checkBox.value = value;
            });
          },
        ),
        title: Text(
          checkBox.title,
          style: TextStyle(color: Colors.white),
        ),
      );
}
