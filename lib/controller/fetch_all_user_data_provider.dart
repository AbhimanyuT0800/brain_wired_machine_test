import 'package:brainwired_machine_test/services/user_details_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_all_user_data_provider.g.dart';

@riverpod
fetchAllUserData(FetchAllUserDataRef ref) {
  return UserDetailsServices.getAllUserData();
}
