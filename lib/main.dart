import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class CounterNotifier extends ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  void increament() {
    _count++;
    notifyListeners();
  }
}

final countProvider = ChangeNotifierProvider<CounterNotifier>((_) {
  return CounterNotifier();
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: CounterWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(countProvider).increament();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final count = watch(countProvider);
    return Text(count.getCount.toString());
  }
}
