import 'package:flutter/material.dart';

class CustomLogoWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomLogoWidget({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 109,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFFF4F4F4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 36, // Adjust image width as needed
            height: 36, // Adjust image height as needed
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4E4E55),
            ),
          ),
        ],
      ),
    );
  }
}
