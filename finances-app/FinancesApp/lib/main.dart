import 'package:FinancesApp/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final  List<Transaction> transactions = [
    Transaction(id: "t1", title: "title1", amount: 10.00, date: DateTime.now()),
    Transaction(id: "t2", title: "title2", amount: 5.50, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>
        [
          Container
          (
            width: double.infinity,
            child: Card
            (
              color: Colors.blue,
              child: Text("Chart!"),
              elevation: 5,  
            ),
          ),
          Column(children: transactions.map((e) {
            return Card
            (
              child: Row(
                children: <Widget>[
                  Container
                  (
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                    padding: EdgeInsets.all(10),
                    child: Text
                    (
                      e.amount.toString(),
                      style: TextStyle
                      (
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple
                      ),
                    ),
                  ),
                  Column
                  (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text
                    (
                      e.title,
                      style: TextStyle
                      (
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    Text
                    (
                      e.date.toString(),
                      style: TextStyle
                      (
                        color: Colors.grey,
                        // fontSize: 12
                      ),
                    )
                  ],)
                ],
              ),
            );}).toList(),)
        ],
      )
    );
  }
}
