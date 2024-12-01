import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/material.dart';

Widget customDrawer(BuildContext context, {required Function(String) onTapToSection}) {
  Widget navButton(String label, String section) {
    return ListTile(
        onTap: () {
          onTapToSection(section);
          Navigator.pop(context);
        },
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ));
  }

  return ResposiveLayout.isSmallScreen(context)
      ? Drawer(
          width: MediaQuery.of(context).size.width * 0.4,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12))),
                child: Image.asset('assets/logo/logo.png',
                    height: MediaQuery.of(context).size.height * 0.1,
                    fit: BoxFit.fitHeight,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              navButton("About", "about"),
              navButton("Latest", "latest"),
              navButton("Experience", "experience"),
              navButton("Project", "project"),
              navButton("Contact", "contact"),
            ],
          ),
        )
      : const SizedBox(
          height: 0.0,
        );
}
