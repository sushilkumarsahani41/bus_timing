import 'package:bus_timing/Pages/toCollege.dart';
import 'package:bus_timing/Pages/toHome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Way"),
      ),
      persistentFooterButtons: const [
        Text("Made by Onii-san with ❤️"),
      ],
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ToCollege()),
                  );
                },
                child: const Text(
                  "To College",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const toHome()),
                  );
                },
                child: const Text(
                  "To Home",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: ,
    );
  }
}
