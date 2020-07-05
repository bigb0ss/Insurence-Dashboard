
import 'package:dashboard/editRecord.dart';
import 'package:dashboard/renewRecord.dart';
import 'package:dashboard/viewScreen1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TwoWheeler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _TwoWheeler();
  }

}

class _TwoWheeler extends State<TwoWheeler> {

  var data1,data2;
  var statusCode1=0;
  var statusCode2=0;

  var colour1=Colors.blue;
  var colour2 = Colors.blueGrey;
  var select=1;

  List <Map<String,dynamic>> finaldata;
  Future getData() async{
    print("---------- INITIATED REQUEST ------------------");

    String proxy = 'https://cors-anywhere.herokuapp.com/';
    var url = "https://insurence-manager.herokuapp.com/vehicle";
    var url1 = "https://insurence-manager.herokuapp.com/renew_vehicle";
    var response1 = await http.get('$proxy$url');
    var response2 = await http.get('$proxy$url1');
    //var response= await http.get();

    //print(response.body);
    setState(() {
      statusCode1=response1.statusCode;
       data1= json.decode(response1.body);

       statusCode2 = response2.statusCode;
       data2 = json.decode(response2.body);
    });

    print("------------ COMPLETED REQUEST --------------------" );

  }

  Future getData1() async{
    print("---------- INITIATED REQUEST ------------------");

    setState(() {
      statusCode1 = 0;
      statusCode2 =0;
    });

    String proxy = 'https://cors-anywhere.herokuapp.com/';
    var url = "https://insurence-manager.herokuapp.com/vehicle";
    var url1 = "https://insurence-manager.herokuapp.com/renew_vehicle";
    var response1 = await http.get('$proxy$url');
    var response2 = await http.get('$proxy$url1');
    //var response= await http.get();

    //print(response.body);
    setState(() {
      statusCode1=response1.statusCode;
      data1= json.decode(response1.body);

      statusCode2 = response2.statusCode;
      data2 = json.decode(response2.body);
    });

    print("------------ COMPLETED REQUEST --------------------" );

  }

  @override
  // ignore: must_call_super
  void initState(){
    this.getData();
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

  Widget getAllRecord(){
    return

      Expanded(
          child: SizedBox(
            height: 500,
            child:ListView(
                children:[SingleChildScrollView(scrollDirection: Axis.horizontal,child:
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

                    rows:statusCode1==200?List.generate(data1.length, (index) => _getDataRow(data1[index])):[
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
                ))]
            ),
          )
      );
  }


  Widget getRenewRecord(){
    return Expanded(
      child: SizedBox(
        height: 500,
        child:
        ListView(
            children:[SingleChildScrollView(scrollDirection: Axis.horizontal,

              child:
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
                      label:Flexible(child: Text("Vechicle Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true),)
                  ),
                  DataColumn(
                      label:Flexible(child: Text(" ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),softWrap: true),)
                  ),

                ],

                rows:statusCode2==200?List.generate(data2.length, (index) => _getDataRow(data2[index])):[
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
            ),)]
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {



    return
      Column(

      children: <Widget>[
          SizedBox(
              width: 30,
            ),Align(alignment:Alignment.centerLeft,
              child: Text("Private Cars & Bikes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
          ,),
        SizedBox(height:15),
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: [
            FlatButton(onPressed: (){

              setState(() {
                colour1 = Colors.blue;
                colour2 = Colors.blueGrey;
                select = 1;
              });
            },
                color: colour1,
                child: Text("All Records")
            ),
            FlatButton(onPressed: (){

              setState(() {
                colour1 = Colors.blueGrey;
                colour2 = Colors.blue;
                select=2;
              });
            },
              color:colour2,
              child: Text("To Be Renewed")
            ),
            GestureDetector(
              onTap: (){
                this.getData1();
              },
              child: CircleAvatar(
                child: Icon(Icons.refresh),
              ),
            )
          ],
        ),
        SizedBox(
              width: 30,
            ),Align(alignment: Alignment.centerLeft,
              child:select==1?
              Text("All Records",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)):
              Text("To Be Renewed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
        ),
        SizedBox(height: 15,),

        select==1?getAllRecord():getRenewRecord(),

      ],
    )
    ;
  }

}




