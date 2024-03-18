import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrapplication/camera.dart';
import 'package:qrapplication/rollno.dart';
class qrscanner extends StatefulWidget {
  const qrscanner({super.key});

  @override
  State<qrscanner> createState() => _qrscannerState();
}

class _qrscannerState extends State<qrscanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:Center(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("https://cdn2.iconfinder.com/data/icons/outlined-set-1/29/people-512.png",height: 100, width: 150,),
          SizedBox(height:50,),
          QrImageView(
            data: '1234567890',
            version: QrVersions.auto,
            size: 200.0,
          ),
          SizedBox(height:30,),
          TextButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>const rollno()));
          },
              child: Text('Scan',style: TextStyle(color: Colors.white),),
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
          ),
        ],
      ),
      ),
    );
  }
}
