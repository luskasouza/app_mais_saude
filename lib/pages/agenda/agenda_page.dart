import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/theme_color.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../../widgets/custom_button_card.dart';
import '../../widgets/custom_codigo_field.dart';
import '../../widgets/custom_password_field.dart';
import '../../widgets/custom_user_card.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Column(
          children: [
            CustomUserCard(),
            
          ],
        ),
      ),
       
    );
  }
}