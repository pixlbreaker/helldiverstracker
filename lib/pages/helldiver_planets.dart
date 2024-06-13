import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helldiverstracker/models/helldiver_planet_model.dart';
import 'package:helldiverstracker/service/helldiver_service.dart';
import 'package:helldiverstracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HellDiverPlanets extends StatefulWidget {
  const HellDiverPlanets({super.key});

  //final List<Mn> planets = [];

  @override
  State<HellDiverPlanets> createState() => _HellDiverPlanetsState();
}

class _HellDiverPlanetsState extends State<HellDiverPlanets> {
  // HellDivers Service and Data
  final _helldiverservice = HellDiverService();
  HellDiverData? _data;
  int totalPlayers = 0;

  // List of Planets
  List<Mn> planets = [];
  List<Mn> topPlanets = [];

  _fetchPlanets() async {
    // Helldivers Get Plantes from API
    final data = await _helldiverservice.getHelldiverData();

    if (!mounted) return;

    // Sets the data for the state
    setState(() {
      totalPlayers = 0;
      _data = data;
      planets = _data?.mn as List<Mn>;
      topPlanets = planets.sublist(0, 5);
      planets.forEach((element) {
        totalPlayers += element.p!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchPlanets();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ListView(
          children: [
            _planetsSection(),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 36, 90, 170),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Column _planetsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'All Planets',
            style: TextStyle(
              //color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 500,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                decoration: BoxDecoration(
                    color: planets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Image.asset(
                          planets[index].imagePath,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Column(
                          children: [
                            Text(
                              planets[index].n.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  //color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text('Player Count: ' + planets[index].p.toString(),
                                style: const TextStyle(
                                    //color: Color.fromARGB(255, 248, 237, 240),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400)),
                            Text(
                              'Liberation: ' +
                                      planets[index].l!.round().toString() +
                                      "%" ??
                                  '0.0' + '%',
                              style: const TextStyle(
                                  //color: Color.fromARGB(255, 244, 250, 255),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ]),
                    // Container(
                    //   height: 45,
                    //   width: 130,
                    //   child: Center(
                    //     child: Text(
                    //       'View',
                    //       style: TextStyle(
                    //           color: diets[index].viewIsSelected
                    //               ? Colors.white
                    //               : const Color(0xffC58BF2),
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 14),
                    //     ),
                    //   ),
                    //   decoration: BoxDecoration(
                    //       gradient: LinearGradient(colors: [
                    //         diets[index].viewIsSelected
                    //             ? const Color(0xff9DCEFF)
                    //             : Colors.transparent,
                    //         diets[index].viewIsSelected
                    //             ? const Color(0xff92A3FD)
                    //             : Colors.transparent
                    //       ]),
                    //       borderRadius: BorderRadius.circular(50)),
                    // )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
              height: 25,
            ),
            itemCount: planets.length,
            scrollDirection: Axis.vertical,
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          ),
        )
      ],
    );
  }

  AppBar appBar() {
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
          _fetchPlanets();
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
