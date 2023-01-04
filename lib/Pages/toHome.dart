// ignore: file_names
import 'package:bus_timing/Services/Data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// ignore: camel_case_types
class toHome extends StatefulWidget {
  const toHome({super.key});

  @override
  State<toHome> createState() => _toHomeState();
}

class _toHomeState extends State<toHome> {
  Future<List<DataModel>> _HomegetData() async {
    var data = await http.get(
        Uri.parse("http://api.sahanisushilkumar.in/api/bus_timing/toHome"));
    var jsonData = json.decode(data.body);
    List<DataModel> HomedataModels = [];
    for (var u in jsonData['records']) {
      DataModel HomedataModel =
          DataModel(u["arrival_time"], u["departure_time"], u["bus"]);
      HomedataModels.add(HomedataModel);
    }
    return HomedataModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Home"),
      ),
      body: FutureBuilder(
        future: _HomegetData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(
                            3.0,
                            3.0,
                          ),
                          blurRadius: 3.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Bus No. :- ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  snapshot.data[index].bus,
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                "Start Time",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "===>",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Stop Time",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.bus_alert,
                                color: Colors.redAccent,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                snapshot.data[index].departure_time,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Text(
                                "===>",
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                snapshot.data[index].arrival_time,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
