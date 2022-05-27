import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ChangeThemeApp extends ChangeNotifier{
   ThemeData? firstTheme;
    bool status = false;
   changeThemeApp(){
     firstTheme = status?buildThemeData():buildThemeDataSecond();
     print("Change Theme $status");
     status = !status;
     notifyListeners();
   }
}