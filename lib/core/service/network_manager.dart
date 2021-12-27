import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkManager {
  static NetworkManager? _instance;

  late final Dio _dio;
  late final BaseOptions _baseOptions;
  late final String _baseUrl, token, hash;

  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init() {
    _baseUrl = 'https://gateway.marvel.com';
    token = '344d40df0c8cc373141c1dc321fae9cf';
    hash = 'bd0722d5750b6362d5ba0212ca36726b';

    _baseOptions = BaseOptions(
      baseUrl: _baseUrl,
    );
    _dio = Dio(_baseOptions);
  }
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? query,
  }) {
    var queryData = {'apikey': token, 'ts': 1, 'hash': hash, ...query ?? {}};
    return _dio.get<T>('/v1/public/' + path, queryParameters: queryData);
  }
}
