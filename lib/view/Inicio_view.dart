// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class InicioView extends StatelessWidget {
  const InicioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.school,
              size: 120,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            Text(
              'Quest Study',
              style: TextStyle(
                fontSize: 52,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                foregroundColor: Colors.black,
                minimumSize: Size(140, 60),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text(
                'Inicie Seus\nEstudos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,

                ),
              ),
            ),
          ],
        ),

    );
  }
}