import 'package:flutter/material.dart';

class SectionFooter extends StatelessWidget {
  const SectionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Text('© ${DateTime.now().year}. All rights reserved.',),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Crafted with 🔥 and Flutter',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
