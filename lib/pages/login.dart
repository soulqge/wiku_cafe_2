import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/formbox.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController(); // buat nyimpen input username
    final TextEditingController passwordController = TextEditingController(); // buat nyimpen input password

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              Text(
                "Wikusama",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: Color.fromRGBO(45, 133, 255, 1),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 44),
              Formbox(
                hintForm: "Username :",
                controller: usernameController, 
              ), // custom components
              Formbox(
                hintForm: "Password :",
                controller: passwordController, 
                obscureText: true, 
              ),
              SizedBox(height: 44),
              Container(
                width: 132,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(45, 133, 255, 1),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    String username = usernameController.text;
                    String password = passwordController.text;
                    if (username == 'kasir' && password == '12345678') {
                      Navigator.pushNamed(context, '/home');
                    } if (username == 'admin' && password == '12345678') {
                      Navigator.pushNamed(context, '/home_admin');
                    }else if (username == 'manager' && password == '12345678') {
                      Navigator.pushNamed(context, '/home_manager');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid username or password'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }, // fungsi buat login dan hlaman yang dituju
                  child: Text("Login"),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
