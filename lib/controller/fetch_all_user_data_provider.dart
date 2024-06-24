import 'package:brainwired_machine_test/core/exception/base_exception.dart';
import 'package:brainwired_machine_test/model/user_details_model/user_details_model.dart';
import 'package:brainwired_machine_test/services/user_details_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_all_user_data_provider.g.dart';

@riverpod
Future<List<UserDetailsModel>> fetchAllUserData(FetchAllUserDataRef ref) async {
  try {
    return await UserDetailsServices.getAllUserData();
  } on BaseException catch (e) {
    throw e.message;
  }
}
