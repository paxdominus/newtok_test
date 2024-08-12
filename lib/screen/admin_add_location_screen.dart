import 'package:flutter/material.dart';
import 'package:newtok_test/api/api.dart';
import 'package:newtok_test/model/country_model.dart';
import 'package:newtok_test/style/styles.dart';

class AdminAddLocationScreen extends StatefulWidget {
  const AdminAddLocationScreen({super.key});

  @override
  State<AdminAddLocationScreen> createState() => _AdminAddLocationScreenState();
}

class _AdminAddLocationScreenState extends State<AdminAddLocationScreen> {
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Country",
          style: Styles().getTextStyle(25),
        ),
      ),
      body: Column(
        children: [
          // Text(
          //   "Add Country",
          //   style: Styles().getTextStyle(22),
          // ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Country",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              style: Styles().getTextStyle(15),
              controller: countryController,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "State",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              style: Styles().getTextStyle(15),
              controller: stateController,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "District",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              style: Styles().getTextStyle(15),
              controller: districtController,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "City",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              style: Styles().getTextStyle(15),
              controller: cityController,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> json = Country(
                        city: cityController.text.trim(),
                        district: districtController.text.trim(),
                        state: stateController.text.trim(),
                        country: countryController.text.trim())
                    .toJson();
                Api().addCountry(json);
                cityController.clear();
                districtController.clear();
                stateController.clear();
                countryController.clear();
              },
              child: Text(
                "Add",
                style: Styles().getTextStyle(18),
              ))
        ],
      ),
    );
  }
}
