import 'package:flutter/material.dart';
import 'package:mathtool/constants/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    void launchWebsite() {
      const url = 'https://mathstoolkit.blogspot.com/2024/08/maths-toolkit-privacy-policy.html';
      launchURL(url);
    }

    void launchAppStore() {
      Share.share("""You can find Maths ToolKit https://apps.apple.com/store/apps/details?id=com.ehsan.mathtool""");
    }

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 1.5,
      child: SafeArea(
        child: Column(
          children: [
            Image.asset(
              "assets/app_splash_logo.png",
              width: 150.0,
              height: 150.0,
            ),
            const Divider(),
            ListTile(
              onTap: () {
                launchWebsite();
              },
              leading: const Icon(
                Icons.privacy_tip,
                color: AppColors.primaryColor,
              ),
              title: const Text("Privacy Policy"),
            ),
            ListTile(
              onTap: () {
                launchAppStore();
              },
              leading: const Icon(
                Icons.share,
                color: AppColors.primaryColor,
              ),
              title: const Text("Share App"),
            ),
          ],
        ),
      ),
    );
  }
}
