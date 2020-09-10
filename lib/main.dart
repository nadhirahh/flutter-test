import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  List<Color> _colors = [
    Colors.teal,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.orange),
        // title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(
            Icons.notifications,
            color: Colors.orange
          ), onPressed: null),
           IconButton(icon: Icon(
            Icons.account_circle,
            color: Colors.orange
          ), onPressed: null)
        ],
      ),
      drawer: new Drawer(
      child: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text("Second Page"),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new SecondPage()));
            }
          ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
        Column(
        children: <Widget>[
          Expanded(
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: MediaQuery.of(context).size.width - 100.0,
                  child: new TextFormField(
                    decoration: new InputDecoration(
                        labelText: 'Search',
                        prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: null),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0)
                          ),
                      ),
                  ),
                ),
                SizedBox(
                  height: 52,
                  child: ButtonTheme(
                  minWidth: 50.0,
                  child: FlatButton(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  onPressed: () => {},
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(100.0),
                    side: BorderSide(color: Colors.blue)
                  ),
                  color: Colors.lightBlue,
                  child: Column( // Replace with a Row for horizontal icon + text
                    children: <Widget>[
                      Icon(Icons.account_circle, color: Colors.white),
                      Text("Ta", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
                ),
              ),
              ],
            ),
          ),
        ),
        Container(
        height: 450,
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text("All staff's Squad Participants")
              ),
          PieChart(
            dataMap: dataMap,
            colorList:
                _colors, // if not declared, random colors will be chosen
            animationDuration: Duration(milliseconds: 1500),
            chartLegendSpacing: 32.0,
            chartRadius: MediaQuery.of(context).size.width /
                2.7, //determines the size of the chart
            showChartValuesInPercentage: true,
            showChartValues: true,
            showChartValuesOutside: false,
            chartValueBackgroundColor: Colors.grey[200],
            showLegends: true,
            legendPosition:
                LegendPosition.right, 
            decimalPlaces: 1,
            showChartValueLabel: true,
            initialAngle: 0,
            chartValueStyle: defaultChartValueStyle.copyWith(
              color: Colors.blueGrey[900].withOpacity(0.9),
            ),
            chartType: ChartType.disc, 
            ), SizedBox(
                  height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
        ),
        ],
      ),
    );
  }
}
