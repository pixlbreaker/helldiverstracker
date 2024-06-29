import 'package:flutter/material.dart';

class HellDiverData {
  int? lastUpdate;
  List<Planet>? mn;
  Mo? mo;

  HellDiverData({this.lastUpdate, this.mn, this.mo});

  HellDiverData.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['lastUpdate'];
    if (json['mn'] != null) {
      mn = <Planet>[];
      json['mn'].forEach((v) {
        mn!.add(new Planet.fromJson(v));
      });
    }
    mo = json['mo'] != null ? new Mo.fromJson(json['mo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastUpdate'] = this.lastUpdate;
    if (this.mn != null) {
      data['mn'] = this.mn!.map((v) => v.toJson()).toList();
    }
    if (this.mo != null) {
      data['mo'] = this.mo!.toJson();
    }
    return data;
  }
}

class Planet {
  // Name
  String? n;
  int? o;
  double? rps;
  int? p;
  double? l;
  int? s;
  int? e;
  double? r;
  int? c;
  int? ct;

  // Background Color for the Planet
  Color boxColor = Color(0xffC58BF2);

  // Image Path
  String imagePath = "";
  String heroImagePath = "";

  Planet(
      {this.n,
      this.o,
      this.rps,
      this.p,
      this.l,
      this.s,
      this.e,
      this.r,
      this.c,
      this.ct});

  Planet.fromJson(Map<String, dynamic> json) {
    n = json['n'];
    o = json['o'];
    rps = json['rps'].toDouble();
    p = json['p'];
    l = json['l'].toDouble();
    s = json['s'];
    e = json['e'];
    r = json['r'].toDouble();
    c = json['c'];
    ct = json['ct'];

    // If the planet is Terminid
    if (o == 2) {
      boxColor = Color.fromARGB(255, 211, 182, 102);
      imagePath = 'assets/icons/terminid.png';
      heroImagePath = 'assets/images/terminid.png';
    } else if (o == 3) {
      // Planet is Automaton
      boxColor = Color.fromARGB(255, 236, 113, 119);
      imagePath = 'assets/icons/automaton.png';
      heroImagePath = 'assets/images/automatons.jpg';
    } else {
      boxColor = Color.fromARGB(255, 125, 209, 230);
      imagePath = 'assets/icons/superearth.png';
      heroImagePath = 'assets/images/superearth.jpg';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['n'] = this.n;
    data['o'] = this.o;
    data['rps'] = this.rps;
    data['p'] = this.p;
    data['l'] = this.l;
    data['s'] = this.s;
    data['e'] = this.e;
    data['r'] = this.r;
    data['c'] = this.c;
    data['ct'] = this.ct;
    return data;
  }
}

class Mo {
  String? t;
  String? d;
  String? td;
  List<int>? p;
  List<int>? g;
  int? rt;
  int? ra;
  int? e;
  String? tt;
  List<String>? pl;

  Mo(
      {this.t,
      this.d,
      this.td,
      this.p,
      this.g,
      this.rt,
      this.ra,
      this.e,
      this.tt,
      this.pl});

  Mo.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    d = json['d'];
    td = json['td'];
    p = json['p'].cast<int>();
    g = json['g'].cast<int>();
    rt = json['rt'];
    ra = json['ra'];
    e = json['e'];
    tt = json['tt'];
    pl = json['pl'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['t'] = this.t;
    data['d'] = this.d;
    data['td'] = this.td;
    data['p'] = this.p;
    data['g'] = this.g;
    data['rt'] = this.rt;
    data['ra'] = this.ra;
    data['e'] = this.e;
    data['tt'] = this.tt;
    data['pl'] = this.pl;
    return data;
  }
}
