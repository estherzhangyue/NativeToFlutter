import 'package:flutter/material.dart';
import 'package:switcher/bridge.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SwitcherWidget(),
    );
  }
}

class SwitcherWidget extends StatefulWidget {
  const SwitcherWidget({super.key});

  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class ApiHandler implements FApi {
  final Function(String) callBack;

  ApiHandler(this.callBack);

  @override
  void currentState(String page) {
    callBack(page);
  }
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  var state = true;
  var pageValue = 'A';
  final _api = HApi();

  @override
  void initState() {
    super.initState();
    FApi.setup(ApiHandler(currentState));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _rootPage(pageValue),
    );
  }

  Widget _rootPage(String pageValue) {
    switch (pageValue) {
      case 'A':
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter Page A')),
          body: ListView(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: jumpToNativeB,
                  child: const Text('jump to Native'),
                ),
              ),
            ],
          ),
        );
      case 'B':
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter Page B')),
          body: ListView(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: jumpToNativeA,
                  child: const Text('jump to Native'),
                ),
              ),
            ],
          ),
        );
      default:
        return Scaffold(
          appBar: AppBar(title: const Text('Flutter Page A')),
          body: ListView(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: jumpToNativeB,
                  child: const Text('jump to Native'),
                ),
              ),
            ],
          ),
        );
    }
  }

  void currentState(String page) {
    setState(() {
      pageValue = page;
    });
  }

  void jumpToNativeA() {
    _sendRoute("NativeA");
  }


  void jumpToNativeB() {
    _sendRoute("NativeB");
  }

  void _sendRoute(String route) {
    _api.jumpToRoute(RouteEntry(destination: route));
  }
}
