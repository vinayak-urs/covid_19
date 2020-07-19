import 'package:covid19/screens/indiastats.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:covid19/search.dart';

class IndiaPage extends StatefulWidget {
  IndiaPage({Key key}) : super(key: key);

  @override
  _IndiaPageState createState() => _IndiaPageState();
}

class _IndiaPageState extends State<IndiaPage> {
  Map<dynamic, dynamic> indiadata, indiastats;
  List indiaData;

  fetchindiaData() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      indiadata = json.decode(response.body);
      indiaData = indiadata["data"]["regional"];
      indiastats = indiadata["data"]["summary"];
      // indiaData = indiadata.values.toList();
      // planets = new List<String>.from(numMoons.keys);
      // List<Weight> weightData = weights.map((key, value) => Weight(key, value));
    });
  }

  @override
  void initState() {
    fetchindiaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // showSearch(context: context, delegate: Search(indiaData));
                  })
            ],
            title: Center(child: Text("  INDIA  ")),
          ),
          body: indiaData == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "INDIA",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text("Last update : " +
                            timeformat(indiadata["lastRefreshed"]))
                      ],
                    ),
                    Container(
                      child: indiastats == null
                          ? CircularProgressIndicator()
                          : Indian(indiadata: indiastats),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Card(
                                color: Colors.blueGrey[100],
                                child: Container(
                                  // foregroundDecoration: ,
                                  height: 80,
                                  // margin: EdgeInsets.symmetric(
                                  // horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                    // color: Colors.blueGrey[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: 200,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              indiaData[index]["loc"]
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              "Lastupdate\n" +
                                                  timeformat(indiadata[
                                                      "lastRefreshed"]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'CONFIRMED:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Merinda One",
                                                          color: Colors.red),
                                                    ),
                                                    Text(
                                                      indiaData[index]
                                                              ["totalConfirmed"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Merinda One",
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'ACTIVE:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Merinda One",
                                                          color: Colors.blue),
                                                    ),
                                                    Text(
                                                      (indiaData[index][
                                                                  "totalConfirmed"] -
                                                              indiaData[index][
                                                                  "discharged"] -
                                                              indiaData[index]
                                                                  ["deaths"])
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Merinda One",
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Column(
                                                        children: <Widget>[
                                                          Text(
                                                            "RECOVERED:",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Merinda One",
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                          Text(
                                                            indiaData[index][
                                                                    "discharged"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Merinda One",
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // SizedBox()
                                                Column(
                                                  children: <Widget>[
                                                    Text(
                                                      'DEATHS:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Merinda One",
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors.grey[100]
                                                              : Colors
                                                                  .grey[900]),
                                                    ),
                                                    Text(
                                                      indiaData[index]["deaths"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Merinda One",
                                                          color: Theme.of(context)
                                                                      .brightness ==
                                                                  Brightness
                                                                      .dark
                                                              ? Colors.grey[100]
                                                              : Colors
                                                                  .grey[900]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ));
                          },
                          itemCount: indiaData == null ? 0 : indiaData.length),
                    ),
                  ],
                )),
    );
  }

  timeformat(time) {
    var list = time.split("T");
    var l2 = list[1].split(".");

    return list[0] + "  " + l2[0];
  }
}
