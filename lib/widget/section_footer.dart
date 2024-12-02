import 'package:flutter/material.dart';

class SectionFooter extends StatelessWidget {
  const SectionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      padding: const EdgeInsets.all(12),
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        children: [
          Text('© ${DateTime.now().year}. All rights reserved.'),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Crafted with 🔥 and Flutter',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
          )
        ],
      ),
    );
  }
}
