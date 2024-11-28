import 'package:ariadesta/model/model.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SectionSkill extends StatefulWidget {
  const SectionSkill({super.key});

  @override
  State<SectionSkill> createState() => _SectionSkillState();
}

class _SectionSkillState extends State<SectionSkill> {
  final ScrollController _scrollControllerSkill = ScrollController();
  final List<SkillModel> listSkill = SkillModel.getListModel();

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_scrollControllerSkill.hasClients) {
        double maxScrollExtent = _scrollControllerSkill.position.maxScrollExtent;
        _scrollControllerSkill
            .animateTo(
          maxScrollExtent,
          duration: const Duration(seconds: 35),
          curve: Curves.linear,
        )
            .then((_) {
          _scrollControllerSkill.jumpTo(0);
          _startAutoScroll();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final getH = screenSize.height;
    return Column(
      children: [
        SizedBox(
          height: getH * 0.03,
        ),
        Text(
          'Skills',
          style: ResposiveLayout.isSmallScreen(context)
              ? Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary)
              : Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        SizedBox(
          height: getH * 0.03,
        ),
        const Text('The skills, tools and technologies I am really good at:'),
        Container(
          height: getH * 0.15,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: ResposiveLayout.isSmallScreen(context) ? 10 : 100),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Colors.white, Colors.transparent, Colors.transparent, Colors.white],
                stops: [0.0, 0.1, 0.9, 1.0],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstOut,
            child: SingleChildScrollView(
              controller: _scrollControllerSkill,
              physics: const NeverScrollableScrollPhysics(),
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Row(children: listSkill.map((data) => iconSkill(icUrl: data.imgUrl, label: data.label)).toList()),
            ),
          ),
        ),
        SizedBox(
          height: getH * 0.03,
        ),
      ],
    );
  }

  Widget iconSkill({required String icUrl, required String label}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ResposiveLayout.isSmallScreen(context) ? 20 : 50),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'icons/$icUrl',
            width: MediaQuery.of(context).size.height * (ResposiveLayout.isSmallScreen(context) ? 0.05 : 0.07),
            fit: BoxFit.fitWidth,
            filterQuality: FilterQuality.high,
          ),
          Text(label)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollControllerSkill.dispose();
    super.dispose();
  }
}
