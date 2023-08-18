import 'package:flutter/material.dart';
import 'package:jaehub/services/search_fetch.dart';
import 'package:jaehub/util/bottom_nav.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.login),
        title: const Text("Login"),
      ),
      bottomNavigationBar: const BottomNav1(),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  alignment: Alignment.center,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  'Jers AC Gym Equipment Login',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              TextFormField(
                // controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // SearchFetch().getProduct('dry-sauna-infrared-steam-room-sauna-room-good-for-4-to-5-seaters-4');
                    SearchFetch().getProduct('sf-pro1-fc-full-cage');
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
