import 'package:sofiacare/welcome_animation/sign/login.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController PasswordController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController ConfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              TextFormField(
                obscureText: true,
                controller: PasswordController,
                validator: (val) => val!.isEmpty ? 'Minimum 6 caractére' : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: ConfirmPassword,
                validator: (val) => val != PasswordController.text
                    ? 'Confirm password does not match'
                    : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Confirm Password',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black))),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  }
                },
                child: Text(
                  'Valider',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 107, 33, 243)),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
