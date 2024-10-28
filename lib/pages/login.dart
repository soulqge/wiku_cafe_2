import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/formbox.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 44),
              Formbox(hintForm: "User :"),
              Formbox(hintForm: "Password :"),
              SizedBox(height: 44),
              Container(
                width: 132,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(45, 133, 255, 1),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text("Login")),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
