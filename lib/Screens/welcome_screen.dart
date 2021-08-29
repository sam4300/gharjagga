import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Screens/auth_screen.dart';
import 'package:ghaarjaggaa/Widgets/auth/signin_signup_form.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.1),
                  width: size.width * 0.7,
                  height: size.height * 0.33,
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              " Welcome To GharJagga",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              height: size.height * 0.06,
              width: size.width * 0.79,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.blue[900],
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AuthScreen.routeName);
                },
                child: Text(
                  "GetStarted",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
