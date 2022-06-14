import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: deviceOrientation == Orientation.landscape
              ? const LandScape(title: "landscape")
              : const Portrait(title: "portrait")),
    );
  }
}

class Portrait extends StatelessWidget {
  const Portrait({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        backgroundColor: Colors.purpleAccent,
        child: ListView(
          children: const [
            ListTile(
              title: Text("first item"),
            ),
            ListTile(
              title: Text("second item"),
            ),
            ListTile(
              title: Text("third item"),
            ),
          ],
        ),
      ),
    );
  }
}

class LandScape extends StatelessWidget {
  const LandScape({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.purple,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: ListView(
              children: const [
                ListTile(
                  title: Text("first item"),
                ),
                ListTile(
                  title: Text("second item"),
                ),
                ListTile(
                  title: Text("third item"),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
