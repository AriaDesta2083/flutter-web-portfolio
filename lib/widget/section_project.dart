import 'package:ariadesta/model/model.dart';
import 'package:ariadesta/shared/shared_method.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
import 'package:flutter/material.dart';

class SectionProject extends StatelessWidget {
  const SectionProject({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getH = size.height;
    final getW = size.width;
    List<ProjectModel> listProject = ProjectModel.getListModel();
    return ResposiveLayout.isSmallScreen(context)
        ? Column(
            children: [
              SizedBox(
                height: getH * 0.03,
              ),
              Text(
                "Project",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              SizedBox(
                height: getH * 0.03,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: listProject
                      .map(
                        (item) => projectCardSmallScreen(context, getH, getW * 0.6, data: item),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: getH * 0.03,
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Project",
                style:
                    Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Column(
                children: listProject
                    .map(
                      (item) => projectCard(context, getH, getW * 0.6, data: item),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
  }

  Widget projectCardSmallScreen(
    BuildContext context,
    double getH,
    double getW, {
    required ProjectModel data,
  }) {
    return Container(
      width: getW,
      margin: EdgeInsets.all(getW * 0.05),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/${data.image.first}',
                opacity: const AlwaysStoppedAnimation(0.9),
                fit: BoxFit.fitWidth,
              )),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Theme.of(context).colorScheme.secondary),
                child: Text(
                  data.app.toUpperCase(),
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
              Text('Project from ${data.label}'),
              const SizedBox(
                height: 20,
              ),
              Column(
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
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(
                    Icons.open_in_new,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () async {
                    await iconLaunchURL(data.url);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget projectCard(
    BuildContext context,
    double getH,
    double getW, {
    required ProjectModel data,
  }) {
    return Container(
      width: getW,
      margin: EdgeInsets.only(top: getH * 0.03),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/${data.image.first}',
                width: getW * 0.35,
                opacity: const AlwaysStoppedAnimation(0.9),
                fit: BoxFit.fitHeight,
              )),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      data.app.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Project from ${data.label}'),
                  const SizedBox(
                    height: 20,
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
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.open_in_new,
                        size: 30,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () async {
                        await iconLaunchURL(data.url);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
