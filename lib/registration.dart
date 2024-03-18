import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:qrapplication/loginpage.dart';
import 'package:qrapplication/qrscanner.dart';
class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final _rollnoController=TextEditingController();
  final _nameController=TextEditingController();
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();

    void register()async{
     // print(_nameController.text);
    //  print(_rollnoController.text);
     // print(_emailController.text);
      //print(_passwordController.text);
      Uri uri=Uri.parse('https://scnner-web.onrender.com/api/register');
      var response=await http.post(uri,
        headers:<String, String>{
        'Content-Type':'application/json;charset=UTF-8',
        },
        body:jsonEncode({
          'name':_nameController.text,
          'email':_emailController.text,
          'rollno':_rollnoController.text,
          'password':_passwordController.text,
        })
      );
      print(response.statusCode);
      print(response.body);
      var data=jsonDecode(response.body);
      print(data["message"]);

      if(response.statusCode==200){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage(),));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data["message"])));
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Registration',
          style: TextStyle(
              fontSize: 28,
              height: 10.5,
              color: Colors.white),
          textAlign: TextAlign.center,
          ),
          TextField(
            controller: _nameController,
    decoration:InputDecoration(
    labelText: "Enter your name", labelStyle: TextStyle(color: Colors.white),
    enabledBorder:OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
          )),

          ),
          SizedBox(
            height: 20,
          ),
          TextField(
             decoration:InputDecoration(
               labelText: "Enter your roll number ", labelStyle: TextStyle(color: Colors.white),
              enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
          ),),
            controller: _rollnoController,
          ),
          SizedBox(
            height: 20,
          ),
      TextField(
        decoration:InputDecoration(
          labelText: "Enter your email ", labelStyle: TextStyle(color: Colors.white),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),),
        controller: _emailController,
      ),
      SizedBox(
        height: 20,
      ),
      TextField(
        decoration:InputDecoration(
          labelText: "Enter your password ", labelStyle: TextStyle(color: Colors.white),
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),),
        controller: _passwordController,
      ),
          SizedBox(
            height: 20,
          ),
          TextButton(onPressed: (){
            register();
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const Loginpage()));
          },
              child: Text('Register',style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          ),
        ],
    ),
      );
  }
}
