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
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: 'hero-rectangle',
                  child: Image.asset(planet.heroImagePath)),
              const SizedBox(height: 25),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(planet.n.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  // if(planet.o == 3) ?{
                  //   Text("Meissa, a planet teeming with insect-like aliens known as the Cyborgs, poses a relentless threat to Helldivers with its extreme environments and relentless enemies. Despite its unforgiving nature, Meissa holds valuable resources, making it a strategic target for the planet's liberation."),
                  // },
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: planet.o == 3
                            ? Text(planet.n! +
                                ", a planet teeming with insect-like aliens known as the Cyborgs, poses a relentless threat to Helldivers with its extreme environments and relentless enemies. Despite its unforgiving nature, Meissa holds valuable resources, making it a strategic target for the planet's liberation.")
                            : Text(planet.n! +
                                "Gatria is a hostile planet from Helldivers 2, plagued by an alien horde and riddled with treacherous terrain, making it a formidable challenge for any invading force. Despite its unforgiving nature, Meissa holds valuable resources, making it a strategic target for the planet's liberation."),
                      )
                    ],
                  ),
                  Text("Player Count: " + planet.p.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
              const SizedBox(height: 25),
              const Divider(),

              // Pie Chart
              pieChart(liberation, nonliberation),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProjectPage(folderName: 'This'),
                      ),
                    );
                  },
                  child: Text(planet.n.toString()))
            ],
          ),
        ]));
  }

  Container pieChart(double liberation, double nonliberation) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 200,
        height: 200,
        child: PieChart(
          // Adds the PieChart Data
          PieChartData(
            sections: [
              // Liberated
              PieChartSectionData(
                value: liberation,
                color: Color.fromARGB(255, 125, 209, 230),
                radius: 100,
              ),
              // Non-liberated
              PieChartSectionData(
                value: nonliberation,
                color: planet.boxColor,
                radius: 100,
              ),
            ],
          ),
        ),
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
