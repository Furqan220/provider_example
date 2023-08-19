import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp/provider/favourite_provider.dart';
import 'package:provider_exp/screens/Favourite%20app/my_favourite_screen.dart';

class FavouriteItemScreen extends StatefulWidget {
  const FavouriteItemScreen({super.key});

  @override
  State<FavouriteItemScreen> createState() => _FavouriteItemScreenState();
}

class _FavouriteItemScreenState extends State<FavouriteItemScreen> {
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
        title: const Text("Favourite Example"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyFavouriteItemScreen(),
                    ));
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          itemBuilder: (context, index) => Consumer<FavouriteProvider>(
                builder: (context, value, child) => ListTile(
                  onTap: () {
                    if (value.favItems.contains(index)) {
                      value.unmarkFav(index);
                    } else {
                      value.markFav(index);
                    }
                  },
                  title: Text('Item $index'),
                  trailing: Icon(value.favItems.contains(index)
                      ? Icons.favorite
                      : Icons.favorite_outline),
                ),
              ),
          itemCount: 50),
    );
  }
}
