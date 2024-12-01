import 'package:ariadesta/services/download_service.dart';
import 'package:ariadesta/services/theme_service.dart';
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
          leading: ResposiveLayout.isSmallScreen(context)
              ? Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                    );
                  },
                )
              : null,
          title: ListTile(
            leading: ImageIcon(
              const AssetImage('assets/logo/logo.png'),
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
            onTap: () => onTapToSection('hero'),
            title: const Text("ADP", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          elevation: 4,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              icon: ImageIcon(AssetImage((themeProvider.themeMode == ThemeMode.light)
                  ? 'assets/icons/ic_sun.png'
                  : 'assets/icons/ic_moon.png')),
              iconSize: 25,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        )
      : AppBar(
          leading: IconButton(
              icon: ImageIcon(
                const AssetImage(
                  'assets/logo/logo.png',
                ),
                size: 40,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => onTapToSection('hero')),
          title: const Text("ADP", style: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 4,
          actions: [
            navButton("About", "about"),
            navButton("Latest", "latest"),
            navButton("Experience", "experience"),
            navButton("Project", "project"),
            navButton("Contact", "contact"),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              icon: ImageIcon(AssetImage((themeProvider.themeMode == ThemeMode.light)
                  ? 'assets/icons/ic_sun.png'
                  : 'assets/icons/ic_moon.png')),
              iconSize: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Consumer<DownloadProvider>(builder: (context, download, child) {
              return FilledButton(
                  onPressed: download.isLoading
                      ? null
                      : () async {
                          await download.downloadCV(context);
                        },
                  child: download.isLoading ? const Text('Loading ... ') : const Text('Download CV'));
            }),
            const SizedBox(
              width: 30,
            ),
          ],
        );
}
