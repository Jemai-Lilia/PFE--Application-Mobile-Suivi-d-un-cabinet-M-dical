import 'package:sofiacare/welcome_animation/sign/reser_pas/verif._pass.dart';
import 'package:flutter/material.dart';

class MdpOublie extends StatefulWidget {
  const MdpOublie({super.key});

  @override
  State<MdpOublie> createState() => _MdpOublieState();
}

class _MdpOublieState extends State<MdpOublie> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 36, 207),
        title: Text('Récupérer votre compte'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
            key: formkey,
            child: ListView(
              padding: EdgeInsets.all(32),
              children: [
                Text(
                  'Saisir votre Email',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                  validator: (val) =>
                      val!.isEmpty ? 'Invalid email adress' : null,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.green))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Verification()));
                    }
                  },
                  child: Text(
                    'Valider',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) =>Color.fromARGB(255, 101, 36, 207)),
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
