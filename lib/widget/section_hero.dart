import 'package:ariadesta/services/download_service.dart';
import 'package:ariadesta/shared/shared_value.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectionHero extends StatelessWidget {
  const SectionHero({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final getH = screenSize.height;
    final getW = screenSize.width;
    return ResposiveLayout.isSmallScreen(context)
        ? Container(
            margin: EdgeInsets.symmetric(
              vertical: getH * 0.05,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                  spreadRadius: 0.1,
                  blurRadius: 10,
                  offset: const Offset(2, 10),
                ),
              ],
            ),
            child: SizedBox(
              height: getH * 0.55,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    left: 40,
                    top: 70,
                    child: Consumer<DownloadProvider>(builder: (context, download, child) {
                      return FilledButton(
                          onPressed: download.isLoading ? null : () async {
                            await download.downloadCV(context);
                          } ,
                          child: download.isLoading ? const Text('Loading ... ') : const Text('Download CV'));
                    }),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/img_profile.png',
                        width: getW * 0.4,
                        height: getH * 0.5,
                        alignment: Alignment.topLeft,
                        // opacity: const AlwaysStoppedAnimation(0.2),
                        fit: BoxFit.cover,
                      )),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HI, I'm \nAria Desta ${'👋'}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Theme.of(context).colorScheme.primary),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            description,
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).colorScheme.primary,
                            ),
                            value: 0.1,
                            minHeight: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.all(getW * 0.01),
            margin: EdgeInsets.symmetric(vertical: getH * 0.14, horizontal: getW * 0.03),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                  spreadRadius: 0.1,
                  blurRadius: 10,
                  offset: const Offset(20, 15),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: getW * 0.55,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HI, I'm Aria Desta ${'👋'}",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30, top: 10),
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).colorScheme.primary,
                        ),
                        value: 0.1,
                        minHeight: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                    height: getH * 0.6,
                    width: getH * 0.4,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/img_profile.png',
                        ),
                        alignment: Alignment.center,
                        fit: BoxFit.fitWidth,
                        // opacity: themeProvider.themeMode == ThemeMode.light ? 0.9 : 0.8,
                        filterQuality: FilterQuality.high,
                      ),
                    )),
              ],
            ),
          );
  }

  Widget iconLabel({required Icon icon, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        Text(label),
      ],
    );
  }
}
