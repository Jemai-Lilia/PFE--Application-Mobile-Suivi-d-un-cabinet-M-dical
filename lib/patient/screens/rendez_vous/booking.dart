import 'package:flutter/material.dart';

import '../../../widgets/buttons/app_bar.dart';
import '../widgets/buttons/button_login.dart';
import 'date_time_picker.dart';


class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
          const  AppBarTop(textTop: "Votre meilleur docteur"),
         const SizedBox(height: 100),
            Padding(
                  padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
              child: ButtonLogin(onTap: (){  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DateTimePicker(),
                          ),
                        );}, text: "Prenez un Rendez-vous"),
            ),
          ],
        ),
      ),
    );
  }
}