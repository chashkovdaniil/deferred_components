import 'package:flutter/material.dart';
import 'package:test_package_1/test_package_1.dart' deferred as box;

class DeferredComponentPage extends StatefulWidget {
  const DeferredComponentPage({Key? key}) : super(key: key);

  @override
  State<DeferredComponentPage> createState() => _DeferredComponentPageState();
}

class _DeferredComponentPageState extends State<DeferredComponentPage> {
  late Future<void> _defferedBox;

  @override
  void initState() {
    _defferedBox = box.loadLibrary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deferred Component Page'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _defferedBox,
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
      ),
    );
  }
}
