import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example File Structure'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              child: const Text('increment'),
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
            ),
            ElevatedButton(
              child: const Text('decrement'),
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
