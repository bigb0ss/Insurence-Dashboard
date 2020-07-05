
import 'package:dashboard/buildings.dart';
import 'package:dashboard/fourWheeler.dart';
import 'package:dashboard/searchRecord.dart';
import 'package:dashboard/twoWheeler.dart';
import 'package:flutter/material.dart';
import 'createRecord.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insurence Management Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }

}


class _HomePage extends State<HomePage> {

  var _selectedIndex=0;
  var pages = [TwoWheeler(),FourWheeler(),Buildings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body:  Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>SearchRecord())
                  );

                },
                child: Text("Search Record"),
              ),
              SizedBox(
                width: 10,
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>CreateRecord())
                  );

                },
                child: Text("Create New Record"),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),

          Expanded(
              child: pages[_selectedIndex]
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bike),
              title: Text("Private Vehicles")
          ),
          BottomNavigationBarItem(
              icon:  Icon(Icons.airport_shuttle),
              title: Text("Goods & Miscellanious Vechicles")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text("Fire & Miscellanious")
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index){
          setState((){
            _selectedIndex = index;
          });
        },
      ),
    );
  }

}