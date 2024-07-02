import 'package:sofiacare/patient/screens/home_screen.dart';
import 'package:sofiacare/welcome_animation/sign/login.dart';
import 'package:sofiacare/services/user_service.dart';
import 'package:sofiacare/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/api_response.dart';
import '../../model/user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController EmailCntrl = TextEditingController(),
      // ignore: non_constant_identifier_names
      NomController = TextEditingController(),
      // ignore: non_constant_identifier_names
      PasswordController = TextEditingController(),
      // ignore: non_constant_identifier_names
      ConfirmPassword = TextEditingController();

  bool loading = false;
  void _registerUser() async {
    ApiResponse response = await register(
        NomController.text, EmailCntrl.text, PasswordController.text);
    if (response.error == null) {
      _saveAndRedirectToHome(response.data as User);
    } else {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

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
                controller: NomController,
                validator: (val) => val!.isEmpty ? 'Invalid username' : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'UserName',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: EmailCntrl,
                validator: (val) =>
                    val!.isEmpty ? 'Invalid email adress' : null,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
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
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          setState(() {
                            loading = !loading;
                            _registerUser();
                          });
                        }
                      },
                      child: Text(
                        'Valider',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Color.fromARGB(255, 101, 36, 207)),
                        padding: MaterialStateProperty.resolveWith(
                          (states) => EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              kLoginRegisterHint("Déja a un compte?", 'Connexion', () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false);
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
