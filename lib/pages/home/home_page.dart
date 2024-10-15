import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/theme_color.dart';
import '../../widgets/custom_codigo_field.dart';
import '../../widgets/custom_password_field.dart';
import '../../widgets/custom_user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Column(
          children: [
            const CustomUserCard(),
            Expanded( // Wrap Column with Expanded
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white,
                  child: const Text('Home'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    super.dispose();
  }
}
