import 'package:brainwired_machine_test/core/constants/url_strings.dart';
import 'package:brainwired_machine_test/core/exception/base_exception.dart';
import 'package:brainwired_machine_test/model/user_details_model/user_details_model.dart';
import 'package:dio/dio.dart';

class UserDetailsServices {
  static Dio dio = Dio();
  static Future<List<UserDetailsModel>> getAllUserData() async {
    try {
      // get response from api
      final Response response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        /// cast respose data to list of elements
        /// and get list of user model
        ///
        /// sort according to user name and return
        final userDetailsList = response.data as List<dynamic>;

        return userDetailsList
            .map(
              (e) => UserDetailsModel.fromJson(e),
            )
            .toList()
          ..sort(
            (a, b) => a.username!.compareTo(b.username!),
          );
      }
      throw BaseException('Response not found......!');
    } on DioException catch (e) {
      throw BaseException(e.message ?? 'Something went wrong');
    }
  }
}
