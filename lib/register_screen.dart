import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _nameControl = TextEditingController();
  final _emailControl = TextEditingController();
  final _passwordControl = TextEditingController();
  final _retypePasswordControl = TextEditingController();

  //dispose
  void dispose() {
    _nameControl.dispose();
    _emailControl.dispose();
    _passwordControl.dispose();
    _retypePasswordControl.dispose();
    super.dispose();
  }

  //check validity and check both passowrd same
  void _isValid() {
    if (_nameControl.text.isEmpty ||
        _emailControl.text.isEmpty ||
        _passwordControl.text.isEmpty ||
        _retypePasswordControl.text.isEmpty) {
      //show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please fill correct email or password"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    } else if (_passwordControl.text != _retypePasswordControl.text) {
      //show error message
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Password not match"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("Okay"),
            ),
          ],
        ),
      );
    }
    return;

    //navigate to login page
    Navigator.of(context).pushNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assests/images/register.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            //text
            Container(
              padding: EdgeInsets.only(top: 100, left: 30),
              child: const Text(
                "Register",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.26,
                  left: 40,
                  right: 40,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _nameControl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.man_2_outlined),
                        labelText: "username",
                        fillColor: Color.fromARGB(255, 244, 236, 236),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 201, 107, 107),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: _emailControl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                        fillColor: Color.fromARGB(255, 244, 236, 236),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 149, 36, 36),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: _passwordControl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: "Password",
                        fillColor: Color.fromARGB(255, 244, 236, 236),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 149, 36, 36),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    TextField(
                      controller: _retypePasswordControl,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        labelText: "Retype password",
                        fillColor: Color.fromARGB(255, 244, 236, 236),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 2, 12, 22),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Back to Login?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 254, 250),
                            fontSize: 15,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            _isValid();
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 49, 48, 43),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
