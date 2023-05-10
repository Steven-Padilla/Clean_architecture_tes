import "package:dio/dio.dart";
import "../models/user_model.dart";
import "register_interface.dart";

class RegisterService extends IRegister {
  @override
  Future<UserModel?> register(
      String name, String email, String password) async {
    const api = "http://10.0.2.2:3003/api/v1/user";
    final data = {
      "name": name,
      "email": email,
      "password": password,
    };
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 201) {
      final body = response.data['data'];
      print(response);
      print(body);
      return UserModel(email: body['email'], name: body['name']);
    } else {
      return null;
    }
  }
}
