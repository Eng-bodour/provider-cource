import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderOf extends StatefulWidget {
  const ProviderOf({Key? key}) : super(key: key);

  @override
  _ProviderOfState createState() => _ProviderOfState();
}

class _ProviderOfState extends State<ProviderOf> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Model>(context);
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider-Courses-Scope'),
          centerTitle: true,
          backgroundColor: Colors.brown[300],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                model.text,
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
                  model.changeText();
                },
                child: const Text(
                  'Changed Text',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
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
