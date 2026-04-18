import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.storefront,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
              filled: true,
              prefixIcon: Icon(Icons.person, color: Colors.black, size: 20),
            ),
          ),

          const SizedBox(height: 20),

          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              prefixIcon: Icon(Icons.lock, color: Colors.black, size: 20),
              suffixIcon: Icon(
                Icons.visibility_off,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 171, 247, 166),
                    ),
                    child: const Text('Login'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 240, 129, 129),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Text(
        'Copyright © 2026 x. All rights reserved.',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}
