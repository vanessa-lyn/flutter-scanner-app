import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Success'),
        ),
        body: const Center(
          child: Text(
            'Success Page',
            style: TextStyle(fontSize: 24),
          ),
        ),
    );
  }
}