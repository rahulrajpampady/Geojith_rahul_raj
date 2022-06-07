
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'api_client.dart';
import 'api_exception.dart';
import 'api_methods.dart';

class ApiRequest {
  handleApiError(Response response) async {
    switch (response.statusCode) {
      // case 400:
      //   throw new UnauthorisedException();
      case 401:
      case 402:
        throw new UnauthorisedException();
      // case 404:
      //   throw new FetchDataException();
    }
  }

  static send({
    required ApiMethod method,
    required Map<String, dynamic> body,
    required String route,
    required Map<String, dynamic> queries,
  }) async {
    final api = ApiClient();

    Response? response ;

    if (queries != null && queries.isNotEmpty) {
      queries.forEach((key, value) {
        if (value != null) {
          if (route.contains("?")) {
            route += "&$key=$value";
          } else {
            route += "?$key=$value";
          }
        }
      });
    }

    try {
      Uri uri = Uri.parse(api.url(route));
      if (method == ApiMethod.GET) {
        response = await api.client().get(uri);
      } else if (method == ApiMethod.POST) {
        response = await api.client().post(uri, body: json.encode(body));
      } else if (method == ApiMethod.DELETE) {
        response =await api.client().delete(uri);
      } else if (method == ApiMethod.PUT) {
        response = await api.client().put(uri, body: json.encode(body));
      }



      final responseBody = json.decode(response?.body?? "{}");

      return responseBody;
    } on SocketException {
      print("Socket exception");
    }
  }
}
