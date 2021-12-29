import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerClass3 extends StatefulWidget {
  const ConsumerClass3({Key? key}) : super(key: key);

  @override
  _ConsumerClass3State createState() => _ConsumerClass3State();
}

class _ConsumerClass3State extends State<ConsumerClass3> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModelConsumer(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider-Courses-Consumer'),
          centerTitle: true,
          backgroundColor: Colors.brown[300],
        ),
        body: ListView(
          children: [
            Consumer<ModelConsumer>(builder: (context, value, child) {
              // ignore: avoid_print
              print('text1');
              return Text(
                value.text1,
                style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              );
            }),
            const SizedBox(
              height: 30.0,
            ),
            Consumer<ModelConsumer>(builder: (context, value, child) {
              // ignore: avoid_print
              print('text2');
              return Text(
                value.text2,
                style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              );
            }),
            const SizedBox(
              height: 30.0,
            ),
            Consumer<ModelConsumer>(builder: (context, value, child) {
              // ignore: avoid_print
              print('button');
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
            })
          ],
        ),
      ),
    );
  }
}

class ModelConsumer extends ChangeNotifier {
  String text1 = 'Hello';
  String text2 = 'EveryOne';

  void changeText1() {
    text1 = 'Bodour';
    text2 = 'Majadme';
    notifyListeners();
  }
}
