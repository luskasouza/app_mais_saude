import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/login');
  }

   void _onSkip(BuildContext context) {
    print(introKey.currentState?.controller.initialPage);
    final currentPage = introKey.currentState?.controller.initialPage ?? 0;
    
    if (currentPage > 0) {
      introKey.currentState?.animateScroll(currentPage - 1);
    }
  }


  @override
  Widget build(BuildContext context) {
    print('introKey: ${introKey.currentState?.controller.initialPage}');
    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
         initialPage: 0,
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
            //decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Relatórios Inteligentes",
            body:
                "Relatórios simplificados com coleta de dados fácil e prática, otimizando seu acompanhamento.",
            image: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildImage('caneta_tinteiro.png', 120.0),
            ),
            //decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Gerenciamento de Dados",
            body:
                "Organize, monitore e visualize seus dados de forma eficiente e prática. Soluções inteligentes ao seu alcance.",
            image: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildImage('gestao_dados.png', 120.0),
            ),
            //decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        // onSkip: () => _onSkip(context),
        showSkipButton: false,
        // skip:
        //     const Text('Volta', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Próximo',
            style: TextStyle(fontWeight: FontWeight.w600)),
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
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
          ),
        ),
      ),
    );
  }
}
