import 'package:flutter/material.dart';
import 'package:has_internet/check_internet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasInternet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tips'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              hasInternet == true ? 'ئینتەرنێت هەیە' : 'ئینتەرنێت نیە',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: hasInternet ? Colors.green[700] : Colors.red[700]),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {
                if (mounted) {
                  checkInternet().then((value) {
                    hasInternet = value;
                    setState(() {});
                  });
                }
              },
              child: const Text(
                'بپشكنە',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
