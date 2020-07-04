import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_provider_tutorial/ApiTest/ApiModels.dart';
import 'package:flutter_app_provider_tutorial/ApiTest/EmployeeList.dart';
import 'package:flutter_app_provider_tutorial/CountTapModel.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int val=0;
  var countTapInfo;
  var response;


  @override
  Widget build(BuildContext context) {
    countTapInfo = Provider.of<CountTapModel>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.transform),onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context,){
         return ChangeNotifierProvider(
             create: (context)=>ApiModels(),
             child: EmployeeList());
        }));
      },),
      appBar: AppBar(title: Title(child: Text("Provide State Test",),color: Colors.purpleAccent,),centerTitle: true,),

      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(icon: Icon(Icons.remove),
              onPressed: ()
              {
                countTapInfo.decrementValue();

              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                IconButton(icon: Icon(Icons.clear),
                  onPressed: ()
                  {
                    countTapInfo.MultiplyValue();

                  },
                ),

                Center(
                  child: Container(
                    padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue
                      ),
                      child: Consumer<CountTapModel>(
                        builder: (context, data, child){
                          return Text(data.value.toString(),style: TextStyle(color: Colors.white,fontSize: 20),);
                        },

                          ),),
                ),

                IconButton(
                  icon: Icon(Icons.exposure_zero),
                  onPressed: ()
                  {
                    countTapInfo.resetValue();

                  },
                ),
              ],
            ),
            IconButton(icon: Icon(Icons.add),
            onPressed: ()
            {
              countTapInfo.incrementValue();


            },
            )
          ],
        ),
      ),
    );
  }
}
