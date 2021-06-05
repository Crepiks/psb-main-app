import 'package:flutter/material.dart';
import "package:micro_mobile/micro_mobile.dart";
import "package:payments/app.dart";
import "package:profile/app.dart";
import './models/transaction_model.dart';
import "./widgets/transaction_card.dart";

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final Store store = Store();

  App() {
    store.registerEvent('TRANSACTION_ADD');
    store.registerEvent('NAVIGATE_HOME');
    store.registerEvent('NAVIGATE_PROFILE');
    store.registerEvent('NAVIGATE_PAYMENTS');
    store.registerEvent('NAVIGATE_POP');

    store.addEventListener('TRANSACTION_ADD', (Object payload) {
      print('TRANSACTION_ADD');
    });

    store.addEventListener('NAVIGATE_HOME', (BuildContext context) {
      print('NAVIGATE_HOME');
    });

    store.addEventListener('NAVIGATE_PROFILE', (BuildContext context) {
      print('NAVIGATE_PROFILE');
    });

    store.addEventListener('NAVIGATE_PAYMENTS', (BuildContext context) {
      print('NAVIGATE_PAYMENTS');
    });

    store.addEventListener('NAVIGATE_POP', (BuildContext context) {
      print('NAVIGATE_POP');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ПСБ Банк',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        store: store,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Store store;

  HomeScreen({Key? key, required this.store}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final transactions = <Transaction>[
    Transaction(name: "Hekki", date: "06.05.2021", value: "+250 USA")
  ];

  @override
  void initState() {
    super.initState();

    widget.store.addEventListener("TRANSACTION_ADD", (Transaction payload) {
      addTransation(payload);
      addTransation(
          Transaction(name: "Hello", date: "06.05.2021", value: "+250 USA"));
    });
  }

  void addTransation(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.store.addEventListener('NAVIGATE_PROFILE', (BuildContext context) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileScreen(store: widget.store)));
    });

    widget.store.addEventListener('NAVIGATE_PAYMENTS', (BuildContext context) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PaymentsScreen(store: widget.store)));
    });

    widget.store.addEventListener('NAVIGATE_POP', (BuildContext context) {
      Navigator.pop(context);
    });

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    widget.store.emit('NAVIGATE_PAYMENTS', context);
                  },
                  icon: Icon(Icons.credit_card)),
              Container(
                height: 70,
                alignment: Alignment.center,
                child: Text(
                  "Главная",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                  onPressed: () {
                    widget.store.emit('NAVIGATE_PROFILE', context);
                  },
                  icon: Icon(Icons.person))
            ],
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      var transaction = transactions[index];

                      return Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: TransactionCard(
                            name: transaction.name,
                            date: transaction.date,
                            value: transaction.value),
                      );
                    })),
          ),
        ],
      ),
    )));
  }
}
