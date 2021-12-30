import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider8 extends StatefulWidget {
  const Provider8({Key? key}) : super(key: key);

  @override
  _Provider8State createState() => _Provider8State();
}

class _Provider8State extends State<Provider8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider-Courses-Provider8'),
        centerTitle: true,
        backgroundColor: Colors.brown[300],
      ),
      body: Provider<Model>(
        create: (context) => Model(),
        child: Column(
          children: [
            Consumer<Model>(
              builder: (context, value, child) {
                return Text(
                  value.text1,
                  style: const TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                );
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            Consumer<Model>(
              builder: (context, value, child) {
                return MaterialButton(
                  color: Colors.brown,
                  onPressed: () {
                    value.changeText1();
                  },
                  child: const Text(
                    'Changed Provider one',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 30.0,
            ),
            Consumer<Model>(
              builder: (context, value, child) {
                // print(value.text1);
                return MaterialButton(
                  color: Colors.brown,
                  onPressed: () {
                    value.changeText2();
                  },
                  child: const Text(
                    'Changed Provider Tow',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Model {
  String text1 = "Hallo ";

  void changeText1() {
    text1 = "Provider one ";
    // ignore: avoid_print
    print(text1);
  }

  void changeText2() {
    text1 = "Provider Tow ";
    // ignore: avoid_print
    print(text1);
    //this print value exchange
  }
}
