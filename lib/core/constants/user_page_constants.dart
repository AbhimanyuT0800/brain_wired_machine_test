import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_page_constants.g.dart';

class UserPageConstants {
  final txtTitle = 'User Details';
  final txtUnknown = 'User Unknown';
  final txtInfo = 'User info';
  final txtPersonalInfo = 'Personal Information';
  final txtAdress = 'Adress : ';
  final txtConnect = 'Connect : ';
  final txtCurrentCmpny = 'Current Company : ';
}

@riverpod
UserPageConstants userPageConstants(UserPageConstantsRef ref) =>
    UserPageConstants();
