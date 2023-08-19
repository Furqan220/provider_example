import 'package:flutter/material.dart';
import 'package:provider_exp/screens/Favourite%20app/items_screen.dart';
import 'package:provider_exp/screens/change_theme_screen.dart';
import 'package:provider_exp/screens/counter_screen.dart';
import 'package:provider_exp/screens/counter_screen_two.dart';
import 'package:provider_exp/screens/login_screen.dart';
import 'package:provider_exp/screens/slider_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // final counterProvider = Provider.of<CounterProvider>(context,listen: false);
    // Timer.periodic(Duration(milliseconds: 2), (timer) => counterProvider.setCount());
  }

  final List<IndexItem> _indexItem =  [
    IndexItem("Counter Example",const CounterScreen()),
    IndexItem("Slider Example",const SliderScreen()),
    IndexItem("Favourite Example",const FavouriteItemScreen()),
    IndexItem("Change Theme Example",const ChangeThemeScreen()),
    IndexItem("Counter Example with Stateless Widget", CounterScreenTwo()),
    IndexItem("Login Example", LoginScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Provider"),
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          itemBuilder: (context, index) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _indexItem[index].widget,
                    ));
              },
              child: Text(_indexItem[index].title)),
          separatorBuilder: (context, index) => const SizedBox(
                height: 30,
              ),
          itemCount: _indexItem.length),
    );
  }
}

class IndexItem {
  final String title;
  final Widget widget;
   IndexItem(this.title, this.widget);
}
