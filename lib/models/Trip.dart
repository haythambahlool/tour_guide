import 'package:flutter/material.dart';

enum Season {
  Winter,
  Summer,
  Spring,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final String title;
  final String id;
  final String imageUrl;
  final List<String> categories;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final bool isInWinter;
  final bool isInSummer;
  final bool isForFamilies;
  final Season season;
  final TripType tripType;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.tripType,
    required this.season,
    required this.imageUrl,
    required this.duration,
    required this.activities,
    required this.program,
    required this.isInSummer,
    required this.isForFamilies,
    required this.isInWinter,
  });
}
