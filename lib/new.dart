

//-------------------------------------------------------------------
//          Shrungi Katre-BT19CSE132
//          IT-Workshop Final Project
//-------------------------------------------------------------------
// Firebase hosting URL -  https://pinterest2510-84505.web.app
//-------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

enum MenuOptions { Share, Hide, Report }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basketball',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//'',

  List<String> imageList = [
    'https://images.unsplash.com/photo-1546519638-68e109498ffc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmFza2V0YmFsbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1577471488278-16eec37ffcc2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YmFza2V0YmFsbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1580089595767-98745d7025c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmFza2V0YmFsbCUyMGtvYmV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://media.tenor.com/images/7991ac76b1b9d687d9336ab658f7badb/tenor.gif',
    'https://images.unsplash.com/photo-1518063319789-7217e6706b04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmFza2V0YmFsbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://media.tenor.com/images/2c3b37edd3fe8f73666260db617001c8/tenor.gif',
    'https://images.unsplash.com/photo-1529963183134-61a90db47eaf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aWNlbGFuZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1605896405055-0ea7c6dd0d7e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhvdCUyMGFpciUyMGJhbGxvb258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1544551763-46a013bb70d5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2N1YmElMjBkaXZpbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/flagged/photo-1580051579393-2e94dd6f4789?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGJhc2tldGJhbGx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://media.tenor.com/images/0baafbd28a6125906520d684d6d0fc9f/tenor.gif',
    'https://images.unsplash.com/photo-1574623452334-1e0ac2b3ccb4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fGJhc2tldGJhbGx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1601902623555-e64835dd7b4f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fG5iYXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bmlrZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1615461469775-9d244476325f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fG5pa2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://media.tenor.com/images/c5b9c12db322fc039522d26ca7f2846c/tenor.gif',
    'https://images.unsplash.com/photo-1593461696438-e5612190faf7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDB8fHNwb3J0c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1501555088652-021faa106b9b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YWR2ZW50dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1512036666432-2181c1f26420?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YWR2ZW50dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1541542684-be0c46417a12?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGFkdmVudHVyZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://media.tenor.com/images/12290bf618f67df6cba3b13b2860b826/tenor.gif',
    'https://images.unsplash.com/photo-1551891590-eeac39130199?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGFkdmVudHVyZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1529186338373-faa516eb4708?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmFsbG9uJTIwZmVzdGl2YWx8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/flagged/photo-1563142746-c1c670ea5c3a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fHNjdWJhJTIwZGl2aW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
  ];

  //final random = new Random();
  // i = random.nextInt(imageList.length);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            
            SizedBox(
              width: 5,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                onPressed: () {},
              ),
            ),
            Container(
              //margin: EdgeInsets.only(left:),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text(
                  'Today',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                //color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 60),
            child: SizedBox(
              height: 50,
              width: 900,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.transparent,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: "Search",
                  prefix: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(Icons.message),
              onPressed: () => {},
              color: Colors.black,
              iconSize: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () => {},
              color: Colors.black,
              iconSize: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(Icons.account_circle_sharp),
              onPressed: () => {},
              color: Colors.black,
              iconSize: 30,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 25),
            child: IconButton(
              icon: Icon(Icons.arrow_drop_down_sharp),
              onPressed: () => {},
              color: Colors.black,
              iconSize: 30,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            crossAxisSpacing: 25,
            mainAxisSpacing: 26,
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return HoverWidget(
                hoverChild: Container(
                  child: Stack(
                    children: [
                      new Container(
                        padding: EdgeInsets.only(right: 20),
                        margin: EdgeInsets.only(top: 15),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: new RaisedButton(
                              color: Colors.red[600],
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                      new Container(
                          child: Positioned(
                        bottom: 15,
                        right: 80,
                        //left: 100,
                        child: IconButton(
                          icon: Icon(Icons.download_sharp),
                          onPressed: () => {},
                          color: Colors.black,
                        ),
                      )),
                      
                      
                    ],
                  ),
                  decoration: BoxDecoration(
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.4), BlendMode.dstATop),
                        image: new NetworkImage(imageList[index]),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
                onHover: (event) {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imageList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
            }),
      ),
    );
  }
}

