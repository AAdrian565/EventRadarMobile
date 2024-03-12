import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'authentication/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => AuthPage()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: <Color>[
            Color(0xff0022ba),
            Color(0xff0022ba),
            Color(0xff4f4cee),
            Color(0xff7f7df3)
          ],
          stops: <double>[0, 0, 0.531, 1],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/splash/logo_splash.png'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'EventRadar',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 36,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
