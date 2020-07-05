import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;


class RenewRecord extends StatefulWidget {
  var data;
  var type;
  RenewRecord({this.data,this.type});

  @override
  State<StatefulWidget> createState() {

    return _RenewRecord(data:this.data,type: this.type);
  }

}

class _RenewRecord extends State<RenewRecord>{

  var data;
  var type;
  _RenewRecord({this.data,this.type});


  final _formKey = GlobalKey<FormState>();

  var policy_type;
  var policy_number;
  var selectedData;

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
        title: Text("Renew Record"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
            child:Column(
              children: [

                SizedBox(height: 30,),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child:Text("Client Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ),
                      SizedBox(
                        child: Text(this.data['name'],style: TextStyle(fontSize: 20)),
                      )
                    ],
                  )
                ),

                SizedBox(height: 20,),

                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                          width:400,
                          child: Text("Policy Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty)
                              return "Value is required";
                            setState(() {
                              policy_number =value;
                            });
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              hintText: 'Enter New Policy Number'
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height:5),

                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                          width:400,
                          child: Text("Policy Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty)
                              return "Value is required";
                            setState(() {
                              policy_type =value;
                            });
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              hintText: 'Enter  Policy Type'
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height:5),

                Container(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      SizedBox(
                          width:400,
                          child: Text("Policy Renewal Date",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                      ),
                      SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(DateFormat("dd-MMMM-yyyy").format(selectedDate).toString()),
                            SizedBox(width: 20.0,),
                            RaisedButton(
                              onPressed: () => _selectDate(context),
                              child: Text('Select Date'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),


                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        onPressed: (){
                        Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                        color: Colors.blue,
                    ),

                    RaisedButton(
                        onPressed: (){
                        _formKey.currentState.validate();
                        renewData();

                        Navigator.pop(context);
                        },
                      child: Text("Renew the Record"),
                      color: Colors.blue,
                    )
                  ],
                )

              ],
            )
        )
        ),
      );
  }

  Future renewData() async{
    String proxy = 'https://cors-anywhere.herokuapp.com/';
    var url1 = "https://insurence-manager.herokuapp.com/renew";

    Map data= {
      "id":this.data['id'].toString(),
      "type":this.type,
      "policy_number":policy_number,
      "policy_type":policy_type,
      "date":DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
    };

    var response = await http.post("$proxy$url1",
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'}
    );

    print(response.statusCode);
  }


}