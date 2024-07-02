import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
// ignore: duplicate_import
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sofiacare/patient/screens/rendez_vous/date_time_picker.dart';
import 'colors.dart';

class AppointScreen extends StatelessWidget {
  const AppointScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFD9E4EE),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/doctor1.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      pColor.withOpacity(0.9),
                      pColor.withOpacity(0),
                      pColor.withOpacity(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        left: 10,
                        right: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F8FF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: sdColor,
                                    blurRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: pColor,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F8FF),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: sdColor,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.favorite_outline,
                                color: pColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Patients",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: wColor,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "1.8K",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: wColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Experience",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: wColor,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "10 Ans",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: wColor,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Rating",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: wColor,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "4.9",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: wColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Text(
                    "Dr Labidi",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: pColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        MdiIcons.heartPlus,
                        color: Colors.red,
                        size: 28,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "cardiologue",
                        style: TextStyle(
                          fontSize: 17,
                          color: bColor.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  
                                SizedBox(height: 20),
Material(
  color: pColor,
  borderRadius: BorderRadius.circular(10),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DateTimePicker(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      // ignore: deprecated_member_use
      foregroundColor: wColor, primary: pColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      minimumSize: Size(MediaQuery.of(context).size.width, 60),
    ),
    child: Text(
      "Prenez un Rendez-vous",
      style: TextStyle(
        color: wColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
                                
                              ],
                            ),
                          ),],),),
                          );
                          
                        
                      }
                  
              
                
       
    

  }
  

                        
