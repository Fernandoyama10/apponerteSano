import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInController with ChangeNotifier {
  Map? userData;
  login() async {
    var result =
        await FacebookAuth.instance.login(permissions: ["public_profile", "email"]);
        
    if (result.status == LoginStatus.success) {
      final requestData =
          await FacebookAuth.instance.getUserData(fields: "email, name, picture, id");
      userData = requestData;
      notifyListeners();
    }


  }
      logOut() async{
      await FacebookAuth.i.logOut();
      userData = null;
      notifyListeners();
    }
}
