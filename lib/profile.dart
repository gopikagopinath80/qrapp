import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network("https://cdn3.iconfinder.com/data/icons/avatars-collection/256/23-1024.png", height: 100, width: 150,),
            SizedBox(height: 20,),
            Text("Gopika Gopinath",style: TextStyle(fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),),
            Text("Flutter Developer", style: TextStyle(fontSize: 20,color: Colors.white,),),
            Card(child: ListTile(
              leading: Icon(Icons.phone),
              title: Text("+91 9447947399"),
            ),),
            Card(child: ListTile(
              leading: Icon(Icons.email),
              title: Text("gopikagopinath80@gmail.com"),
            ),),
          ],
        ),
      ),
    );
  }
}
