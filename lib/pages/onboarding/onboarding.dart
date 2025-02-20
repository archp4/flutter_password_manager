import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pwd_mng/helpers/preference_helper.dart';
import 'package:pwd_mng/helpers/settings.dart';
import 'package:pwd_mng/pages/splash/auth.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome To LockIt",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: context.watch<AppSettings>().isDark
                    ? const Color(0xff2f3033)
                    : Colors.grey,
              ),
              child: Image.asset(
                "assets/images/on_boarding.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Securely store and access all your passwords in one place.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  PreferenceHelper.setOnBoarding(true);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const AuthHome(),
                    ),
                  );
                },
                child: const Text("Get Started Now !!"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
