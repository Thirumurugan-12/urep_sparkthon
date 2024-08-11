import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  final String name;
  final double price;
  final List<dynamic> stocks;

  ViewPage({
    Key? key,
    required this.name,
    required this.price,
    required this.stocks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          var stock = stocks[index];
          return ListTile(
            title: Text(stock['storeName']),
            subtitle: Text('Stock: ${stock['stock']}'),
            trailing: Text('\$${price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}