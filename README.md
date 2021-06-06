# The Main PSB DEMO Application of Micro Mobile Architecture

### Concepts

The micro mobile applications and store are imported in `pubspec.yaml`.

```
micro_mobile:
    git:
      url: git://github.com/Crepiks/flutter-micro-mobile

  payments:
    git:
      url: git://github.com/Crepiks/psb-payments

  profile:
    git:
      url: git://github.com/Crepiks/psb-profile
```

In `dart.main` store is imported and configured. The events are registered.

```
App() {
    store.registerEvent('TRANSACTION_ADD');
    store.registerEvent('NAVIGATE_HOME');
    store.registerEvent('NAVIGATE_PROFILE');
    store.registerEvent('NAVIGATE_PAYMENTS');
}
```

Widgets from micro mobile apps are imported and store is passed into them as an argument of the constructor.

```
ProfileScreen(store: widget.store)
```

There is custom widgets created in main application which consume non-screen widgets imported from micro mobile apps;

```
Container(
    height: 500,
    child: LatestTransactions(store: widget.store),
)
```

The common interfaces can be exported from main application. For instance, the Transaction model in defined in main application and consumed by micro apps.

```
class Transaction {
  String name;
  String date;
  String value;

  Transaction({required this.name, required this.date, required this.value});
}
```
