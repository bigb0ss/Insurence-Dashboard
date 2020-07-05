import 'dart:convert';

import 'package:dashboard/editRecord.dart';
import 'package:dashboard/renewRecord.dart';
import 'package:dashboard/viewScreen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class SearchRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _SearchRecord();

  }
}

class _SearchRecord extends State<SearchRecord>{

  var colour1=Colors.blue;
  var colour2=Colors.blueGrey;
  var colour3=Colors.blueGrey;
  var type=1;

  var name;
  var policy_number;
  var contact;

  var toggle1 = false;
  var toggle2 = false;
  var toggle3 = false;
  var toggle4 = false;

  var data1;
  var status = 0;

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Search a Record"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,

        children: [

          SizedBox(
            height: 50,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){

                    setState(() {

                      colour1 = Colors.blue;
                      colour2 = Colors.blueGrey;
                      colour3 = Colors.blueGrey;
                      type =1;
                    });


                  },
                  child: Container(
                    child: SizedBox(
                      child: CircleAvatar(
                        backgroundColor: colour1,
                        child: Icon(Icons.directions_bike,color: Colors.white,size: 35,),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                    setState(() {

                      colour2 = Colors.blue;
                      colour1 = Colors.blueGrey;
                      colour3 = Colors.blueGrey;
                      type =2;
                    });


                  },
                  child:Container(
                    child: SizedBox(
                      child: CircleAvatar(
                        backgroundColor: colour2,
                        child: Icon(Icons.airport_shuttle,color: Colors.white,size: 35,),
                      ),
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: (){


                      setState(() {

                        colour3 = Colors.blue;
                        colour2 = Colors.blueGrey;
                        colour1 = Colors.blueGrey;
                        type =3;
                      });

                    },
                    child:Container(
                      child: SizedBox(
                        child: CircleAvatar(
                          backgroundColor: colour3,
                          child: Icon(Icons.business,color: Colors.white,size: 35,),
                        ),
                        height: 100,
                        width: 100,
                      ),
                    )
                )

              ],
            ),
          ),

          SizedBox(height:20),

          Container(
            child: Align(
              alignment: Alignment.center,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                  ],
                  rows:[
                    DataRow(cells:[
                      DataCell(
                          Row(
                            children: [
                              Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                              Switch(value:toggle1,
                                  onChanged: (toggle){
                                setState(() {
                                  toggle1 = toggle?true:false;
                                });

                                  }
                              )
                            ],

                          )
                      ),
                      DataCell(
                          Row(
                            children: [
                              Text("Policy Number",style: TextStyle(fontWeight: FontWeight.bold),),
                              Switch(value:toggle2,
                                  onChanged: (toggle){
                                setState(() {
                                  toggle2 = toggle?true:false;
                                });

                                  }
                              )
                            ],

                          )
                      ),
                      DataCell(
                          Row(
                            children: [
                              Text("Contact",style: TextStyle(fontWeight: FontWeight.bold),),
                              Switch(value:toggle3,
                                  onChanged: (toggle){
                                setState(() {
                                  toggle3 = toggle?true:false;
                                });

                                  }
                              )
                            ],

                          )
                      ),
                      DataCell(
                          Row(
                            children: [
                              Text("Renew Date",style: TextStyle(fontWeight: FontWeight.bold),),
                              Switch(value:toggle4,

                                  onChanged: (toggle){
                                    setState(() {
                                      toggle4 = toggle?true:false;
                                    });

                                  }
                              )
                            ],

                          )
                      ),
                      DataCell(Text(" "))
                    ]
                    ),
                    DataRow(
                      cells: [
                        DataCell(toggle1?TextField(onChanged: (value){setState(() {
                          name = value;
                        });},

                        ):Text(" ")),
                        DataCell(toggle2?TextField(onChanged: (value){setState(() {
                          policy_number = value;
                        });},):Text(" ")),
                        DataCell(toggle3?TextField(onChanged: (value){setState(() {
                          contact = value;
                        });},):Text(" ")),
                        DataCell(toggle4?Row(
                          children: [
                            Text(DateFormat("dd-MMMM-yyyy").format(selectedDate).toString()),
                            IconButton(icon: Icon(Icons.date_range), onPressed: () => _selectDate(context))
                          ],
                        ):Text(" ")),
                        DataCell(RaisedButton(
                          child: Text("Search"),
                          onPressed: (){
                            searchData();
                          },
                        ))
                      ]
                    )
                  ]
              )
            )
          ),

          SizedBox(
            height: 20,
          ),
          status==200?getAllRecord():Text(" ")


        ],
      ),
    );


  }


  Widget getAllRecord(){
    return

      /*Expanded(
          child: SizedBox(
            height: 500,
            child:
          )
      );*/
      DataTable(
          columns: [
            DataColumn(
                label:Text("ID",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true)
            ),
            DataColumn(
                label:Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true)
            ),
            DataColumn(
                label:Text("Reference",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true)
            ),
            DataColumn(
                label:Expanded(child: Text("Policy Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true),)
            ),
            DataColumn(
                label:Expanded(child: Text("Policy Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true),)
            ),

            DataColumn(
                label:(Text("Renewal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)))
            ),
            DataColumn(
                label:Text("Contact",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true)
            ),
            DataColumn(
                label:Text("Mail ID",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true)
            ),
            DataColumn(
                label:Expanded(child: Text("Vechicle Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true),)
            ),
            DataColumn(
                label:Expanded(child: Text(" ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true),)
            ),
          ],

          rows:status==200?List.generate(data1.length, (index) => _getDataRow(data1[index])):[
            DataRow(
                cells: [
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                  DataCell(Text(" ")),
                ]
            )
          ]
      );
  }


  DataRow _getDataRow(element){
    return DataRow(
        cells: [
          DataCell(SizedBox(
              child:Text(element['id'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Text(element['name'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Text(element['reference'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Text(element['policy_number'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Text(element['policy_type'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Text(element['date'],style:TextStyle(fontSize:13)))
          ),
          DataCell(SizedBox(
              child:Text(element['contact'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Text(element['mail'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Text(element['vehicle_type'],style:TextStyle(fontSize:13),softWrap: true))
          ),
          DataCell(SizedBox(
              child:Align(
                  alignment: Alignment.centerLeft,
                  child:PopupMenuButton(itemBuilder: (context)=>[

                    PopupMenuItem(
                        child:GestureDetector(
                          child: Text("Edit"),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>EditRecord(data:element,type: "1",))
                            );

                          },
                        )
                    ),
                    PopupMenuItem(
                        child: GestureDetector(
                          child: Text("Renew"),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>RenewRecord(data:element,type: "1",))
                            );
                          },
                        )
                    ),
                    PopupMenuItem(
                        child: GestureDetector(
                          child: Text("View"),
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>ViewScreen(data:element))
                            );
                          },
                        )
                    )

                  ]

                  )
              )

          )
            //Text(element['address'],style:TextStyle(fontSize:13),softWrap: true))
          ),


        ]
    );
  }




  Future  searchData() async {

    String proxy = 'https://cors-anywhere.herokuapp.com/';
    var url1 = "https://insurence-manager.herokuapp.com/search";

    Map data ;
    if (toggle1 && toggle2 ){

      data = {
        "name" : name,
        "policy_number" : policy_number,
        "type":type.toString(),
        "search":"1"
      };

    }
    else if (toggle1 && toggle4){
      data = {
        "name" : name,
        "date":DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
        "type":type.toString(),
        "search":"2"
      };
    }
    else if (toggle1){
      data ={
        "name" : name,
        "type" : type.toString(),
        "search":"3"
      };
    }
    else if(toggle2){
      data = {
        "policy_number":policy_number,
        "type":type.toString(),
        "search":"4"
      };
    }
    else if(toggle3){
      data = {
        "contact":contact,
        "type":type.toString(),
        "search":"5"
      };
    }
    else if(toggle4){
      data = {
        "date":DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
        "type":type.toString(),
        "search":"6"
      };
    }


    var response = await http.post("$proxy$url1",
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'}
    );

    setState(() {
      data1 = json.decode(response.body);
      status = response.statusCode;
    });

  }



}