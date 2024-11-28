import 'package:ariadesta/model/model.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionExperience extends StatelessWidget {
  const SectionExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getH = size.height;
    final getW = size.width;
    List<ExperienceModel> listExperience = ExperienceModel.getListModel();
    return ResposiveLayout.isSmallScreen(context)
        ? Column(
            children: [
              SizedBox(
                height: getH * 0.03,
              ),
              Text(
                "Experience",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: getH * 0.03,
              ),
              Column(
                children: listExperience
                    .map(
                      (item) => experienceCardSmallScreen(context, getH, getW, data: item),
                    )
                    .toList(),
              ),
              SizedBox(
                height: getH * 0.03,
              ),
            ],
          )
        : Column(
            children: [
              SizedBox(
                height: getH * 0.05,
              ),
              Text(
                "Experience",
                style:
                    Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Column(
                children: listExperience
                    .map(
                      (item) => experienceCard(context, getH, getW * 0.8, data: item),
                    )
                    .toList(),
              ),
              SizedBox(
                height: getH * 0.05,
              ),
            ],
          );
  }

  Widget experienceCardSmallScreen(
    BuildContext context,
    double getH,
    double getW, {
    required ExperienceModel data,
  }) {
    return Container(
      width: getW,
      margin: EdgeInsets.all(getW * 0.03),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary),
                  child: Text(
                    data.label.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data.jobs,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  data.date,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Column(
                  children: data.listPoin
                      .map((text) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '•',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.primary),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  text,
                                  style: Theme.of(context).textTheme.bodySmall!,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget experienceCard(
    BuildContext context,
    double getH,
    double getW, {
    required ExperienceModel data,
  }) {
    return Container(
      width: getW,
      margin: EdgeInsets.only(top: getH * 0.03),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: getW * 0.26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary),
                  child: Text(
                    data.label.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    data.jobs,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    data.date,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: data.listPoin
                    .map((text) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '•',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w900, color: Theme.of(context).colorScheme.primary),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                text,
                                style: Theme.of(context).textTheme.bodySmall!,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
