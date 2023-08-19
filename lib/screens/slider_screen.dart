import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp/provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Slider Example'),
        centerTitle: true,
      ),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(
            builder: (context, value, child) => Slider(
              
              value: value.svalue, 
              onChanged: (v){
                value.setValue(v);
              }
              
              ),
            ),
          Consumer<SliderProvider>(
            builder: (context, value, child) => Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                
              color: Colors.red.withOpacity(value.svalue),
                border: Border.all(
                  color: Colors.black,
                  width: 5
                )
              
              ),
              )
            )
      ],)
    );
  }
}
