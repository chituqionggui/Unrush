import 'package:flutter/material.dart';

class ToolkitPlaceholder extends StatelessWidget {
  final String type;
  const ToolkitPlaceholder({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Toolkit: $type')),
      body: Center(
        child: Text('Placeholder for toolkit "$type"'),
      ),
    );
  }
}

