import 'package:ariadesta/widget/section_about.dart';
import 'package:ariadesta/widget/section_contact.dart';
import 'package:ariadesta/widget/section_experience.dart';
import 'package:ariadesta/widget/section_hero.dart';
import 'package:ariadesta/widget/section_mylatestapp.dart';
import 'package:ariadesta/widget/section_navbar.dart';
import 'package:ariadesta/widget/section_project.dart';
import 'package:ariadesta/widget/section_skill.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, onTapToSection: scrollToSection),
        body: SingleChildScrollView(
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
            ],
          ),
        ));
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
