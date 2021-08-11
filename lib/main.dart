import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(CountPage());
}

class CountPage extends StatefulWidget {

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int _counter = 0;
  bool _flag = true;
  bool _lightFlag = true;
  AudioCache _player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _lightFlag ? ThemeData.light():ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('カウンター'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                _flag ? '$_counter':'10回も押すな',
              ),
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      if(_lightFlag) {
                        _lightFlag = false;
                      }else{
                        _lightFlag = true;
                      }
                    });
                  },
                  child: Text(_lightFlag ? '暗くする？':'明るくする？'),
                  style:ElevatedButton.styleFrom(
                    elevation: 16,
                  )
              ),
              IconButton(
                  onPressed: (){
                    _player.play('sounds/Warning-Alarm02-1L.mp3');
                  },
                  icon: Icon(Icons.remove_red_eye_outlined),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
              if(_counter % 10 == 0) {
                _flag = false;
              }else{
                _flag = true;
              }
            });
          },
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
