import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:savomart/utils/debug_utils.dart';
import 'package:http/http.dart';
// ignore: implementation_imports
import "package:http/src/multipart_file.dart" as multipart;
// ignore: implementation_imports
import 'package:http/src/response.dart' as res;

import '../../presentation/core/auth_wrapper/auth_controller.dart';
import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    AuthController authController = Get.find();
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    final response = await _client.get(
      getPath(path),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': authController.user != null
            ? 'Bearer ${authController.user!.sessionId}'
            : "",
      },
    );
    consoleLog(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic formDataMultiple(
      {required Map<String, dynamic> data,
      List<File>? images,
      required String path}) async {
    consoleLog(ApiConstants.baseUrl + path);
    consoleLog(data);
    AuthController authController = Get.find();
    var request =
        MultipartRequest("POST", Uri.parse(ApiConstants.baseUrl + path));
    request.headers.addAll({
      'Authorization': authController.user != null
          ? 'Bearer ${authController.user!.sessionId}'
          : "",
    });

    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = key + "[$index]";
          request.fields[fieldString] = element.toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    if (images != null && images.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      images.forEach((image) async {
        var multipartFile = await multipart.MultipartFile.fromPath(
          "images[]",
          image.path,
          contentType: MediaType("image", "jpeg"),
        );
        request.files.add(multipartFile);
      });
    }

    // request.files.add(multipartFile);
    final response = await request.send();
    var httpResponse = await res.Response.fromStream(response);
    final jsonresposne = json.decode(httpResponse.body);
    consoleLog(jsonresposne);
    return jsonresposne;
  }

  dynamic post(String path, Map<dynamic, dynamic> params) async {
    consoleLog(getPath(path));
    consoleLog(jsonEncode(params));
    AuthController authController = Get.find();
    final response = await _client.post(
      getPath(path),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': authController.user != null
            ? 'Bearer ${authController.user!.sessionId}'
            : "",
      },
    );
    consoleLog(response.body);
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return responseJson;
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic formData(
      {required Map<String, dynamic> data,
      required Map<String, File> images,
      required String path}) async {
    consoleLog(ApiConstants.baseUrl + path);
    consoleLog(data);
    AuthController authController = Get.find();
    var request =
        MultipartRequest("POST", Uri.parse(ApiConstants.baseUrl + path));
    request.headers.addAll({
      'Authorization': authController.user != null
          ? 'Bearer ${authController.user!.sessionId}'
          : "",
    });

    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = key + "[$index]";
          request.fields[fieldString] = element.toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    // ignore: avoid_function_literals_in_foreach_calls
    // images.forEach((image) async {
    //   final index = images.indexOf(image);
    //   var multipartFile = await MultipartFile.fromPath(
    //     "images[$index]",
    //     image.path,
    //     filename: "images[$index]",
    //     contentType: MediaType("image", "jpeg"),
    //   );
    //   request.files.add(multipartFile);
    // });
    images.forEach((key, value) async {
      var multipartFile = await multipart.MultipartFile.fromPath(
          key, value.path,
          contentType: MediaType("image", "jpeg"));
      request.files.add(multipartFile);
    });
    // var multipartFile = await http.MultipartFile.fromPath(
    //   "finished_image",
    //   file.path,
    //   filename: basename(file.path),
    //   contentType: MediaType("image", "jpeg"),
    // );

    // request.files.add(multipartFile);
    final response = await request.send();
    var httpResponse = await res.Response.fromStream(response);
    final jsonresposne = json.decode(httpResponse.body);
    consoleLog(jsonresposne);
    return jsonresposne;
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    Request request = Request('DELETE', getPath(path));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(params);
    final response = await _client.send(request).then(
          (value) => res.Response.fromStream(value),
        );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, {Map<dynamic, dynamic>? params}) {
    // var paramsString = '';
    // if (params?.isNotEmpty ?? false) {
    //   params?.forEach((key, value) {
    //     paramsString += '&$key=$value';
    //   });
    // }

    return Uri.parse('${ApiConstants.baseUrl}$path');
  }
}
