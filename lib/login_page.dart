import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureState = true;
  final _emailController =
      TextEditingController(); // Use () to initialize TextEditingController
  final _passwordController =
      TextEditingController(); // Use () to initialize TextEditingController

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //check validity
  void _isValid() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
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
    }
    return;
  }

//obscurestate change
  void _obscureState() {
    setState(() {
      obscureState = !obscureState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assests/images/login.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            //text
            Container(
              padding: EdgeInsets.only(top: 178, left: 30),
              child: const Text(
                "Welcome\nLogin",
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
                  top: MediaQuery.of(context).size.height * 0.5,
                  left: 40,
                  right: 40,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
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
                      height: 25,
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: obscureState,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            _obscureState();
                          },
                          icon: const Icon(Icons.remove_red_eye_outlined),
                        ),
                        prefixIcon: const Icon(Icons.password),
                        labelText: "Password",
                        fillColor: const Color.fromARGB(255, 244, 236, 236),
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 201, 107, 107),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton.icon(
                      onPressed: _isValid,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 209, 162, 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.login_sharp),
                      label: const Text("Login"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 209, 162, 10),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 209, 162, 10),
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
