import 'package:flutter/material.dart';
import 'kanban.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

const String invalidEmailOrPassword = "invalid email or password";

bool isVisible = false;
String? validateLogin(BuildContext context, String email, String password) {
  if (email == 'admin' && password == 'pass') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KanbanPage()),
    );
    return null;
  } else {
    return invalidEmailOrPassword;
  }
}

class _MyLoginPageState extends State<LoginPage> {
  bool invalidLogin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    invalidLogin = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 204, 255),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.storefront,
                            color: Colors.white,
                            size: 75,
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),

                      const SizedBox(height: 20),

                      TextField(
                        obscureText: isVisible,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: const OutlineInputBorder(),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      if (invalidLogin)
                        const Text(
                          'Invalid email or password',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                final result = validateLogin(
                                  context,
                                  emailController.text,
                                  passwordController.text,
                                );

                                setState(() {
                                  invalidLogin = result != null;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  2,
                                  188,
                                  250,
                                ),
                              ),
                              child: const Text('Login'),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                emailController.clear();
                                passwordController.clear();
                                isVisible = false;

                                setState(() {
                                  invalidLogin = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  0,
                                  183,
                                  255,
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'Copyright © 2026 x. All rights reserved.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
