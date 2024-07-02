import 'package:flutter/material.dart';

import '../../../widgets/buttons/app_bar.dart';


class Validate extends StatelessWidget {
  const Validate({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Column(
          children: const[
            AppBarTop(textTop: "Rendez-vous"),
            SizedBox(height: 50),
            Text("Votre Rendez-vous est confirmé", style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold,),),
             SizedBox(height: 20),
             Text("Merci de choisir notre service",style: TextStyle(color: Colors.grey,fontSize: 15,),),
      
          ],
        ),
      ),
    );
  }
}