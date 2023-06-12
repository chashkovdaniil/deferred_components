import 'package:flutter/material.dart';
import 'package:test_app/deferred_component_page.dart';
import 'package:test_package_1/test_package_1.dart' deferred as box;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Deferred Component'),
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
  late Future<void> _deferredBox;

  @override
  void initState() {
    _deferredBox = box.loadLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: _deferredBox,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  return box.RedBox();
                }
                return const CircularProgressIndicator();
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const DeferredComponentPage(),
                  ),
                );
              },
              child: const Text('Open page with deferred component'),
            ),
          ],
        ),
      ),
    );
  }
}
