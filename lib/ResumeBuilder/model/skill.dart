import 'package:flutter/material.dart';

  class Skill {
    int idsk;
    final String? skill;

  Skill({
    required this.idsk,
    this.skill,
  });



  Map<String, Object?> toMap() {
    return {
      'idsk' : idsk,
      'skill': skill,
    };
  }

}
