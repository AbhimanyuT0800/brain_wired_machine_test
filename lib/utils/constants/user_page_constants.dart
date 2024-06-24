import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_page_constants.g.dart';

class UserPageConstants {
  final txtIntro = 'Welcome';
}

@riverpod
UserPageConstants userPageConstants(UserPageConstantsRef ref) =>
    UserPageConstants();
