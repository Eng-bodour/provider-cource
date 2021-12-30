import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProvider9 extends StatefulWidget {
  const MultiProvider9({Key? key}) : super(key: key);

  @override
  _MultiProvider9State createState() => _MultiProvider9State();
}

class _MultiProvider9State extends State<MultiProvider9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider-Courses-MultiProvider9'),
        centerTitle: true,
        backgroundColor: Colors.brown[300],
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Model()),
          ChangeNotifierProvider(
            create: (context) => Prov(),
          )
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Model>(
                  builder: (context, value, child) {
                    return MaterialButton(
                      color: Colors.brown,
                      onPressed: () {
                        value.changeText();
                      },
                      child: const Text(
                        'Changed model',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Consumer<Model>(
                  builder: (context, value, child) {
                    return Text(
                      value.textModel,
                      style: const TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Prov>(
                  builder: (context, value, child) {
                    return MaterialButton(
                      color: Colors.brown,
                      onPressed: () {
                        value.changeText();
                      },
                      child: const Text(
                        'Changed prov',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Consumer<Prov>(
                  builder: (context, value, child) {
                    return Text(
                      value.textProv,
                      style: const TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Model with ChangeNotifier {
  String textModel = "Hallo Model";

  void changeText() {
    textModel = "textModel is :  Model ";
    notifyListeners();
  }
}

class Prov extends ChangeNotifier {
  String textProv = "Hallo Prov";

  void changeText() {
    textProv = "textProv is : Prov ";
    notifyListeners();
  }
}
