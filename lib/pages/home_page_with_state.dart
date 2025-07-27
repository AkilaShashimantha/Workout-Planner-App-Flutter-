import 'package:flutter/material.dart';

class HomePageWithState extends StatefulWidget {
  HomePageWithState({super.key});

  int _counter1 = 200;

  @override
  State<HomePageWithState> createState() => _HomePageWithStateState();
}

class _HomePageWithStateState extends State<HomePageWithState> {
  int _counter2 = 100;

  void addcounter() {
    setState(() {
      widget._counter1++;
    });
  }

  void removeCounter() {
    setState(() {
      widget._counter1--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          widget._counter1.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              addcounter();
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              removeCounter();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
