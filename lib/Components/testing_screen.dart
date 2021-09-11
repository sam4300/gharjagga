import 'package:flutter/material.dart';

class TestingScreen extends StatefulWidget {
  static const routeName = '/ testing_screen';

  const TestingScreen({Key? key}) : super(key: key);

  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoading = !isLoading;
                  });
                },
                child: Text('Show progress bar'),
              ),
            ),
          ),
          isLoading
              ? Center(
                child: Positioned(
                    top: 120,
                    child: Container(
                        height: 50,
                        width: 100,
                        child: CircularProgressIndicator()),
                  ),
              )
              : Center(child: Text("not loading"))
        ],
      ),
    );
  }
}
