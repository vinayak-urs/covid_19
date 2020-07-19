import 'package:flutter/material.dart';

class topcountry extends StatelessWidget {
  final List countrydata;
  const topcountry({Key key, this.countrydata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lime[50],
        borderRadius: BorderRadius.circular(10),

        // backgroundBlendMode: BlendMode.luminosity
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Center(
              child: Text(
                "TOP AFFECTED COUNTRIES",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(10),

                    // backgroundBlendMode: BlendMode.luminosity
                  ),
                  // padding: EdgeInsets.symmetric(5),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.network(
                          countrydata[index]["countryInfo"]["flag"],
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          countrydata[index]["country"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          countrydata[index]["cases"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red[200]),
                        ),
                        Text(
                          countrydata[index]["active"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue[300]),
                        ),
                        Text(
                          countrydata[index]["deaths"].toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "WE ARE TOGETHER IN THE FIGHT",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
