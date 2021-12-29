import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectorClass extends StatefulWidget {
  const SelectorClass({Key? key}) : super(key: key);

  @override
  _SelectorClassState createState() => _SelectorClassState();
}

class _SelectorClassState extends State<SelectorClass> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModelSelector(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider-Courses-Selector'),
          centerTitle: true,
          backgroundColor: Colors.brown[300],
        ),
        body: ListView(
          children: [
            Selector<ModelSelector, int>(
              selector: (context, valueG1) => valueG1.txtOne,
              builder: (context, value, child) {
                // ignore: avoid_print
                print('Selector text1 : $value');
                return Text(
                  '$value',
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
            Selector<ModelSelector, String>(
              selector: (context, valueG2) => valueG2.txtTow,
              builder: (context, value, child) {
                // ignore: avoid_print
                print('Selector text2');
                return Text(
                  value,
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
            Consumer<ModelSelector>(builder: (context, value, child) {
              // ignore: avoid_print
              // print('button1');
              return MaterialButton(
                color: Colors.brown,
                onPressed: () {
                  value.changeText1();
                },
                child: const Text(
                  'Changed Text1',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
            const SizedBox(
              height: 30.0,
            ),
            Consumer<ModelSelector>(builder: (context, value, child) {
              // ignore: avoid_print
              // print('button2');
              return MaterialButton(
                color: Colors.brown,
                onPressed: () {
                  value.changeText2();
                },
                child: const Text(
                  'Changed Text2',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ModelSelector extends ChangeNotifier {
  int text1 = 1;
  String text2 = 'EveryOne';

  // for selector
  get txtOne => text1;
  get txtTow => text2;

  void changeText1() {
    text1++;
    notifyListeners();
  }

  void changeText2() {
    text2 = 'Majadme';
    notifyListeners();
  }
}
