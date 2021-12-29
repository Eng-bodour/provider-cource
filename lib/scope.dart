import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scope extends StatefulWidget {
  const Scope({Key? key}) : super(key: key);

  @override
  _ScopeState createState() => _ScopeState();
}

class _ScopeState extends State<Scope> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider-Courses-Scope'),
        centerTitle: true,
        backgroundColor: Colors.brown[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChangeNotifierProvider(
              create: (context) => Model(),
              child: const Text('Test Scope'),
            ),
            Consumer<Model>(
              builder: (context, value, child) => Text(
                value.text,
                style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              color: Colors.brown,
              onPressed: () {
                // valueModel.changeText();
              },
              child: const Text(
                'Changed Text',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
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
