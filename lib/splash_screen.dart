import 'package:event_radar2/pages/schedule/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          .pushReplacement(MaterialPageRoute(builder: (_) => SchedulePage()));
    });
  }

  @override
  void dispose() {
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
            SizedBox(
              height: 10,
            ),
            Text(
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
