import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          appBar: AppBar(
            title: const Text('Main options'),
          ),
          body: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        ListTile(
          title: const Text('Select arquitecture option',
              style:
                  const TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic)),
        ),
        Divider(color: Colors.black),
        ListTile(
          title: Text('Standard Words', style: _biggerFont),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.of(context).pushNamed('/std'),
        ),
        ListTile(
          title: Text('BLoC Movies', style: _biggerFont),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => Navigator.of(context).pushNamed('/bloc'),
        ),
      ],
    );
  }
}
