import 'dart:async';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/material.dart';

class SectionMyLatestApp extends StatefulWidget {
  const SectionMyLatestApp({super.key});

  @override
  State<SectionMyLatestApp> createState() => _SectionMyLatestAppState();
}

class _SectionMyLatestAppState extends State<SectionMyLatestApp> {
  final ScrollController _scrollControllerMyLatestApp = ScrollController();

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 2), () {
      if (_scrollControllerMyLatestApp.hasClients) {
        double maxScrollExtent = _scrollControllerMyLatestApp.position.maxScrollExtent;
        _scrollControllerMyLatestApp
            .animateTo(
          maxScrollExtent,
          duration: const Duration(seconds: 100),
          curve: Curves.linear,
        )
            .then((_) {
          _scrollControllerMyLatestApp.jumpTo(0);
          _startAutoScroll();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getH = size.height;
    final getW = size.width;
    return ResposiveLayout.isSmallScreen(context) ? smallScreen(getH, getW) : largeScreen(getH, getW);
  }

  Widget smallScreen(double getH, getW) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getH * 0.03, horizontal: getW * 0.03),
      width: getW,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'My Latest App',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: getH * 0.4,
            width: getW * 0.7,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/img_bgapp.png'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.high,
            )),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.shadow,
                    Colors.transparent,
                    Colors.transparent,
                    Theme.of(context).colorScheme.shadow
                  ],
                  stops: const [0.0, 0.1, 0.9, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstOut,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                controller: _scrollControllerMyLatestApp,
                child: Row(
                    children: List.generate(
                        60,
                        (index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                'img_cuan/img_cuan${(index < 30) ? index + 1 : index - 29}.png',
                                height: getH * 0.4,
                                fit: BoxFit.fitHeight,
                              ),
                            ))),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.secondary),
                  child: Text(
                    'Cuan App',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cuanDesc,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Source Code:', style: Theme.of(context).textTheme.bodyMedium),
                Column(
                  children: [
                    featureText('Front-End : Flutter'),
                    featureText('Backe-end : Laravel'),
                  ],
                ),
                Text('Skills:', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget largeScreen(double getH, getW) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getH * 0.05),
      width: getW,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'My Latest App',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(
            height: 19,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: getW * 0.4,
                height: getH * 0.7,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/img_bgapp.png'),
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                )),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.shadow,
                        Colors.transparent,
                        Colors.transparent,
                        Theme.of(context).colorScheme.shadow
                      ],
                      stops: const [0.0, 0.1, 0.9, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstOut,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _scrollControllerMyLatestApp,
                    child: Row(
                        children: List.generate(
                            60,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'img_cuan/img_cuan${(index < 30) ? index + 1 : index - 29}.png',
                                    height: getW * 0.3,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ))),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: getW * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.secondary),
                      child: Text(
                        'Cuan App',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(cuanDesc),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Source Code:', style: Theme.of(context).textTheme.bodyMedium),
                    Column(
                      children: [
                        featureText('Front-End : Flutter'),
                        featureText('Backe-end : Laravel'),
                      ],
                    ),
                    Text('Skills:', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget featureText(String text) {
    return Row(
      children: [
        Text(
          '•',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget linearSolid(double num) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: num),
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation(
          Theme.of(context).dividerColor,
        ),
        value: 1,
        minHeight: 2,
      ),
    );
  }

  @override
  void dispose() {
    _scrollControllerMyLatestApp.dispose();
    super.dispose();
  }

  String cuanDesc =
      """Cuan is a digital wallet application that offers various financial services, including electronic payments, money transfers, mobile top-ups, bill payments, and QRIS transactions for offline needs. Designed to simplify financial activities, Cuan ensures secure transactions through advanced encryption technology.""";
}
