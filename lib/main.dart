import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'help.dart';

void main() {
  runApp(Music());
}
class Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Player(),
    );
  }
}
class Player extends StatefulWidget {


  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = '00:00';
  String completeTime = '00:00';
  String fileName = 'No file selected';
  @override
  void initState(){
    super.initState();
    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split('.')[0];
      });
    });
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split('.')[0];
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),

      body: Container(
        decoration: BoxDecoration(
            color: Colors.redAccent[100],
            borderRadius: BorderRadius. all(
                Radius.circular(0)
            )
        ),
        child: ListView(
          children: [
            SizedBox(height: 60),
            Align(

              alignment: Alignment.topCenter,
              child: Container(
                // margin: EdgeInsets.fromLTRB(80, 200, 80 ,200),
                decoration: BoxDecoration(
                    color: Colors.redAccent[100],
                    borderRadius: BorderRadius. all(
                        Radius.circular(0)
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image(image: AssetImage('assets/icon.png'),height: 300,width: 300,),
                    // SizedBox(height: 70),

                    Center(
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(fileName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )),
                        ),

                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 60),
                        Text(currentTime,style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width:5),
                        Text(' | ',style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width:5),
                        Text(completeTime,style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: FlatButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),

                              onPressed: () {
                                if(isPlaying){
                                  audioPlayer.pause();
                                  setState(() {
                                    isPlaying = false;
                                  });
                                }
                                else{
                                  audioPlayer.resume();
                                  setState(() {
                                    isPlaying = true;
                                  });
                                }
                              },
                              child: Icon(isPlaying ?  Icons.pause : Icons.play_arrow, color: Colors.grey[900])
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: FlatButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),

                              onPressed: () {
                                audioPlayer.stop();
                                setState(() {
                                  isPlaying = false;
                                  currentTime = '0:00:00';
                                });
                              },
                              child: Icon(Icons.stop, color: Colors.grey[900])
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),

                  ],

                ),
              ),

            ),

            SizedBox(width: 10),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        items: [
          new BottomNavigationBarItem(
            icon: SizedBox(
              height: 33,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.home,color: Colors.white,),
              ),
            ),
            // icon: Icon(Icons.format_list_bulleted),
            title: SizedBox(height:16,child: FlatButton(
                onPressed: () {},
                child:Text('Home',style: TextStyle(
                    color: Colors.white,
                    fontSize: 13
                ),)
            )
            ),
          ),
          new BottomNavigationBarItem(

            icon: SizedBox(
              height: 33,
              child: IconButton(
                onPressed: () async{
                  FilePickerResult result = await FilePicker.platform.pickFiles();
                  if(result != null) {
                    PlatformFile file = result.files.first;
                    int status = await audioPlayer.play(file.path,isLocal: true);
                    if(status==1){
                      isPlaying = true;
                      fileName = file.name;
                    }
                  }
                },
                icon: Icon(Icons.library_music,color: Colors.white,),
              ),
            ),
            // icon: Icon(Icons.format_list_bulleted),
            title: SizedBox(height:16,child: FlatButton(
                onPressed: () async{
                  FilePickerResult result = await FilePicker.platform.pickFiles();
                  if(result != null) {
                    PlatformFile file = result.files.first;
                    int status = await audioPlayer.play(file.path,isLocal: true);
                    if(status==1){
                      isPlaying = true;
                      fileName = file.name;

                    }
                  }
                },child:Text('Music',style: TextStyle(
                color: Colors.white
            ),)
            )
            ),
          ),


          new BottomNavigationBarItem(

            icon: SizedBox(
              height: 33,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Second()),
                  );
                },
                icon: Icon(Icons.help_outline,color: Colors.white,),
              ),
            ),
            // icon: Icon(Icons.format_list_bulleted),
            title: SizedBox(height:16,child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Second()),
                  );
                },
                child:Text('Help',style: TextStyle(
                    color: Colors.white
                ),)
            )
            ),
          ),
        ],
      ),
    );
  }
}

