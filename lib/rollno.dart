import 'package:flutter/material.dart';
import 'package:qrapplication/profile.dart';
class rollno extends StatefulWidget {
  const rollno({Key? key}) : super(key: key);

  @override
  State<rollno> createState() => _rollnoState();
}

class _rollnoState extends State<rollno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "Enter your roll no", labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width:3,color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            SizedBox(height:20,),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>const Profile()));
              },
              child: Text('Done',style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            ),
            ],
        ),
      ),
    );
  }
}
