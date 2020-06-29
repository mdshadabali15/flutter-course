import 'package:flutter/material.dart';
import 'package:my_shop/providers/order.dart';
import 'package:my_shop/widgets/drawer.dart';
import 'package:my_shop/widgets/order_widget.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routName = '/order_route';

  @override
  Widget build(BuildContext context) {


    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){
        return OrderWidget(orderProvider.getOrderList[index]);
      },itemCount: orderProvider.getOrderList.length,) ,
      drawer: DrawerWidget(),
    );
  }
}
