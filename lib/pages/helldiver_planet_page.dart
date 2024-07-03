import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:helldiverstracker/models/helldiver_planet_model.dart';
import 'package:helldiverstracker/pages/testing.dart';
import 'package:helldiverstracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HellDiverPlanet extends StatelessWidget {
  const HellDiverPlanet({super.key, required this.planet});

  // Planet Object
  final Planet planet;

  @override
  Widget build(BuildContext context) {
    // Pie Chart Values
    double? liberation = planet.l?.toDouble();
    String? liberationString = liberation?.toStringAsFixed(2);
    liberation = double.parse(liberationString!);
    double? nonliberation = 100.0 - liberation;

    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(tag: 'hero-rectangle', child: Image.asset(planet.heroImagePath)),
          const SizedBox(height: 25),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(planet.n.toString(),
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Text(planet.c.toString()),
              Text(planet.p.toString()),
            ],
          ),
          const SizedBox(height: 25),

          // Pie Chart
          SizedBox(
            width: 200,
            height: 200,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                      value: liberation,
                      color: Color.fromARGB(255, 125, 209, 230),
                      radius: 100),
                  PieChartSectionData(
                      value: nonliberation,
                      color: planet.boxColor,
                      radius: 100),
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectPage(folderName: 'This'),
                  ),
                );
              },
              child: Text(planet.n.toString()))
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Helldivers 2 Tracker',
        style: TextStyle(
          //color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      toolbarHeight: 100,
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Toggles the Theme
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          child: IconButton(
            icon: const Icon(
              Icons.light_mode,
              size: 28,
            ),
            onPressed: () {
              // Toggles the Theme
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ),
      ],
    );
  }
}
