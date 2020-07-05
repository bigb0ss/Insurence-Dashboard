
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditRecord extends StatefulWidget {

  var type;
  var data;
  EditRecord({this.data,this.type});

  @override
  State<StatefulWidget> createState() {

    return _EditRecord(data:this.data,type:this.type);
  }

}


class _EditRecord extends State<EditRecord> {

  var type;
  var data;

  _EditRecord({this.data,this.type});

  final _formKey = GlobalKey<FormState>();

  var name;
  var reference;
  var policy_type;

  var policy_number;
  var gtype;
  var contact;

  var mail;
  var address;


  @override
  void initState() {
    setState(() {
      name = data['name'];
      reference = data['reference'];
      policy_type = data['policy_type'];
      policy_number = data['policy_number'];
      gtype = data['vehicle_type'];
      contact = data['contact'];
      mail = data['mail'];
      address = data['address'];

    });
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
          title: Text("Edit Record"),
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
                            return null;
                          setState(() {
                            name =value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: name
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
                            return null;
                          setState(() {
                            mail = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: mail
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
                            return null;
                          setState(() {
                            contact = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: contact
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
                            return null;
                          setState(() {
                            policy_number = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: policy_number
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height:5),


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
                            return null;
                          setState(() {
                            policy_type = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: policy_type
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
                            return null;
                          setState(() {
                            gtype = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: gtype
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
                            return null;
                          setState(() {
                            reference = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: reference
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
                            return null;
                          setState(() {
                            address = value;
                          });
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            hintText: address
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

                  RaisedButton(
                    onPressed: (){
                      _formKey.currentState.validate();
                      createData();


                      Navigator.pop(context);

                    },
                    child: Text("Save the Edited Record"),
                    color: Colors.blue,
                  )
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
    var url1 = "https://insurence-manager.herokuapp.com/edit";
    Map data1= {
      "id":this.data['id'].toString(),
      "name":name,
      "address":address,
      "type":type.toString(),
      "policy_number":policy_number,
      "policy_type":policy_type,
      "gtype":gtype,
      "reference":reference,
      "contact":contact,
      "mail":mail,
    };

    print(data);
    var response = await http.post("$proxy$url1",
        body: jsonEncode(data1),
        headers: {'Content-Type': 'application/json'}
    );

    print(response.statusCode);
  }


}