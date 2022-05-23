import 'dart:io' show Platform;

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

class UtilFunctions {
  static String iconPath = "assets/images/icons/";

  static String getDayOfWeek(DateTime date) => DateFormat('E').format(date);

  static String getDayOfMonth(DateTime date) => DateFormat('dd').format(date);

  static String getDate(DateTime date) => DateFormat('dd MMM, yyy').format(date);

  static String getTime(DateTime date) => DateFormat('h:m a').format(date);

  static String getMonth(DateTime date) => DateFormat('MMMM').format(date).substring(0, 3);

  static String getIconUrlFromFeelingName(String name) {
    switch (name) {
      case "Happy":
        return "${iconPath}ic_happy.png";
      case "Sad":
        return "${iconPath}ic_sad.png";
      case "Energetic":
        return "${iconPath}ic_energetic.png";
      case "Calm":
        return "${iconPath}ic_calm.png";
      case "Angry":
        return "${iconPath}ic_angry.png";
      case "Bored":
        return "${iconPath}ic_bored.png";
      default:
        return "${iconPath}ic_bored.png";
    }
  }

  static void launchYoutubeURL(String url) async {
    Uri uri = Uri.parse(url);
    if (Platform.isIOS) {
      // LaunchUrl()
      bool canLaunch = await Launcher.canLaunchUrl(uri);
      if (canLaunch) {
        await Launcher.launchUrl(uri, mode: Launcher.LaunchMode.platformDefault);
      } else {
        canLaunch = await Launcher.canLaunchUrl(uri);
        if (canLaunch) {
          await Launcher.launchUrl(uri, mode: Launcher.LaunchMode.platformDefault);
        } else {
          throw 'Could not launch https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw';
        }
      }
    } else {
      bool canLaunch = await Launcher.canLaunchUrl(uri);
      if (canLaunch) {
        await Launcher.launchUrl(uri, mode: Launcher.LaunchMode.platformDefault);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static String getYoutubeThumbnail(String videoUrl) {
    final Uri? uri = Uri.tryParse(videoUrl);
    if (uri == null) {
      return "";
    }

    return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
  }
}
