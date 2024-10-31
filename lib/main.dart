import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Adicione a importação do pacote
import 'enum/mensagem_tipo_enum.dart';
import 'firebase_options.dart';
import 'pages/agenda/agenda_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/consulta/consulta_page.dart';
import 'pages/home/home_page.dart';
import 'utils/console_log.dart';
import 'utils/firebase_messaging.dart';
import 'utils/permission.dart';
import 'utils/permission_manager.dart';
import 'utils/theme.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Set system UI overlay settings
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  // Initialize permissions and Firebase Messaging
  await _initializePermissionsAndMessaging();

  runApp(const MyApp());
}

Future<void> _initializePermissionsAndMessaging() async {
  final notificationPermission = NotificationPermission();
  final permissionManager = PermissionManager();

  bool isNotificationGranted = await notificationPermission.checkNotificationPermission();
  if (!isNotificationGranted) {
    bool requestGranted = await notificationPermission.requestNotificationPermission();
    ConsoleLog.mensagem(
      titulo: "Permissão de Notificação",
      mensagem: requestGranted 
          ? "Permissão de notificação concedida!" 
          : "Permissão de notificação negada.",
      tipo: requestGranted ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
    );
  } else {
    ConsoleLog.mensagem(
      titulo: "Permissão de Notificação",
      mensagem: "Permissão de notificação já concedida.",
      tipo: MensagemTipo.INFORMACAO,
    );
  }

  bool hasPhonePermission = await permissionManager.checkPhoneStatePermission();
  bool hasLocationPermission = await permissionManager.checkLocationPermission();

  ConsoleLog.mensagem(
    titulo: "Permissão de Telefone",
    mensagem: hasPhonePermission 
        ? "Permissão de estado do telefone concedida." 
        : "Permissão de estado do telefone negada.",
    tipo: hasPhonePermission ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  ConsoleLog.mensagem(
    titulo: "Permissão de Localização",
    mensagem: hasLocationPermission 
        ? "Permissão de localização concedida." 
        : "Permissão de localização negada.",
    tipo: hasLocationPermission ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  bool isInternetAvailable = await permissionManager.checkInternetConnection();
  ConsoleLog.mensagem(
    titulo: "Conexão com a Internet",
    mensagem: isInternetAvailable 
        ? "Conexão com a internet está disponível." 
        : "Sem conexão com a internet.",
    tipo: isInternetAvailable ? MensagemTipo.SUCESSO : MensagemTipo.ERROR,
  );

  final myFirebaseMessaging = MyFirebaseMessaging();
  await myFirebaseMessaging.setupFirebaseMessaging();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String appName = dotenv.env['APP_NAME'] ?? 'App Name Not Defined';

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

 