import 'package:brainwired_machine_test/core/constants/url_strings.dart';
import 'package:brainwired_machine_test/core/exception/base_exception.dart';
import 'package:brainwired_machine_test/model/user_details_model/user_details_model.dart';
import 'package:dio/dio.dart';

class UserDetailsServices {
  static Dio dio = Dio();
  static Future<UserDetailsModel> getAllUserData() async {
    try {
      final Response response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        return UserDetailsModel.fromJson(response.data);
      }
      throw BaseException('Response not found......!');
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}
