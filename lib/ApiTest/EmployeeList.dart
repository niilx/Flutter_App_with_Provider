import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_provider_tutorial/ApiTest/ApiModels.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  var  response;
  void initState() {
  var Info = Provider.of<ApiModels>(context, listen: false);
  Info.getDatas();


    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Title(child: Text("Employee List"),color: Colors.purpleAccent,),),
      body: SafeArea(
        child: Consumer<ApiModels>(
          builder: (context,data,child){
            print("test");
            print(data.response);
            return Container(
              padding: EdgeInsets.all(15),
              child: data.response==null? Center(child: CircularProgressIndicator()):
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.response["data"].length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    color: index%2==0? Colors.pink.withOpacity(0.9):Colors.deepOrange,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("Name: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                              Text(data.response["data"][index]["employee_name"],style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Text("Age: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                              Text(data.response["data"][index]["employee_age"],style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Text("Salary: ",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                              Text(data.response["data"][index]["employee_salary"],style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),),
                            ],
                          ),
                          SizedBox(height: 5,),
                        ],
                      ),
                    )
                  );
                },
              ),
            );
          },

        ),
      ),
    );
  }
}
