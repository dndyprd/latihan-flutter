import 'package:latihan_flutter/screens/list_profile.dart';
import 'package:flutter/material.dart';
import 'package:latihan_flutter/screens/detail_profile.dart';
import 'package:latihan_flutter/models/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ListProfile(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Profile profile = Profile(
    id: 1,
    name: "Dandy Pradnyana",
    profesi64: "Front-end Developer",
    nomorTelpon64: "081234567890",
    domisili64: "Bali, Indonesia",
  );

  int _counter = 0;
  int step = 64;
  final TextEditingController _dataController = TextEditingController();

  @override
  void dispose() {
    _dataController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter += step;
    });
  }

  void _decrementCounter() {
    if (_counter >= step) {
      setState(() {
        _counter -= step;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Counter cannot be negative')),
      );
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Counter has been reset')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Dandy Pradnyana - 2415354064',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Text('Step Value : $step', style: TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            Text(
              'Current Count:',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Icon(Icons.add),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Icon(Icons.remove),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _dataController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan nama',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProfile(profile: profile),
                  ),
                );
              },
              child: const Text("Go to Detail Profile"),
            ),
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 12),
            FloatingActionButton(
              onPressed: _decrementCounter,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(height: 12),
            FloatingActionButton(
              onPressed: _resetCounter,
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
