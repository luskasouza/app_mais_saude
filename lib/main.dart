import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'pages/agenda/agenda_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/consulta/consulta_page.dart';
import 'pages/home/home_page.dart';
import 'utils/permission.dart';
import 'utils/theme.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  NotificationPermission notificationPermission = NotificationPermission();

  bool isGranted = await notificationPermission.checkNotificationPermission();

  if (!isGranted) {
    bool requestGranted = await notificationPermission.requestNotificationPermission();
    if (requestGranted) {
      print("Permissão de notificação concedida!");
    } else {
      print("Permissão de notificação negada.");
    }
  } else {
    print("Permissão de notificação já concedida.");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String appName = dotenv.env['APP_NAME'] ?? 'URL não definida';

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(title: appName),
        '/home': (context) => const HomePage(),
        '/consulta': (context) => const ConsultaPage(),
        '/agenda': (context) => const AgendaPage(),
      },
    );
  }
}
