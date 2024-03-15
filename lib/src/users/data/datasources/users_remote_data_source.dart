import 'dart:convert';

import 'package:faisal_starter_code_flutter/core/errors/exceptions.dart';
import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';
import 'package:faisal_starter_code_flutter/src/users/data/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class UsersRemoteDataSource {
  const UsersRemoteDataSource();

  Future<List<UserModel>> getUsers();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  const UsersRemoteDataSourceImpl({
    required http.Client httpClient,
  }) : _httpClient = httpClient;

  final http.Client _httpClient;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final url = '${dotenv.env['BASE_URL']}/api/users';
      final response = await _httpClient.get(
        Uri.parse(url),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final responseBody = json.decode(response.body) as DataMap;
      final responseData = responseBody['data'] as List<dynamic>;

      final users = responseData
          .map(
            (map) => UserModel.fromMap(map as DataMap),
          )
          .toList();

      return users;
    } on ServerException {
      rethrow;
    } on http.ClientException catch (e) {
      throw ClientException(
        message: e.message,
      );
    } catch (e) {
      throw const GeneralException(
        message: 'An unknown error occurred. Please try again later',
      );
    }
  }
}
