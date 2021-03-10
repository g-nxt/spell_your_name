import 'package:flutter/material.dart';
import 'package:spell_your_name/widgets/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spell Your Name',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  /*String titleInput;
  String amountInput;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Spell Your Name'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .75,
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
