import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cuba/ml.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _homePageState();
  }

}

class _homePageState extends State<HomePage>{


  Future pickImage(context,source) async {
    var tempFile = await ImagePicker.pickImage(
      source: source,
    );

    if(tempFile != null){
      Navigator.push(context, MaterialPageRoute(builder: ( BuildContext context) => MLPage(tempFile)));
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Testing"),

        ),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(''),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text('Pilih',
                      style: TextStyle(
                        color: Colors.black87,
                        fontFamily: 'xd',
                        fontWeight: FontWeight.w600,
                        fontSize: 34,
                        letterSpacing: 1.4,
                        shadows: [
                          Shadow(
                              color: Colors.white.withOpacity(0.4),
                              offset: Offset(8.0,6.0),
                              blurRadius: 6
                          )
                        ],
                      )
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Card(
                      color: Colors.green,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {
                            pickImage(context,ImageSource.camera);
                          },
                          focusColor: Colors.greenAccent,
                          highlightColor: Colors.grey,
                          iconSize: 40,
                          icon: Icon(Icons.camera,color: Colors.white,),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.blue,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed:() {
                            pickImage(context,ImageSource.gallery);
                          },
                          focusColor: Colors.blueAccent,
                          highlightColor: Colors.grey,
                          iconSize: 36,
                          icon: Icon(Icons.photo_library,color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        )
    );
  }
}