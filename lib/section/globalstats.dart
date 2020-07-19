import 'package:flutter/material.dart';

class Global extends StatelessWidget {
  final Map globaldata;

  const Global({Key key, this.globaldata}) : super(key: key);

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
                count: globaldata["cases"].toString(),
                tcount: globaldata["todayCases"].toString(),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(2, 4, 4, 2),
              child: StatusPannel(
                title: "ACTIVE",
                tabcolor: Colors.blue[200],
                textcolor: Colors.black,
                count: globaldata["active"].toString(),
                tcount: (globaldata["todayCases"] -
                        globaldata["todayRecovered"] -
                        globaldata["todayDeaths"])
                    .toString(),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(4, 2, 2, 4),
              child: StatusPannel(
                title: "RECOVERED",
                tabcolor: Colors.green[300],
                textcolor: Colors.black,
                count: globaldata["recovered"].toString(),
                tcount: globaldata["todayRecovered"].toString(),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(2, 2, 4, 4),
              child: StatusPannel(
                title: "DEATHS",
                tabcolor: Colors.grey[400],
                textcolor: Colors.black,
                count: globaldata["deaths"].toString(),
                tcount: globaldata["todayDeaths"].toString(),
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
  final String tcount;

  const StatusPannel(
      {Key key,
      this.tabcolor,
      this.textcolor,
      this.title,
      this.count,
      this.tcount})
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
                  Text(
                    tcount,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: "MeriendaOne"),
                  ),
                  SizedBox(width: 2),
                  Icon(
                    int.parse(tcount) > 0
                        ? Icons.arrow_upward
                        : Icons.arrow_downward,
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(ColorProperty('tabcolor', tabcolor));
  // }
}
