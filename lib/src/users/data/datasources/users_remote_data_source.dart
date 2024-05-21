import 'package:dio/dio.dart';
import 'package:faisal_starter_code_flutter/core/errors/exceptions.dart';
import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';
import 'package:faisal_starter_code_flutter/src/users/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class UsersRemoteDataSource {
  const UsersRemoteDataSource();

  Future<List<UserModel>> getUsers();
}

@LazySingleton(as: UsersRemoteDataSource)
class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  const UsersRemoteDataSourceImpl({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      const path = '/api/users';
      final response = await _dio.get<DataMap>(path);

      final users = (response.data!['data'] as List<dynamic>)
          .map((user) => UserModel.fromMap(user as DataMap))
          .toList();

      return users;
    } on DioException catch (e) {
      throw HttpException.fromDio(e);
    } catch (e) {
      throw GeneralException(
        message: e.toString(),
      );
    }
  }
}
