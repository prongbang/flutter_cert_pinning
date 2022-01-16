import 'package:flutter/material.dart';
import 'package:flutter_cert_pinning/dio_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Certificate Pinning'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DioProvider _dioProvider = DioProvider();

  String _html = "";
  String _status = "";
  Color _color = Colors.white;

  @override
  void initState() {
    _processGetFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: _color,
              child: Text(_status),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(_html),
            ),
          ],
        ),
      ),
    );
  }

  void _processGetFeed() async {
    const baseUrl = 'https://prongbang.github.io';
    final dio = _dioProvider.getClient(baseUrl);
    try {
      final response =
          await dio.get('/flutter/2020/08/10/dart-null-aware-operators.html');
      setState(() {
        _html = response.data;
        _status = 'Connection is secure';
        _color = Colors.greenAccent;
      });
    } catch (e) {
      setState(() {
        _html = '';
        _status = 'Connection is not secure';
        _color = Colors.redAccent;
      });
    }
  }
}
