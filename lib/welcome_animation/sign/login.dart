import 'package:shared_preferences/shared_preferences.dart';
import 'package:sofiacare/constant.dart';
// ignore: unused_import
import 'package:sofiacare/patient/screens/home_screen.dart';
import 'package:sofiacare/welcome_animation/sign/reser_pas/mdp_oubli%C3%A9.dart';
import 'package:sofiacare/welcome_animation/sign/register.dart';

import 'package:flutter/material.dart';

// ignore: unused_import
import '../../model/api_response.dart';
import '../../model/user.dart';
// ignore: unused_import
import '../../services/user_service.dart';
//import 'package:flutter/widgets.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool loading = false;

  


  // ignore: unused_element
  void _saveAndRedirectToHome(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 36, 207),
        title: Text('Bienvenue à sofiacare'),
        centerTitle: true,
      ),
      body: Form(
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
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
                        borderSide: BorderSide(width: 1, color: Colors.green))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: txtPassword,
                validator: (val) =>
                    val!.length < 6 ? 'Minimum 6 caractére' : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black))),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MdpOublie()),
                      );
                    },
                    child: Text(
                      'Mot de passe oublié',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 36, 207),
                      ),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            //loading = true;
                           // _loginUser();
                          });
                        }
                      },
                      child: Text(
                        'Valider',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color.fromARGB(255, 101, 36, 207),
                        ),
                        padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              kLoginRegisterHint("je n'ai pas un compte?", 'Inscription', () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Register()),
                    (route) => true);
              }),
              SizedBox(
                height: 100,
              ),
              Positioned(
                  child: Column(
                children: [
                  Text(
                    '--------Ou connecter avec--------',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OutlinedButton.icon(
                    icon: Image(
                      image: AssetImage('assets/images/googlee.png'),
                      width: 20.0,
                    ),
                    onPressed: () {},
                    label: Text(
                      'Connecter avec Google',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  OutlinedButton.icon(
                    icon: Image(
                      image: AssetImage('assets/images/facebookk.png'),
                      width: 20.0,
                    ),
                    onPressed: () {},
                    label: Text(
                      'Connecter avec facebook',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
