import 'package:ariadesta/shared/shared_value.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/material.dart';

class SectionAbout extends StatelessWidget {
  const SectionAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final getH = screenSize.height;
    final getW = screenSize.width;
    return ResposiveLayout.isSmallScreen(context)
        ? Column(children: [
            SizedBox(
              height: getH * 0.03,
            ),
            Text(
              'About Me',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Container(
                padding: EdgeInsets.all(getW * 0.03),
                margin: EdgeInsets.symmetric(vertical: getH * 0.02, horizontal: getW * 0.02),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
                      spreadRadius: 0.1,
                      blurRadius: 10,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: const Text(
                  aboutMe,
                ))
          ])
        : Column(
            children: [
              SizedBox(
                height: getH * 0.025,
              ),
              Text(
                'About Me',
                style:
                    Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Container(
                padding: EdgeInsets.all(getW * 0.01),
                margin: EdgeInsets.symmetric(vertical: getH * 0.01, horizontal: getW * 0.05),
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
                    Container(
                      width: getW * 0.2,
                      padding: EdgeInsets.all(getW*0.02),
                      margin: EdgeInsets.all(getH*0.1),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/logo/logo.png',
                        fit: BoxFit.fitWidth,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                          child: Text(
                        aboutMe,
                      )),
                    ),
                    const SizedBox(
                      width: 50,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getH * 0.05,
              ),
            ],
          );
  }
}
