import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:newtok_test/api/api.dart';
import 'package:newtok_test/style/styles.dart';

class UserLocationListScreen extends StatefulWidget {
  const UserLocationListScreen({super.key});

  @override
  State<UserLocationListScreen> createState() => _UserLocationListScreenState();
}

class _UserLocationListScreenState extends State<UserLocationListScreen> {
  var data;
  List locs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "List",
            style: Styles().getTextStyle(15),
          ),
        ),
        body: ListView.builder(
            itemCount: locs.length,
            itemBuilder: (context, index) => Card(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text(locs[index].toString())),
                )));
  }

  void getList() async {
    DataSnapshot snapshot = await Api().getData();
    List priLocs = [];
    var obj = (jsonDecode(jsonEncode(snapshot.value)));
    obj.cast<String, dynamic>().map((String s, dynamic e) {
      priLocs.add(e);
      return MapEntry(s, e);
    });

    for (var it in priLocs) {
      it.cast<String, dynamic>().map((String s, dynamic e) {
        locs.add(e);
        return MapEntry(s, e);
      });
    }
    locs.removeWhere((item) => item == "");
    setState(() {});
  }
}
