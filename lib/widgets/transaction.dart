import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spell_your_name/model/alphabets.dart';
import 'package:spell_your_name/widgets/user_entry.dart';
import 'package:spell_your_name/widgets/words_list.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  List<String> _userEntry = <String>[];
  List<String> _matchingWords = <String>[];
  bool _showReset = false;
  TextEditingController _nameController = new TextEditingController();

  var _random = new Random();

  void resetHandler() {
    setState(() {
      _showReset = false;
      _nameController.clear();
      _userEntry.clear();
      _matchingWords.clear();
    });
  }

  void getWords(String words, bool isPhonetic) {
    _matchingWords = <String>[];
    if (isPhonetic) {
      words.characters.forEach((e) {
        Alphabets.phoneticOnly.forEach((element) {
          if (element['key'] == e.toUpperCase()) {
            List<String> vals = element['values'];
            setState(() {
              _showReset = true;
              _userEntry = words.toUpperCase().characters.toList();
              _matchingWords.add(vals[_random.nextInt(vals.length)]);
            });
          }
        });
      });
    } else {
      words.characters.forEach((e) {
        Alphabets.texts.forEach((element) {
          if (element['key'] == e.toUpperCase()) {
            List<String> vals = element['values'];
            setState(() {
              _showReset = true;
              _userEntry = words.toUpperCase().characters.toList();
              _matchingWords.add(vals[_random.nextInt(vals.length)]);
            });
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserEntry(getWords, _nameController),
        _showReset
            ? Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: ElevatedButton(
                  onPressed: resetHandler,
                  child: Text('Reset'),
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  'Nothing to display!',
                ),
              ),
        WordsList(_userEntry, _matchingWords),
      ],
    );
  }
}
