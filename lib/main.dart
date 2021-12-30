import 'package:flutter/material.dart';
import 'package:spell_your_name/widgets/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spell Any Word',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Spell Any Word'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width * .85,
            child: Column(
              children: [
                Transaction(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
