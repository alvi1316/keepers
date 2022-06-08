import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keeper/database/providers.dart';
import 'package:keeper/home.dart';
import 'package:keeper/parentprofile/parentprofile.dart';
import 'package:keeper/sitterprofile.dart';

class InitialPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var temp = ref.watch(sessionProvider);
    if (temp.isLoggedIn) {
      if (temp.userType == "parent") {
        return ParentProfile();
      } else if (temp.userType == "sitter") {
        return SitterProfile();
      } else {
        return Home();
      }
    } else {
      return Home();
    }
  }
}
