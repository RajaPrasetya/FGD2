import 'package:fgd_2/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: auth.nameC,
              decoration: InputDecoration(
                labelText: 'Display Name',
                hintText: 'Display Name...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: auth.emailC,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Email...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: auth.passwordC,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Password...',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                auth
                    .registerUser(
                  auth.emailC.text,
                  auth.passwordC.text,
                  auth.nameC.text,
                )
                    .then(
                  (value) {
                    if (value) {
                      //clear text field
                      auth.emailC.clear();
                      auth.passwordC.clear();
                      auth.nameC.clear();
                      //pop screen
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                      //show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Register Successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      //show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Register Failed'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFBD8456),
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  )),
              child: Text(
                'Register',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
