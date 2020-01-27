import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
    home: Profile(),
));

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.yellow[500],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('files/kirito.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.white,
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.yellow[500],
                letterSpacing: 2.0,
                fontSize: 16.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height:1.0),
            Text(
              'Robert',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height:20.0),
            Text(
              'Surname',
              style: TextStyle(
                  color: Colors.yellow[500],
                  letterSpacing: 2.0,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height:1.0),
            Text(
              'Freeman',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height:20.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.yellow[500],

                ),
                SizedBox(width: 10.0,),
                Text(
                  'freeman-robert@npo-at.com',
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height:1.0),
            SizedBox(height: 30.0),
            Text(
              'Gender',
              style: TextStyle(
                  color: Colors.yellow[500],
                  letterSpacing: 2.0,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Male',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ),
    );
  }
}

