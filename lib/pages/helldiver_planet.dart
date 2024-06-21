import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helldiverstracker/models/helldiver_planet_model.dart';
import 'package:helldiverstracker/service/helldiver_service.dart';
import 'package:helldiverstracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HellDiverPlanet extends StatelessWidget {
  const HellDiverPlanet({super.key, required this.planet});

  // Planet Object
  final Planet planet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(planet.n.toString()),
            Text(planet.c.toString()),
          ],
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
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
              //color: const Color(0x000000),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // Toggles the Theme
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            //width: 37,
            child: SvgPicture.asset(
              'assets/icons/palette.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
                //color: const Color(0x000000),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
