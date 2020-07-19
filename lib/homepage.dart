import 'package:covid19/data.dart';
import 'package:covid19/section/globalstats.dart';
import 'package:covid19/topAffected/topcountries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:covid19/screens/countrypage.dart';
import 'package:covid19/screens/india.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map globaldata;
  fetchGlobalData() async {
    http.Response response =
        await http.get("https://disease.sh/v3/covid-19/all");
    setState(() {
      globaldata = json.decode(response.body);
    });
  }

  List countrydata;
  fetchCountryData() async {
    http.Response response =
        await http.get("https://disease.sh/v3/covid-19/countries");
    setState(() {
      countrydata = json.decode(response.body);
      countrydata.sort((a, b) => (b["active"]).compareTo(a["active"]));
    });
  }

  @override
  void initState() {
    fetchGlobalData();
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text("COVID-19"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.calendar_today), onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.red.withOpacity(0.750), BlendMode.dstATop),
                  image: NetworkImage(
                      "https://image.freepik.com/free-vector/covid-19-coronavirus-outbreak-design-with-falling-virus-blood-cell-microscopic-view-light-background-2019-ncov-corona-virus-illustration-dangerous-sars-epidemic-theme-banner_1314-2657.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(
                    top: Radius.zero, bottom: Radius.circular(10)),
              ),
              height: 150,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5.0),
              // color: Colors.lightBlue[100].withOpacity(0.25),
              child: Text(
                DataSource.quote,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Merinda One",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            // SizedBox(
            // height: 10,
            // ),
            Container(
              decoration: BoxDecoration(
                color: Colors.lime[50],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CountryPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " GLOBAL ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndiaPage()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("  INDIA ",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            globaldata == null
                ? CircularProgressIndicator()
                : Global(
                    globaldata: globaldata,
                  ),

            countrydata == null
                ? Container()
                : topcountry(
                    countrydata: countrydata,
                  ),
            SizedBox(height: 20),
            // buildPreventation(),
          ],
        ),
      ),
    );
  }
}
