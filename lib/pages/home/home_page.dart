import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/theme_color.dart';
import '../../widgets/custom_button_card.dart';
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
            Expanded(
              // Wrap GridView with Expanded
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: <Widget>[
                  CustomButtonCard(
                    color: ThemeColor.bgColor,
                    splashColor: ThemeColor.primary,
                    highlightColor: ThemeColor.primary,
                    borderRadius: 8.0,
                    onTap: () {
                      print('CustomButtonCard tapped');
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: ThemeColor.primary,
                          ),
                          Text("saúde", style: TextStyle(color: ThemeColor.primary),),
                        ],
                      ),
                    ),
                  ),
                  CustomButtonCard(
                    color: ThemeColor.bgColor,
                    splashColor: ThemeColor.primary,
                    highlightColor: ThemeColor.primary,
                    borderRadius: 8.0,
                    onTap: () {
                      print('CustomButtonCard tapped');
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: ThemeColor.primary,
                          ),
                          Text("saúde", style: TextStyle(color: ThemeColor.primary),),
                        ],
                      ),
                    ),
                  ),
                  CustomButtonCard(
                    color: ThemeColor.bgColor,
                    splashColor: ThemeColor.primary,
                    highlightColor: ThemeColor.primary,
                    borderRadius: 8.0,
                    onTap: () {
                      print('CustomButtonCard tapped');
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: ThemeColor.primary,
                          ),
                          Text("saúde", style: TextStyle(color: ThemeColor.primary),),
                        ],
                      ),
                    ),
                  ),
                  CustomButtonCard(
                    color: ThemeColor.bgColor,
                    splashColor: ThemeColor.primary,
                    highlightColor: ThemeColor.primary,
                    borderRadius: 8.0,
                    onTap: () {
                      print('CustomButtonCard tapped');
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: ThemeColor.primary,
                          ),
                          Text("saúde", style: TextStyle(color: ThemeColor.primary),),
                        ],
                      ),
                    ),
                  ),
                  CustomButtonCard(
                    color: ThemeColor.bgColor,
                    splashColor: ThemeColor.primary,
                    highlightColor: ThemeColor.primary,
                    borderRadius: 8.0,
                    onTap: () {
                      print('CustomButtonCard tapped');
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: ThemeColor.primary,
                          ),
                          Text("saúde", style: TextStyle(color: ThemeColor.primary),),
                        ],
                      ),
                    ),
                  ),
                  CustomButtonCard(
                    color: ThemeColor.bgColor,
                    splashColor: ThemeColor.primary,
                    highlightColor: ThemeColor.primary,
                    borderRadius: 8.0,
                    onTap: () {
                      print('CustomButtonCard tapped');
                    },
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vaccines,
                            color: ThemeColor.primary,
                          ),
                          Text("saúde", style: TextStyle(color: ThemeColor.primary),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
