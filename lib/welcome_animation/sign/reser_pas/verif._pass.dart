import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 36, 207),
        title: Text('Vérification Code'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Text(
              'Vérifier votre code',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Saisir le code que nous avons envoyer',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            //buildTimer(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    controller: codeController,
                    validator: (val) =>
                        val!.isEmpty ? 'Merci de saisir votre code' : null,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {}
                },
                child: Text(
                  'Valider',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 101, 36, 207)),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Verification()),
                    );
                  },
                  child: Text(
                    'Renvoyer le code',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  /*buildTimer() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        'Code va expire ',
        style: TextStyle(fontSize: 20),
      ),
      TweenAnimationBuilder(
        tween: Tween(begin: 30.0, end: 0),
        duration: Duration(seconds: 30),
        builder: (context, value, child) => Text(
          "00:${value.toString()}",
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        onEnd: () {},
      )
    ]);
  }
  */
}
