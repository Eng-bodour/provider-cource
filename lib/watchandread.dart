import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchAndRead extends StatefulWidget {
  const WatchAndRead({Key? key}) : super(key: key);

  @override
  _WatchAndReadState createState() => _WatchAndReadState();
}

class _WatchAndReadState extends State<WatchAndRead> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Model(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Provider-Courses-WatchAndREad'),
            centerTitle: true,
            backgroundColor: Colors.brown[300],
          ),
          body: const WidgetChild(),
        ));
  }
}

class WidgetChild extends StatelessWidget {
  const WidgetChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  var model = Provider.of<Model>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            //model.text1;
            context.read<Model>().text1,
            style: const TextStyle(
                color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            //model.text2;
            context.read<Model>().text2,
            style: const TextStyle(
                color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 30.0,
          ),
          MaterialButton(
            color: Colors.brown,
            onPressed: () {
              // model.changeText1();
              context.read<Model>().changeText1();
            },
            child: const Text(
              'Changed watch',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          MaterialButton(
            color: Colors.brown,
            onPressed: () {
              // model.changeText2();
              context.read<Model>().changeText2();
            },
            child: const Text(
              'Changed Read',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String text1 = "Hallo ";
  String text2 = "Word ";
  get textOne => text1;
  get textTow => text2;

  void changeText1() {
    text1 = "Watch ";
    notifyListeners();
  }

  void changeText2() {
    text2 = "Read ";
    notifyListeners();
  }
}
