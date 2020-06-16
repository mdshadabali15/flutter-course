import 'package:flutter/material.dart';
import 'package:personal_expense_app/widget/chart.dart';
import 'package:personal_expense_app/widget/new_transaction.dart';
import 'model/transaction.dart';
import 'package:intl/intl.dart';

import 'widget/transactionList.dart';

void main() => runApp(ExpenseApp());


class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          button: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
      ),
      home: ExpenseAppBase(),
    );
  }
}

class ExpenseAppBase extends StatefulWidget {
  @override
  _ExpenseAppBaseState createState() => _ExpenseAppBaseState();
}

class _ExpenseAppBaseState extends State<ExpenseAppBase> {


  void startAddTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
             onTap: (){},
             child: NewTransaction(addTransaction),);
        });
  }


  // Dynamic properties of recentTransaction
 List<Transaction> get _recentTransaction{
    return transactionList.where((element){
      return element.transactionDate.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _deleteTransaction(String id){
    setState(() {
      transactionList.removeWhere((element) {
        return element.id==id;
      });
    });
  }


 final List<Transaction> transactionList = [
    /*new Transaction(
      id: 't1',
      title: 'Big Basket',
      transactionDate: DateTime.now(),
      amount: 500.45,
    ),
    new Transaction(
      id: 't2',
      title: 'Amazon Pantry',
      transactionDate: DateTime.now(),
      amount: 1500.45,
    )*/
  ];
 //final List<Transaction> transactionList =null;

  void addTransaction(String txnTitle, double txnAmount, DateTime dateTime) {
    var tx = new Transaction(
      title: txnTitle,
      amount: txnAmount,
      transactionDate: dateTime,
      id: DateTime.now().toString(),
    );
    setState(() {
      transactionList.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => startAddTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Chart(_recentTransaction), // Recent Transaction is properties
            ),
            TransactionList(transactionList,_deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => startAddTransaction(context),
        ),
      ),
    );
  }

}
