import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Trouver un Médecin',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
