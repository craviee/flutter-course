import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData
      (
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 20)))
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions
  {
    return _userTransactions.where
    (
      (tx)
      {
        return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      }
    ).toList();
  }
  
  void _addNewTransaction(String title, double amount, DateTime date)
  {
    final newTx = Transaction(title: title, amount: amount, date: date, id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id)
  {
    setState((){_userTransactions.removeWhere((element) => element.id == id);});
  }

  void startAddNewTransaction(BuildContext ctx)
  {
    showModalBottomSheet
    (
      context: ctx, builder: (_)
      {
        return GestureDetector
        (
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () => startAddNewTransaction(context),)
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: () => startAddNewTransaction(context),),
    );
  }
}
