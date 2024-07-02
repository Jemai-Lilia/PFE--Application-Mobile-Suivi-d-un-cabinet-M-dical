import 'package:flutter/material.dart';

//STINGS--------------
const baseURL = 'http://localhost:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutnURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const postsURL = baseURL + '/posts';
const commentsURL = baseURL + '/comments';

//ERRORS-----------
const serverError = 'Server error';
const unauthorized = 'unauthorized';
const somethingWentWrong = 'Something Went Wrong, try again';

//---Input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1, color: Colors.green)));
}

//---Button

TextButton kTextButton(
    String label, Function onPressed, Null Function() param2) {
  return TextButton(
    onPressed: () => onPressed(),
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 101, 36, 207)),
      padding: MaterialStateProperty.resolveWith(
        (states) => EdgeInsets.symmetric(vertical: 10),
      ),
    ),
  );
}

//Login Inscription
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        child: Text(
          label,
          style: TextStyle(color: Color.fromARGB(255, 101, 36, 207), fontWeight: FontWeight.bold),
        ),
        onTap: () => onTap(),
      ),
    ],
  );
}
