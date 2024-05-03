import 'package:flutter/material.dart';

class HellDiverPlanets extends StatefulWidget {
  const HellDiverPlanets({super.key});

  @override
  State<HellDiverPlanets> createState() => _HellDiverPlanetsState();
}

class _HellDiverPlanetsState extends State<HellDiverPlanets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
