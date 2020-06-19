import 'dart:io';
import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactionList;
  final  Function deleteTransaction;

  TransactionList(this.userTransactionList,this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: userTransactionList.isEmpty
            ? LayoutBuilder(builder: (context,constraint){

              return Column(
                children: <Widget>[
                  Text('No Transaction Yet !!!'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraint.maxHeight * 0.6,
                    child: Image.asset('assets/image/waiting.png'),
                  ),
                ],
              );


        },)
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 4.0),
                            child: Text(
                                'Rs ${userTransactionList[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        userTransactionList[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                        DateFormat('dd-MM-yyyy')
                            .format(userTransactionList[index].transactionDate),
                      ),
                      trailing: MediaQuery.of(context).size.width> 460 ? FlatButton.icon(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                           label: Text('Delete'),
                        onPressed: (){
                          deleteTransaction(userTransactionList[index].id);
                        },

                      ) : IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: (){
                          deleteTransaction(userTransactionList[index].id);
                        },
                      ),
                    ),
                  );
                },
                itemCount: userTransactionList.length,
              ));
  }
}
