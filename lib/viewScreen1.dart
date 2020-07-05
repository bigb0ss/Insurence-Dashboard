

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';



class ViewScreen extends StatelessWidget{

  var data;

  ViewScreen({this.data});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("View Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child:CircleAvatar(
                child: Text(data['name'][0],
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),
                ),
                radius: 35,
              )
            ),
            Align(
              alignment: Alignment.center,
              child: Text(data['name'],
              style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              )
              )
            ),
            Align(
              alignment: Alignment.center,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(data['date'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.deepOrange),)),
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                  ],
                  rows:[
                    DataRow(
                      cells: [
                        DataCell(Text("Reference",style: TextStyle(fontWeight: FontWeight.bold),)),
                        DataCell(Text(data['reference'])),
                        DataCell(Text(" ")),
                        DataCell(Text("Vehicle Type",style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text(data['vehicle_type'])),
                      ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Policy Number",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['policy_number'])),
                          DataCell(Text(" ")),
                          DataCell(Text("Policy Type",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['policy_type'])),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Contact",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['contact'])),
                          DataCell(Text(" ")),
                          DataCell(Text("Mail ID",style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text(data['mail'])),
                        ]
                    ),
                  ]
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Address",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(data['address'])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ViewScreen1 extends StatelessWidget{

  var data;

  ViewScreen1({this.data});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("View Screen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Align(
                alignment: Alignment.center,
                child:CircleAvatar(
                  child: Text(data['name'][0],
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  radius: 35,
                )
            ),
            Align(
                alignment: Alignment.center,
                child: Text(data['name'],
                    style:TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    )
                )
            ),
            Align(
              alignment: Alignment.center,
              child: DataTable(
                  columns: [
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(data['date'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.deepOrange),)),
                    DataColumn(label: Text(" ")),
                    DataColumn(label: Text(" ")),
                  ],
                  rows:[
                    DataRow(
                        cells: [
                          DataCell(Text("Reference",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['reference'])),
                          DataCell(Text(" ")),
                          DataCell(Text("Type",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['vehicle_type'])),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Policy Number",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['policy_number'])),
                          DataCell(Text(" ")),
                          DataCell(Text("Policy Type",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['policy_type'])),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text("Contact",style: TextStyle(fontWeight: FontWeight.bold),)),
                          DataCell(Text(data['contact'])),
                          DataCell(Text(" ")),
                          DataCell(Text("Mail ID",style: TextStyle(fontWeight: FontWeight.bold))),
                          DataCell(Text(data['mail'])),
                        ]
                    ),
                  ]
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Address",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(data['address'])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



