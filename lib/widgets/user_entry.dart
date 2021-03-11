import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserEntry extends StatefulWidget {
  final Function getWords;
  final TextEditingController _nameController;

  UserEntry(this.getWords, this._nameController);

  @override
  _UserEntryState createState() => _UserEntryState();
}

class _UserEntryState extends State<UserEntry> {
  TextEditingController getNameControl() {
    return widget._nameController;
  }

  bool isPhonetic = true;

  void submitData() {
    final enteredText = getNameControl().text;

    if (enteredText.isEmpty) {
      return;
    }

    widget.getWords(enteredText, isPhonetic);
  }

  void checkBoxHandler(bool val) {
    setState(() {
      this.isPhonetic = !this.isPhonetic;
    });
    submitData();
  }

  void resetHandler() {
    getNameControl().clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
              child: TextField(
                style: TextStyle(fontSize: 20),
                controller: getNameControl(),
                decoration: InputDecoration(
                  labelText: 'Name',
                  suffixIcon: IconButton(
                    onPressed: resetHandler,
                    icon: Icon(Icons.clear),
                  ),
                ),
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                ],
                onSubmitted: (_) => submitData(),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(
                children: [
                  Checkbox(
                    onChanged: checkBoxHandler,
                    /*(bool val) {
                      setState(() {
                        this.isPhonetic = !this.isPhonetic;
                      });
                    },*/
                    value: this.isPhonetic,
                  ),
                  Text('Phonetic only?'),
                ],
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text(
                  'Get words',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
