import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrapplication/qrscanner.dart';
import 'package:qrapplication/registration.dart';
import 'package:qrapplication/rollno.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController rollno=TextEditingController();
  TextEditingController password=TextEditingController();
  Future <void> login() async{
    Uri uri = Uri.parse('https://scnner-web.onrender.com/api/login');
    var response=await http.post(uri,
        headers:<String, String>{
          'Content-Type':'application/json;charset=UTF-8',
        },
        body:jsonEncode({'rollno':rollno.text,'password':password.text}));
    var data=jsonDecode(response.body);

    if(response.statusCode==200){
      Navigator.push(context, MaterialPageRoute(builder: (context) => qrscanner(),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 28,
                  height: 4.5,
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: rollno,
              decoration:InputDecoration(
                labelText: "Enter your roll.no", labelStyle: TextStyle(color: Colors.white),
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(width:3,color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),),
            ),
            SizedBox(
              height: 30,
              width: 70,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  labelText: "Enter your password", labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:3,color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(height:20,),
            TextButton(
              onPressed: () {
                login();

              },
              child: Text('Login',style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            ),
            Text(
              "OR",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>const registration()));
              },
              child: Text('Do not have an existing account ',
                style:TextStyle(color:Colors.white),),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            )
          ],
        ));
  }
}
