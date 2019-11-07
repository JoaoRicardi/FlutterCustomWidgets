import 'package:flutter/material.dart';

class PrimeiraTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Text('Primeira Tab'),
      ),
    );
  }
}
