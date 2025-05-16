import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start firestore Group Code

class FirestoreGroup {
  static String getBaseUrl() =>
      'https://console.firebase.google.com/u/0/project/ecommunity-awspik/firestore/databases/-default-/data';
  static Map<String, String> headers = {};
}

/// End firestore Group Code

class GetRealtimeWeightCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRealtimeWeight',
      apiUrl:
          'https://ecommunity-awspik-default-rtdb.asia-southeast1.firebasedatabase.app/.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? metalWeight(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.metalBin.Weight''',
      ));
  static bool? metalIsFull(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.metalBin.isFull''',
      ));
  static dynamic isConnected(dynamic response) => getJsonField(
        response,
        r'''$.devices.esp32_1.status''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
