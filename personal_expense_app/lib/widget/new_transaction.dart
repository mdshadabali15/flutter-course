import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function function;

  NewTransaction(this.function);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;

  void submitted() {
    var title = titleController.text;
    double amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    widget.function(
      titleController.text,
      double.parse(amountController.text),
      _selectedDate,
    );

    Navigator.of(context)
        .pop(); // This will be used to pop of  modal bottom sheet.
  }

  void _popDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((value) {
      // It will be executed once use select date
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => submitted(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                //onChanged: (value) => amount=value,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) =>
                    submitted(), // (_) is required because onSubmitted takes function with one argument
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Data Chosen'
                            : DateFormat('MM-dd-yyyy').format(_selectedDate),
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        'Chose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _popDatePicker,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                  child: Text(
                    'Add Transaction',
                  ),
                  onPressed: submitted),
            ],
          ),
        ),
      ),
    );
  }
}
