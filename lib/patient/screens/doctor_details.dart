import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sofiacare/welcome_animation/components/custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key, required Map<String, dynamic> doctor, required bool isFav}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Les Détails du médecin",
        icon: const FaIcon(Icons.arrow_back_ios),
      ),
    );
  }
}
