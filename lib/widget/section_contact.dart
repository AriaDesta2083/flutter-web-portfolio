import 'package:ariadesta/shared/shared_method.dart';
import 'package:ariadesta/shared/shared_value.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SectionContact extends StatefulWidget {
  const SectionContact({super.key});

  @override
  State<SectionContact> createState() => _SectionContactState();
}

class _SectionContactState extends State<SectionContact> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _senderEmailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isSuccess = false;
  final String recipientEmail = 'ariadestaprabu@gmail.com';

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  void resetForm() {
    setState(() {
      _isSuccess = false;
      _senderEmailController.clear();
      _subjectController.clear();
      _messageController.clear();
    });
  }

  Future<void> sendEmail() async {
    if (_formKey.currentState!.validate()) {
      // Create email body with sender's email included
      final String emailBody = '\nFrom: ${_senderEmailController.text}\n${_messageController.text}';

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: recipientEmail,
        query: encodeQueryParameters(<String, String>{
          'subject': _subjectController.text,
          'body': emailBody,
        }),
      );

      try {
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
          setState(() {
            _isSuccess = true;
          });
          // Show success message
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('successfully'),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            );
          }
        } else {
          throw 'Could not launch email client';
        }
      } catch (e) {
        // Show error message
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      }
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getH = size.height;
    final getW = size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: getW * 0.02, horizontal: getW * 0.03),
      margin: EdgeInsets.symmetric(vertical: getH * 0.14, horizontal: getW * 0.03),
      width: getW * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 10,
            offset: const Offset(2, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getW * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Contact Us\n",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Let's talk about your project\n",
                  style:
                      Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Text("ariadestaprabu@gmail.com",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w900)),
                Text("+62 812-2512-1659", style: Theme.of(context).textTheme.titleMedium),
                Text("Bondowoso, East Java, Indonesia\n", style: Theme.of(context).textTheme.titleMedium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconUrl(github, 'icons/ic_github.png', context),
                    iconUrl(linkedin, 'icons/ic_linkedin.png', context),
                    iconUrl(instagram, 'icons/ic_instagram.png', context),
                    iconUrl(whatsapp, 'icons/ic_whatsapp.png', context),
                    iconUrl(telegram, 'icons/ic_telegram.png', context),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SizedBox(
              width: getW * 0.3,
              child: !_isSuccess
                  ? Column(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: Theme.of(context).colorScheme.primary,
                          size: 50,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Message Sent Successfully!",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Thank you for contacting us. We'll get back to you soon.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 30),
                        FilledButton.icon(
                          onPressed: resetForm,
                          style: FilledButton.styleFrom(
                            fixedSize: const Size(200, 45),
                            padding: const EdgeInsets.all(10),
                          ),
                          icon: const Icon(Icons.refresh),
                          label: const Text('Send Another Message'),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          "Contact Form",
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Your Mail',
                              fillColor: Theme.of(context).hintColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), gapPadding: 10.0),
                              hintText: 'How I Can Help You',
                              fillColor: Theme.of(context).hintColor),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          child: TextField(
                            maxLines: null,
                            minLines: 8,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), gapPadding: 10.0),
                                hintText: 'Message',
                                fillColor: Theme.of(context).hintColor),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(fixedSize: Size(getW, 40), padding: const EdgeInsets.all(10)),
                            child: Text(
                              'Send Message',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                            )),
                      ],
                    ))
        ],
      ),
    );
  }

  Widget iconUrl(
    String label,
    String urlIcon,
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () async {
        await iconLaunchURL(label);
      },
      icon: ImageIcon(
        AssetImage(urlIcon),
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }

  @override
  void dispose() {
    _senderEmailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
