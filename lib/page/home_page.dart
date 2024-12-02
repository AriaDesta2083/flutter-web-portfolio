import 'package:ariadesta/animation/animation.dart';
import 'package:ariadesta/services/state_provider.dart';
import 'package:ariadesta/shared/shared_value.dart';
import 'package:ariadesta/widget/section_about.dart';
import 'package:ariadesta/widget/section_contact.dart';
import 'package:ariadesta/widget/section_drawer.dart';
import 'package:ariadesta/widget/section_experience.dart';
import 'package:ariadesta/widget/section_footer.dart';
import 'package:ariadesta/widget/section_hero.dart';
import 'package:ariadesta/widget/section_mylatestapp.dart';
import 'package:ariadesta/widget/section_navbar.dart';
import 'package:ariadesta/widget/section_project.dart';
import 'package:ariadesta/widget/section_skill.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final sectionKeyHero = GlobalKey();
final sectionKeyAbout = GlobalKey();
final sectionKeyLatest = GlobalKey();
final sectionKeyExperience = GlobalKey();
final sectionKeyProject = GlobalKey();
final sectionKeyContact = GlobalKey();

final Map<String, GlobalKey> sectionKeys = {
  'hero': sectionKeyHero,
  'about': sectionKeyAbout,
  'latest': sectionKeyLatest,
  'experience': sectionKeyExperience,
  'project': sectionKeyProject,
  'contact': sectionKeyContact,
};

class _MyHomePageState extends State<MyHomePage> {
  void scrollToSection(String section) {
    final key = sectionKeys[section];
    if (key != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadAllImages(context);
  }

  void _loadAllImages(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    int loadedImages = 0;
    for (String path in listImagePaths) {
      final image = Image.asset(path);
      final ImageStream stream = image.image.resolve(const ImageConfiguration());

      stream.addListener(
        ImageStreamListener(
          (info, _) {
            loadedImages++;
            if (loadedImages == listImagePaths.length) {
              // Semua gambar selesai dimuat
              appState.setLoading(false);
            }
          },
          onError: (error, stackTrace) {
            debugPrint('Error loading image: $path, $error');
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      if (appState.isLoading) {
        return Scaffold(
          body: Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          )),
        );
      }
      return Scaffold(
          appBar: customAppBar(context, onTapToSection: scrollToSection),
          drawer: customDrawer(context, onTapToSection: scrollToSection),
          body: SingleChildScrollView(
            child: CustomAnimation(
              delay: const Duration(milliseconds: 1500),
              child: Column(
                children: [
                  SectionHero(
                    key: sectionKeyHero,
                  ),
                  linearSolid(50),
                  Column(
                    key: sectionKeyAbout,
                    children: [
                      const SectionAbout(),
                      linearSolid(50),
                      const SectionSkill(),
                    ],
                  ),
                  linearSolid(50),
                  SectionMyLatestApp(
                    key: sectionKeyLatest,
                  ),
                  linearSolid(50),
                  SectionExperience(
                    key: sectionKeyExperience,
                  ),
                  linearSolid(50),
                  SectionProject(
                    key: sectionKeyProject,
                  ),
                  linearSolid(50),
                  SectionContact(
                    key: sectionKeyContact,
                  ),
                  linearSolid(50),
                  const SectionFooter(
                  )
                ],
              ),
            ),
          ));
    });
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
}
