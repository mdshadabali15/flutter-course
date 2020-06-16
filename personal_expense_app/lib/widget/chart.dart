import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/model/transaction.dart';
import 'package:personal_expense_app/widget/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactionList;

  Chart(this.recentTransactionList);

  // dynamic property declaration
  List<Map<String, Object>> get groupRecentTransaction {
    return List.generate(7, (index) {
      // Getting weekday(Like Monday,Tuesday)
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0.00;
      for (var i = 0; i < recentTransactionList.length; i++) {
        if (recentTransactionList[i].transactionDate.day == weekday.day &&
            recentTransactionList[i].transactionDate.year == weekday.year) {
          totalsum += recentTransactionList[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get totalSpendingAmount {
    return groupRecentTransaction.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groupRecentTransaction);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupRecentTransaction.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  e['day'],
                  e['amount'],
                  totalSpendingAmount == 0.0
                      ? 0.0
                      : (e['amount'] as double) / totalSpendingAmount),
            );
          }).toList(),
        ),
      ),
    );
  }
}
