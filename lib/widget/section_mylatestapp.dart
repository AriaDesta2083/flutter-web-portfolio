import 'dart:async';
import 'package:ariadesta/shared/shared_method.dart';
import 'package:ariadesta/shared/shared_value.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SectionMyLatestApp extends StatefulWidget {
  const SectionMyLatestApp({super.key});

  @override
  State<SectionMyLatestApp> createState() => _SectionMyLatestAppState();
}

class _SectionMyLatestAppState extends State<SectionMyLatestApp> {
  final ScrollController _scrollControllerMyLatestApp = ScrollController();
  bool _isMaxScroll = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_scrollControllerMyLatestApp.hasClients) {
        double maxScrollExtent = _scrollControllerMyLatestApp.position.maxScrollExtent;
        double minScrollExtent = _scrollControllerMyLatestApp.position.minScrollExtent;
        double targetScrollPosition = _isMaxScroll ? minScrollExtent : maxScrollExtent;

        _scrollControllerMyLatestApp
            .animateTo(
          targetScrollPosition,
          duration: const Duration(seconds: 80),
          curve: Curves.linear,
        )
            .then((_) {
          _isMaxScroll = !_isMaxScroll;
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
                        30,
                        (index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                'img_cuan/img_cuan${index + 1}.png',
                                height: getH * 0.4,
                                fit: BoxFit.fitHeight,
                              ),
                            ))),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: descCuanItems(),
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
                            30,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'img_cuan/img_cuan${index + 1}.png',
                                    height: getW * 0.3,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ))),
                  ),
                ),
              ),
              Container(padding: const EdgeInsets.all(10), width: getW * 0.4, child: descCuanItems()),
            ],
          ),
        ],
      ),
    );
  }

  Widget descCuanItems() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.secondary),
              child: Text(
                'CUAN',
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
            const Text(
              'Oct 2024 ~ Present',
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(cuanDesc),
        const SizedBox(
          height: 10,
        ),
        Text(cuanTechDesc),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Text('Technology used :',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 10,
            spacing: 10,
            children: [
              featureText('Frontend', 'Flutter', cuanFlutterGithub),
              featureText('Backend', 'Laravel', cuanLaravelGithub),
              featureText('API Documentation', 'Postman Collection', cuanPostman),
              featureText('Database', 'MySql', 'https://www.mysql.com/'),
              featureText('Payment Gateway', 'Midtrans', 'https://midtrans.com/'),
              featureText('Video Demo Apps', 'ariadestap.dev', instagram)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget featureText(String label, String value, String linkUrl) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '•',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(width: 3),
        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const TextSpan(
                text: ' : ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: value,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await iconLaunchURL(linkUrl);
                  },
              ),
            ],
          ),
        )
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

}
