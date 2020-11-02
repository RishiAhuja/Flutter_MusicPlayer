import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(Second());
}

class Second extends StatefulWidget {
   @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.redAccent,
      ),
    body: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('What to do ?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold
              ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('To initiate you have to click on the music button at bottom to select the music you want to play and then the music will be started and you have to enjoy your day then',textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Conatct:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text('To Contact us\nEmail: www.rishiahuja@gmail.com\nPhone:+919915972220',textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),

      ],
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.redAccent,
      items: [
      new BottomNavigationBarItem(icon: Text(''),
            title: Text('')
        ),
        new BottomNavigationBarItem(icon: Text(''),
            title: Text('')
        ),

    ]
    )
    );
  }
}
