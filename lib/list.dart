import 'package:flutter/material.dart';
import 'package:test_flutter/main.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
final TextEditingController searchText = new TextEditingController();
int _value = 1;

@override
void initState() {
    super.initState();
  }
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
            title: new Text("First Page"),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyApp()));
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
          // child: Container(
            child: Row(
              children: <Widget>[
                 Container(
                  padding: EdgeInsets.fromLTRB(32, 0, 20, 20),
                  width: MediaQuery.of(context).size.width - 100.0,
                  child: TextFormField(
                    controller: searchText,
                    decoration: new InputDecoration(
                        labelText: 'Search',
                        prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: null),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0)
                          ),
                      ),
                    // onChanged: onSearchTextChanged,
                    ),
                  ),
                  SizedBox(
                    // width: 20,
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
        Container(
          height: 450,
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                  width: 300,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text("Tang Chee Hong" , style: Theme.of(context).textTheme.title,)
                        ),
                      
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: DropdownButton(
                            style: Theme.of(context).textTheme.title,
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Q2 - 2019"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Q3 - 2019"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                  child: Text("Q4 - 2019"),
                                  value: 3
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              }),
                        ),
                        ],
                        ),
                      ),
                    ),
                   Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Text('Objectives "Where do I want to go?"', textAlign: TextAlign.center),
                        ),
                         Container(
                            width: 300,
                            height: 30,
                            child: Text('Your Objectives to achieve the goals', textAlign: TextAlign.center),
                          ),
                          Container(
                            width: 300,
                            height: 20,
                            child: Text('Key Results "How do I get there?', textAlign: TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 50),
                            child: Text('Action Plans to achieve Key Results Areas', textAlign: TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 30, 20, 50),
                            width: MediaQuery.of(context).size.width - 100.0,
                            child:  TextFormField(
                            decoration: new InputDecoration(
                            labelText: "Type New Objectives here",
                            fillColor: Colors.white,
                            suffixIcon: IconButton(icon: Icon(Icons.add), onPressed: null),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              ),
                              //fillColor: Colors.green
                            ),
                          ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ],
        ),
        ],
      ),
    );
  }
}
