import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  // Função para verificar se o onboarding já foi feito
  Future<bool> _isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }

  // Função para marcar o onboarding como completo
  Future<void> _setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  void _onIntroEnd(BuildContext context) async {
    // Marca o onboarding como concluído
    await _setOnboardingCompleted();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isOnboardingCompleted(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Carregando a verificação do SharedPreferences
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Se o onboarding já foi completado, navega diretamente para o login
        if (snapshot.data == true) {
          Future.delayed(Duration.zero, () {
            Navigator.of(context).pushReplacementNamed('/login');
          });
          return Scaffold(); // Tela em branco enquanto faz a navegação
        }

        return Scaffold(
          body: IntroductionScreen(
            key: introKey,
            globalBackgroundColor: Colors.white,
            pages: [
              PageViewModel(
                title: "Geolocalização",
                body:
                    "Monitore e acompanhe a posição de dados em tempo real utilizando geolocalização. Precisão e controle na palma da sua mão.",
                image: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildImage('map.png', 120.0),
                ),
              ),
              PageViewModel(
                title: "Relatórios Inteligentes",
                body:
                    "Relatórios simplificados com coleta de dados fácil e prática, otimizando seu acompanhamento.",
                image: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildImage('caneta_tinteiro.png', 120.0),
                ),
              ),
              PageViewModel(
                title: "Gerenciamento de Dados",
                body:
                    "Organize, monitore e visualize seus dados de forma eficiente e prática. Soluções inteligentes ao seu alcance.",
                image: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildImage('gestao_dados.png', 120.0),
                ),
              ),
            ],
            onDone: () => _onIntroEnd(context),
            onSkip: () => _onIntroEnd(context),
            showSkipButton: true,
            skip: const Text(
              'Voltar',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            next: const Icon(Icons.arrow_forward),
            done: const Text(
              'Próximo',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            dotsContainerDecorator: const ShapeDecoration(
              color: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
            ),
          ),
        );
      },
    );
  }
}
