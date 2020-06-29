import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_shop/providers/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  OrderWidget(this.order);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Rs ${widget.order.total}'),
            subtitle:
                Text(DateFormat('dd/MM/yyyy').format(widget.order.dateTime)),
            trailing: IconButton(

              icon: _isExpanded
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Container(
              height: min(widget.order.cartItem.length * 20.0 + 100, 180),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                        '${widget.order.cartItem.values.toList()[index].title}'),
                    trailing: Text(
                        'x ${widget.order.cartItem.values.toList()[index].quantity} Rs ${widget.order.cartItem.values.toList()[index].price}'),
                  );
                },
                itemCount: widget.order.cartItem.length,
              ),
            ),
        ],
      ),
    );
  }
}
