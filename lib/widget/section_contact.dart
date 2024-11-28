import 'package:ariadesta/shared/shared_method.dart';
import 'package:ariadesta/shared/shared_value.dart';
import 'package:flutter/material.dart';

class SectionContact extends StatelessWidget {
  const SectionContact({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getH = size.height;
    final getW = size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical:  getW * 0.02,horizontal: getW * 0.03),
      margin: EdgeInsets.symmetric(vertical: getH * 0.14, horizontal: getW * 0.03),
      width: getW * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 10,
            offset: const Offset(2, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getW * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Contact Us\n",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Let's talk about your project\n",
                  style:
                      Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text("ariadestaprabu@gmail.com",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900)),
                Text("+62 812-2512-1659", style: Theme.of(context).textTheme.titleMedium),
                Text("Bondowoso, East Java, Indonesia\n", style: Theme.of(context).textTheme.titleMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconLaunchUrl(github, 'icons/ic_github.png', context),
                    iconLaunchUrl(linkedin, 'icons/ic_linkedin.png', context),
                    iconLaunchUrl(instagram, 'icons/ic_instagram.png', context),
                    iconLaunchUrl(whatsapp, 'icons/ic_whatsapp.png', context),
                    iconLaunchUrl(telegram, 'icons/ic_telegram.png', context),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SizedBox(
              width: getW * 0.3,
              child: Column(
                children: [
                  Text(
                    "Contact Form",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Your Mail',
                        fillColor: Theme.of(context).hintColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), gapPadding: 10.0),
                        hintText: 'How I Can Help You',
                        fillColor: Theme.of(context).hintColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: TextField(
                      maxLines: null,
                      minLines: 8,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), gapPadding: 10.0),
                          hintText: 'Message',
                          fillColor: Theme.of(context).hintColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(fixedSize: Size(getW, 40), padding: const EdgeInsets.all(10)),
                      child: Text(
                        'Send Message',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      )),
                ],
              ))
        ],
      ),
    );
  }

  Widget iconLaunchUrl(
    String label,
    String urlIcon,
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () async {
        await launchURL(label);
      },
      icon: ImageIcon(
        AssetImage(urlIcon),
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
