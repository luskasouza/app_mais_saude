import 'package:app_mais_saude/pages/consulta/consulta_page.dart';
import 'package:app_mais_saude/pages/inicio/inicio_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import '../agenda/agenda_page.dart';

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

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const InicioPage(),
    const ConsultaPage(),
    const AgendaPage(),  // Substitua por uma página válida, se necessário
  ];

  void _onItemTapped(int index) {
    // Garante que o setState só é chamado após o frame atual ser renderizado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _currentIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(), // Caso você tenha um BottomNav
    );
  }
}
