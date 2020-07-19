import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:covid19/search.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://disease.sh/v3/covid-19/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: Search(countryData));
            },
          )
        ],
        title: Center(child: Text('COUNTRY STATS')),
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.cyan[100],
                borderRadius: BorderRadius.circular(10),

                // backgroundBlendMode: BlendMode.luminosity
              ),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.lime[50],
                        borderRadius: BorderRadius.circular(10),

                        // backgroundBlendMode: BlendMode.luminosity
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 100,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(
                                      fontFamily: "Merinda One",
                                      fontWeight: FontWeight.bold),
                                ),
                                Image.network(
                                  countryData[index]['countryInfo']['flag'],
                                  height: 50,
                                  width: 60,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Merinda One",
                                              color: Colors.red),
                                        ),
                                        Text(
                                          countryData[index]['cases']
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Merinda One",
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'ACTIVE:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Merinda One",
                                              color: Colors.blue),
                                        ),
                                        Text(
                                          countryData[index]['active']
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Merinda One",
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
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                "RECOVERED:",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Merinda One",
                                                    color: Colors.green),
                                              ),
                                              Text(
                                                countryData[index]['recovered']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Merinda One",
                                                    color: Colors.green),
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
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Merinda One",
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.grey[100]
                                                  : Colors.grey[900]),
                                        ),
                                        Text(
                                          countryData[index]['deaths']
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Merinda One",
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.grey[100]
                                                  : Colors.grey[900]),
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
                    ),
                  );
                },
                itemCount: countryData == null ? 0 : countryData.length,
              ),
            ),
    );
  }
}
