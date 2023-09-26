import 'package:flutter/material.dart';

class UpdatesAndPrivacy extends StatelessWidget {
  const UpdatesAndPrivacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy AND Updates"),
      ),
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column
              (
             // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                const SizedBox(height: 12,),
                Container(
                  height: 1,
                  color: Colors.black38,
                ),
                const SizedBox(height: 12,),

                 Text("# Privacy Policy We takes your privacy seriously. To better protect your privacy we provide this privacy policy notice explaining the way your personal information is collected and used. ## Collection of Routine InformationThis app track basic information about their users. This information includes, but is not limited to, IP addresses, app details, timestamps and referring pages. None of this information can personally identify specific (visitors or user) to this (app). The information is tracked for routine administration and maintenance purposes.## Cookies Where necessary, this app uses cookies to store information about a visitor’s preferences and history in order to better serve the user and/or present the user with customized content.## Links to Third Party Websites We have included links on this app for your use and reference. We are not responsible for the privacy policies on these websites. You should be aware that the privacy policies of these websites may differ from our own ## Security The security of your personal information is important to us, but remember that no method of transmission over the Internet, or method of electronic storage, is 100% secure. While we strive to use commercially acceptable means to protect your personal information, we cannot guarantee its absolute security.## Changes To This Privacy PolicyThis Privacy Policy is effective as of 1-1-2023 and will remain in effect except with respect to any changes in its provisions in the future, which will be in effect immediately after being posted on this page. We reserve the right to update or change our Privacy Policy at any time and you should check this Privacy Policy periodically. If we make any material changes to this Privacy Policy, we will notify you either through the email address you have provided us, or by placing a prominent notice on our app. ## Contact Information For any questions or concerns regarding the privacy policy, please send us an email to ( karimayman552000@gmail.com ) "
                   , style: Theme.of(context).textTheme.bodySmall,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
