import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CounterScreenTwo extends StatelessWidget {
  CounterScreenTwo({super.key});

  ValueNotifier<int> counter = ValueNotifier<int>(0);
  ValueNotifier<bool> isObsecure = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("rebuild");
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
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ValueListenableBuilder(
                valueListenable: isObsecure,
                builder: (context, value, child) => Container(
                      padding: const EdgeInsets.all(50),
                      child: TextFormField(
                        obscureText: isObsecure.value,
                        decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isObsecure.value = !isObsecure.value;
                                },
                                icon: Icon(isObsecure.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined
                                    
                                    
                                    ))),
                      ),
                    )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
