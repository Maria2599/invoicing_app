import 'package:flutter/material.dart';
import 'package:invoicing_app/modules/permissions.dart';
import 'package:invoicing_app/shared/constants.dart';

var formkey = GlobalKey<FormState>();
var email = TextEditingController();
var pass = TextEditingController();

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<Login> {
  var isHidden = false;

  ChangePassword() => setState(() => isHidden = !isHidden);

  // const Login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is Empty!";
                        }
                        if (!RegExp("^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z]")
                            .hasMatch(value)) {
                          return ('Enter a valid Email.. it must not include space or - or _ or / ');
                        }
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          size: 21,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is Empty!";
                        } else if (value.length != 8) {
                          return "Password must be 8 characters!";
                        }
                        if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                          return 'Enter a valid Password.. it must be characters only ';
                        }
                      },
                      controller: pass,
                      keyboardType: TextInputType.text,
                      obscureText: isHidden,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: IconButton(
                          icon: isHidden
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 21,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 21,
                                ),
                          onPressed: ChangePassword,
                        ),
                        prefixIcon: Icon(
                          Icons.password,
                          size: 21,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        emailConst = email.text;
                        passwordConst = pass.text;
                        if (formkey.currentState!.validate()) {
                          print(email.text);
                          print(pass.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Permissions()));
                        }
                      },
                      child: Text(
                        "      Login      ",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(200, 172, 23, 11)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
