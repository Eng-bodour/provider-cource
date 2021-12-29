import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // String text = "Welcom";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Provider-Courses'),
            centerTitle: true,
            backgroundColor: Colors.brown[300],
          ),
          body: Consumer<Model>(
            builder: (context, valueModel, child) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    valueModel.text,
                    style: const TextStyle(
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  MaterialButton(
                    color: Colors.brown,
                    onPressed: () {
                      valueModel.changeText();
                    },
                    child: const Text(
                      'Changed Text',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class Model extends ChangeNotifier {
  String text = "Hello";
  void changeText() {
    text = "Bodour";
    notifyListeners();
  }
}
