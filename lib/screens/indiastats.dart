import 'package:flutter/material.dart';

class Indian extends StatelessWidget {
  final Map indiadata;
  const Indian({Key key, this.indiadata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan.withOpacity(0.15),
      ),
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(4, 4, 2, 2),
              child: StatusPannel(
                title: "CONFIRMED",
                tabcolor: Colors.red[200],
                textcolor: Colors.black,
                count: indiadata["total"].toString(),
                // tcount: globaldata["todayCases"].toString(),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(2, 4, 4, 2),
              child: StatusPannel(
                title: "ACTIVE",
                tabcolor: Colors.blue[200],
                textcolor: Colors.black,
                // count: globaldata["active"].toString(),
                count: (indiadata["confirmedCasesIndian"] -
                        indiadata["discharged"] -
                        indiadata["deaths"])
                    .toString(),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(4, 2, 2, 4),
              child: StatusPannel(
                title: "RECOVERED",
                tabcolor: Colors.green[300],
                textcolor: Colors.black,
                count: indiadata["discharged"].toString(),
                // tcount: globaldata["todayRecovered"].toString(),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(2, 2, 4, 4),
              child: StatusPannel(
                title: "DEATHS",
                tabcolor: Colors.grey[400],
                textcolor: Colors.black,
                count: indiadata["deaths"].toString(),
                // tcount: globaldata["todayDeaths"].toString(),
              )),
          // Container(
          //   margin: EdgeInsets.fromLTRB(left, top, right, bottom),
          //   child: StatusPannel()),
        ],
      ),
    );
  }
}

class StatusPannel extends StatelessWidget {
  final Color tabcolor;
  final Color textcolor;
  final String title;
  final String count;
  // final String tcount;

  const StatusPannel(
      {Key key, this.tabcolor, this.textcolor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: new BoxDecoration(
          color: tabcolor, //new Color.fromRGBO(255, 0, 0, 0.0),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
            bottomLeft: const Radius.circular(10.0),
            bottomRight: const Radius.circular(10.0),
          )),
      // margin: EdgeInsets.all(5),
      height: 80,
      width: width / 2,
      // color: Colors.pink[100],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 3.0),
            child: Text(
              title,
              style: TextStyle(
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: "Fondamento"),
            ),
          ),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    count,
                    style: TextStyle(
                        color: textcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "MeriendaOne"),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
