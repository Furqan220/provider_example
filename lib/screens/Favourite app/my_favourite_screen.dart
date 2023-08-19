import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp/provider/favourite_provider.dart';

class MyFavouriteItemScreen extends StatefulWidget {
  const MyFavouriteItemScreen({super.key});

  @override
  State<MyFavouriteItemScreen> createState() => _MyFavouriteItemScreenState();
}

class _MyFavouriteItemScreenState extends State<MyFavouriteItemScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // final counterProvider = Provider.of<CounterProvider>(context,listen: false);
    // Timer.periodic(Duration(milliseconds: 2), (timer) => counterProvider.setCount());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("My Favourites"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
          ],
        ),
        body: Consumer<FavouriteProvider>(
          builder: (context, value, child) => ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      value.unmarkFav(value.favItems[index]);
                    },
                    title: Text('Item ${value.favItems[index]}'),
                    trailing: const Icon(Icons.favorite),
                  ),
              itemCount: value.favItems.length),
        ));
  }
}
