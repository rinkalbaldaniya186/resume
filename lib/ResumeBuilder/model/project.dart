import 'package:flutter/material.dart';

class Project {
  int idpro;
  final String? pTitle;
  final String? pCompany;
  final String? pDuration;
  final String? pDescription;

  Project({
    required this.idpro,
    this.pTitle,
    this.pCompany,
    this.pDuration,
    this.pDescription,
  });

  Map<String, Object?> toMap() {
    return {
      'idpro' : idpro,
      'pTitle': pTitle,
      'pCompany': pCompany,
      'pDuration': pDuration,
      'pDescription': pDescription,
    };
  }
}
