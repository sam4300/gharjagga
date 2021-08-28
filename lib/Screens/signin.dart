import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Dashboard/tabscreen.dart';

class Signin extends StatefulWidget {
  static const routeName = '/signin-page';

  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = "";
  var _userPassword = "";
  var _userName = "";

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
    } else {}
  }

  bool isHiddenPassword = true;

  void togglePassword() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  } //to show or disable visibility icon

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),

                Text(
                  _isLogin ? ' Signin to GharJagga' : 'Signup for GharJagga',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 43.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ), //Title
                SizedBox(
                  height: size.height * 0.07,
                ),
                if (!_isLogin)
                  Center(
                    child: Container(
                      width: size.width * 0.8,
                      child: TextFormField(
                        key: ValueKey("username"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "*required";
                          }
                        },
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 3.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 3.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 3.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.blue),
                          hintText: 'Enter Username',
                          hintStyle: TextStyle(color: Colors.blue),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.8,
                    child: TextFormField(
                      key: ValueKey("email"),
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "*required";
                        } else if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return "Enter valid email";
                        }
                      },
                      decoration: InputDecoration(
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: 'Enter email address',
                        hintStyle: TextStyle(color: Colors.blue),
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.blue,
                        ),
                      ),
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                  ),
                ), //Email field
                SizedBox(
                  height: size.height * 0.04,
                ),
                Center(
                  child: Container(
                    width: size.width * 0.8,
                    child: TextFormField(
                      key: ValueKey("password"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '*required';
                        } else if (value.length < 8) {
                          return "*password must be more than 8 characters";
                        }
                        return null;
                      },
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 3.0),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.blue),
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(color: Colors.blue),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: InkWell(
                          onTap: togglePassword,
                          child: isHiddenPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),
                      onSaved: (value) {
                        _userPassword = value!;
                      },
                    ),
                  ), //insertion of password field
                ),
                SizedBox(
                  height: size.height * 0.04,
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
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Signin' : 'Signup')),
                ), //Insertion of login button
                SizedBox(
                  height: size.height * 0.02,
                ),
                //to show don't have an account
                _isLogin
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don’t have an Account ? ",
                            style: TextStyle(color: Colors.blue),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have an account ? ",
                            style: TextStyle(color: Colors.blue),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'or Continue with',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.4)),
                      height: 50,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Signin();
                              }),
                            );
                          },
                          child:
                              Image.asset('assets/icons/google-logo-9824.png')),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.4)),
                      height: 50,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Signin();
                              }),
                            );
                          },
                          child:
                              Image.asset('assets/icons/PngItem_3579914.png')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
