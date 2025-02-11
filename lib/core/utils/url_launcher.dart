import 'package:portfolio/core/utils/my_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';


class UrlLauncher {
  UrlLauncher._();

  static void launch({required String url}) async{
    try{
      launchUrl(Uri.parse(url.toString()));
    }catch(error){
      mySnackBar(title: "Error", body: error.toString(), isError: true);
    }
  }
}
