import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SchoolsPage extends StatefulWidget {
  const SchoolsPage({super.key});

  @override
  State<SchoolsPage> createState() => _SchoolsPageState();
}

class _SchoolsPageState extends State<SchoolsPage> {
  late List<dynamic> schoolsList;

  Future<String> readJson() async {
    final String response = await rootBundle.loadString('assets/schools.json');
    final data = await json.decode(response);
    schoolsList = data;
    return "done";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: readJson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 150,
                      child: Card(
                        elevation: 10,
                        color: Colors.yellow[100],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(
                              "Rank: ${schoolsList[0]["University Rank"].toString()}",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              schoolsList[0]["Name of University"].toString(),
                              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Location: ${schoolsList[0]["Location"].toString()}",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Score: ${schoolsList[0]["OverAll Score"].toString()}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
