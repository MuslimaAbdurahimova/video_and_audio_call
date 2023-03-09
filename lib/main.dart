import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;
  List<int> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Draggable<int>(
            data: 1,
            feedback: Container(
              height: 100.0,
              color: Colors.lightGreenAccent,
              child: Center(
                child: Text(
                  'Product item : $index ',
                  style: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
              ),
            ),
            childWhenDragging: const SizedBox.shrink(),
            child: Container(
              height: 100.0,
              width: 100.0,
              color: Colors.lightGreenAccent,
              child: Center(
                child: Text('Product item : $index '),
              ),
            ),
          ),
        );
      }),
      floatingActionButton: DragTarget<int>(
        builder: (BuildContext context, List<dynamic> accepted,
            List<dynamic> rejected) {
          return Container(
            margin: EdgeInsets.all(32),
            width: 100,
            height: 100,
            color: Colors.red,
            child: Center(child: Text("C: $acceptedData")),
          );
        },
        onAccept: (int data) {
          acceptedData += data;
          setState(() {});
        },
      ),
    );
  }
}
