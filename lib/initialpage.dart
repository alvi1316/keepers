import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/home.dart';
import 'package:keeper/parentprofile/parentprofile.dart';
import 'package:keeper/sitterprofile.dart';

class InitialPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget val = Home();
    var temp = ref.watch(sessionProvider);
    if (temp.isLoggedIn) {
      if (temp.userType == "parent") {
        val = ParentProfile();
      } else if (temp.userType == "sitter") {
        val = SitterProfile();
      } else {
        val = Home();
      }
    } else {
      val = Home();
    }
    return val;
  }
}
