import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.color, // Default color is green
  }) : super(key: key);

  final Function()? onTap;
  final String text;
  final Color color; // Color parameter for the button

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 56,
        decoration: BoxDecoration(
          color: color, // Set background color
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/auth/google_icon.png'),
            SizedBox(
              width: 15,
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
