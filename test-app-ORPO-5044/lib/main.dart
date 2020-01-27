import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: FirstScreen(),
  ));
}

class FirstScreen extends StatefulWidget {

  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {

  final _textStyleYellow =  TextStyle(
      color: Colors.yellow[500],
      letterSpacing: 2.0,
      fontSize: 16.0,
      fontWeight: FontWeight.bold
  );
  final _textStyleWhite =  TextStyle(
      color: Colors.white,
      letterSpacing: 2.0,
      fontSize: 25.0,
      fontWeight: FontWeight.bold
  );


  String text = 'Robert';
  String text2 = 'Freeman';
  String text3 = 'robert.freeman@npo-at.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Profile',
          style: TextStyle(
            color: Colors.grey[600],
          ),),
        centerTitle: true,
        backgroundColor: Colors.yellow[500],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

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
                style: _textStyleYellow
            ),
            SizedBox(height: 1.0),
            Text(
                text,
                style: _textStyleWhite
            ),
            SizedBox(height: 20.0),
            Text(
                'Surname',
                style: _textStyleYellow
            ),
            SizedBox(height: 1.0,),
            Text(
                text2,
                style: _textStyleWhite
            ),
            SizedBox(height: 20.0),
            Column(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.yellow[500],

                ),
                SizedBox(width: 10.0,),
                Text(
                  text3,
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
                'Gender',
                style: _textStyleYellow
            ),
            Text(
                'Male',
                style: _textStyleWhite
            ),
            RaisedButton(
              child: Text(
                'Edit',
                style: TextStyle(fontSize: 24,
                    color: Colors.grey[800]),


              ),
              color: Colors.yellow[500],
              onPressed: () {
                _awaitReturnValueFromSecondScreen(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _awaitReturnValueFromSecondScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      text = result[0];
      text2 = result[1];
    });
  }
}



class SecondScreen extends StatefulWidget {



  @override
  _SecondScreenState createState() {
    return _SecondScreenState();
  }
}

class _SecondScreenState extends State<SecondScreen> {

  int group = 1;


  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();
  TextEditingController textSurnameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('Edit profile',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        leading: BackButton(
          onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder: (context) => FirstScreen()),
            );
          },
        ),
        backgroundColor: Colors.yellow[500],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.0,),
            TextFormField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              maxLines: 1,



            ),
            SizedBox(height: 10.0,),
            TextFormField(
              controller: textSurnameController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                labelText: 'Surname',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              maxLines: 1,
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow[500], width: 3.0),
                ),
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Male',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0,),
                Radio(
                  value: 1,
                  groupValue: group,
                  activeColor:  Colors.yellow[500],
                  onChanged: (T){
                    print(T);
                    setState((){
                      group = T;
                    });


                  },
                ),
                Radio(
                  value: 2,
                  groupValue: group,
                  activeColor:  Colors.yellow[500],
                  onChanged: (T){
                    print(T);
                    setState((){
                      group = T;
                    });
                  },
                ),
                SizedBox(height: 5.0,),
                Text(
                  'Female',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),



            RaisedButton(
              child: Text(
                'Save',
                style: TextStyle(fontSize: 24,
                    color: Colors.grey[800]),
              ),
              color: Colors.yellow[500],
              onPressed: () {
                hideKeyboard();
                _sendDataBack(context); //Работало до правок
              },
            )
          ],
        ),

      ),
    );
  }


  void hideKeyboard () {
    SystemChannels.textInput.invokeMapMethod('TextInput.hide');
  }

  // get the text in the TextField and send it back to the FirstScreen
  void _sendDataBack(BuildContext context) {
    List<String> list = List<String>();
    list.add(textFieldController.text);
    list.add(textSurnameController.text);
    //String textToSendBack = textFieldController.text;
    Navigator.pop(context, list);
  }
}