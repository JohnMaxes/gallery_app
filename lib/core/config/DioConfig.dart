import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final BaseOptions dioOptions = BaseOptions(
  followRedirects: true,
  headers: {
    'X-Custom-Header': 'may god help us all',
    'X-Custom-Header2': 'may help god us all',
  }
);

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['Authorization'] = 'Bearer Somebody';
    handler.next(options);
  }
}

class AuthorizationCheckInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.headers['Authorization'] == 'Bearer Somebody') {
      options.headers['Authorization1'] = 'Found Authorization header!';
    }
    handler.next(options);
  }
}

final List<Interceptor> interceptors = [
  AuthorizationInterceptor(),
  AuthorizationCheckInterceptor(),
  InterceptorsWrapper(
    onRequest: (options, handler) {
      debugPrint(options.headers.toString());
    },
  )
];

final Dio appDio = Dio(dioOptions)
  ..interceptors.addAll(interceptors);