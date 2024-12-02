import 'package:ariadesta/shared/shared_method.dart';
import 'package:ariadesta/shared/shared_value.dart';
import 'package:ariadesta/widget/responsive_layout.dart';
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
        path: email,
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

        } else {
          throw 'Could not launch email client';
        }
      } catch (e) {
        debugPrint('$e');
      }
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getW = size.width;
    final getH = size.height;
    bool isSmallScreen = ResposiveLayout.isSmallScreen(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: getH * (isSmallScreen ? 0.03 : 0.05)),
      padding: EdgeInsets.symmetric(vertical: getH * 0.02, horizontal: getW * 0.03),
      width: getW * (isSmallScreen ? 0.9 : 0.8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(isSmallScreen?15 : 30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withOpacity(0.2),
            spreadRadius: 0.1,
            blurRadius: 10,
            offset: const Offset(2, 10),
          ),
        ],
      ),
      child: isSmallScreen
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: getW * 0.8, child: infoContactItem(getH * 0.35,isSmallScreen: isSmallScreen)),
                SizedBox(width: getW * 0.8, child: _isSuccess ? infoSuccessItem() : formSendMessage())
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: getW * 0.3, child: infoContactItem(getH * 0.6)),
                SizedBox(width: getW * 0.3, child: _isSuccess ? infoSuccessItem() : formSendMessage())
              ],
            ),
    );
  }

  Widget formSendMessage() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _senderEmailController,
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
            controller: _subjectController,
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
              controller: _messageController,
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
              onPressed: sendEmail,
              style:
                  FilledButton.styleFrom(fixedSize: Size(MediaQuery.of(context).size.width, 40), padding: const EdgeInsets.all(10)),
              child: Text(
                'Send Message',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )),
        ],
      ),
    );
  }

  Widget infoSuccessItem() {
    return Column(
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
    );
  }

  Widget infoContactItem(double getH,{isSmallScreen = false}) {
    return SizedBox(
      height: getH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Contact Us",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
          ),
          Text(
            "Let's talk about your project",
            style: isSmallScreen? Theme.of(context).textTheme.headlineMedium!.copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 35)
            : Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(email, style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w900)),
            Text(phone, style: Theme.of(context).textTheme.titleSmall),
            Text(address, style: Theme.of(context).textTheme.titleSmall),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconUrl(github, 'assets/icons/ic_gith.png'),
              iconUrl(linkedin, 'assets/icons/ic_linkedin.png'),
              iconUrl(instagram, 'assets/icons/ic_instagram.png'),
              iconUrl(whatsapp, 'assets/icons/ic_whatsapp.png'),
              iconUrl(telegram, 'assets/icons/ic_telegram.png'),
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
    );
  }

  Widget iconUrl(
    String label,
    String urlIcon,
  ) {
    return IconButton(
      onPressed: () async {
        await iconLaunchURL(label);
      },
      icon: ImageIcon(
        AssetImage(urlIcon),
        color: Theme.of(context).colorScheme.secondary,
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
