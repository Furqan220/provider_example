import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp/provider/counter_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    counterProvider.resetCount();
    // Timer.periodic(Duration(milliseconds: 2), (timer) => counterProvider.setCount());
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder: (context, value, child) => Text(
                '${value.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterProvider.setCount(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
