import 'package:ariadesta/shared/theme.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget customAppBar(BuildContext context, {required Function(String) onTapToSection}) {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  Widget navButton(String label, String section) {
    return TextButton(
        onPressed: () => onTapToSection(section),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ));
  }

  return ResposiveLayout.isSmallScreen(context)
      ? AppBar(
          title: TextButton(
              onPressed: () => onTapToSection('hero'),
              child: const Text("ADP", style: TextStyle(fontWeight: FontWeight.bold))),
          elevation: 4,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              icon: ImageIcon(
                  AssetImage((themeProvider.themeMode == ThemeMode.light) ? 'icons/ic_sun.png' : 'icons/ic_moon.png')),
              iconSize: 25,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        )
      : AppBar(
          title: TextButton(
              onPressed: () => onTapToSection('hero'),
              child: const Text("ADP", style: TextStyle(fontWeight: FontWeight.bold))),
          elevation: 4,
          actions: [
            navButton("About", "about"),
            navButton("Latest", "latest"),
            navButton("Experience", "experience"),
            navButton("Contact", "contact"),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              icon: ImageIcon(
                  AssetImage((themeProvider.themeMode == ThemeMode.light) ? 'icons/ic_sun.png' : 'icons/ic_moon.png')),
              iconSize: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            FilledButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                child: const Text('Download CV')),
            const SizedBox(
              width: 30,
            ),
          ],
        );
}
