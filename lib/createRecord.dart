import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CreateRecord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _CreateRecord();
  }

}


class _CreateRecord extends State<CreateRecord> {

  var colour1=Colors.blue;
  var colour2=Colors.blueGrey;
  var colour3=Colors.blueGrey;
  var type=1;

  final _formKey = GlobalKey<FormState>();

  var name;
  var reference;
  var policy_type;

  var policy_number;
  var gtype;
  var contact;

  var mail;
  var address;

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

    return  Scaffold(
        appBar: AppBar(
          title: Text("Create a New Record"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(child:
        Form(
          key: _formKey,
          child:Column(
            children: <Widget>[

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
              SizedBox(height: 50,),
              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        width:400,
                        child: Text("Client Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty)
                            return "Value is required";
                          setState(() {
                            name =value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Client Name'
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 5,),

              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        width:400,
                        child: Text("Client Email ID",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty)
                            return "Value is required";
                          setState(() {
                            mail = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Client Email ID'
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 5,),
              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        width:400,
                        child: Text("Client Mobile Number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty)
                            return "Value is required";
                          setState(() {
                            contact = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Client Mobile Number'
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),

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
                            policy_number = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Policy Number'
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

              SizedBox(height: 5,),
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
                            policy_type = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Policy Type'
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5,),

              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        width:400,
                        child: Text("Vehicle/Building Type",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty)
                            return "Value is required";
                          setState(() {
                            gtype = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Vehicle/Building Type'
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 5,),

              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        width:400,
                        child: Text("Referenced By",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty)
                            return "Value is required";
                          setState(() {
                            reference = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Reference Person Name'
                        ),
                      ),
                    )
                  ],
                ),
              ),


              SizedBox(height: 5,),

              Container(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        width:400,
                        child: Text("Address ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                    ),
                    SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty)
                            return "Value is required";
                          setState(() {
                            address = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Enter Address'
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height:15),


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
                  Builder(
                    builder: (context)=>RaisedButton(
                      onPressed: (){
                        _formKey.currentState.validate();
                        createData();


                        Navigator.pop(context);

                      },
                      child: Text("Save the Record"),

                      color: Colors.blue,
                    )
                  ),


                ],
              ),

            ],
          ),
        )
        )
    );
  }
  Future createData() async{
    String proxy = 'https://cors-anywhere.herokuapp.com/';
    var url1 = "https://insurence-manager.herokuapp.com/create";

    Map data= {
      "name":name,
      "address":address,
      "type":type.toString(),
      "policy_number":policy_number,
      "policy_type":policy_type,
      "date":DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
      "gtype":gtype,
      "reference":reference,
      "contact":contact,
      "mail":mail,
    };

    var response = await http.post("$proxy$url1",
    body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'}
    );
    print(response.statusCode);
  }


}




