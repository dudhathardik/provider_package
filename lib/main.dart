import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prackties/provider/count.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Number(),
      child: MaterialApp(
        title: 'Provider Package',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final loadData = Provider.of<Number>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Count',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 10),
            Consumer<Number>(
              builder: (ctx, Number, child) {
                return Text(
                  '${Number.count}',
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
            const SizedBox(height: 10),
            Consumer<Number>(
              builder: (context, Number, child) {
                return ElevatedButton(
                  onPressed: () {
                    Number.increment();
                  },
                  child: const Icon(Icons.add),
                );
              },
            ),
            const SizedBox(height: 10),
            Consumer<Number>(
              builder: (context, Number, child) {
                return ElevatedButton(
                  onPressed: () {
                    Number.decrement();
                  },
                  child: const Icon(Icons.exposure_minus_1),
                );
              },
            ),
          ],
        ),
      ),
      //  Consumer<Number>(
      //         builder: (context, Number, child) {
      //           return FloatingActionButton(
      //             onPressed: () {},
      //             child: const Icon(Icons.add),
      //           );
      //         },
      //       ),
    );
  }
}
