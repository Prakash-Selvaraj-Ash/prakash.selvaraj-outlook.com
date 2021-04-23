import 'dart:convert';
import 'package:http/http.dart' as Client;
import 'package:http/http.dart';
import 'package:http_tuto/response_container.dart';

enum HttpMethod { Get, Put, Post, Patch, Delete }

class WebRequestBuilder {
  HttpMethod _method;
  String _urlPattern;
  String _bodyJson;
  Map<String, String> _parameters;
  Map<String, String> _headers;

  WebRequestBuilder() {
    _parameters = Map<String, String>();
    _headers = Map<String, String>();
    _headers['Content-Type'] = 'application/json; charset=UTF-8';
  }

  WebRequestBuilder create<T>(HttpMethod method, String urlPattern) {
    this._method = method;
    this._urlPattern = urlPattern;
    return this;
  }

  WebRequestBuilder withBodyString(String bodyString) {
    this._bodyJson = bodyString;
    return this;
  }

  WebRequestBuilder withParameters(String key, String value) {
    _parameters[key] = value;
    return this;
  }

  WebRequestBuilder withHeaders(String key, String value) {
    _headers[key] = value;
    return this;
  }

  Future<T> executeRequestAsync<T, K>() async {
    String finalUrl = this._urlPattern;
    this
        ._parameters
        .forEach((k, v) => finalUrl = finalUrl.replaceAll('{$k}', v));

    try {
      Response response;
      switch (_method) {
        case HttpMethod.Get:
          response = await Client.get(finalUrl);
          break;

        case HttpMethod.Post:
          response =
              await Client.post(finalUrl, headers: _headers, body: _bodyJson);
          break;

        case HttpMethod.Put:
          response =
              await Client.put(finalUrl, headers: _headers, body: _bodyJson);
          break;

        default:
          return null;
      }

      return ResponseContainer.fromJson<T, K>(jsonDecode(response.body));
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future executeVoidRequestAsync() async {
    String finalUrl = this._urlPattern;
    this
        ._parameters
        .forEach((k, v) => finalUrl = finalUrl.replaceAll('{$k}', v));

    try {
      switch (_method) {
        case HttpMethod.Post:
          await Client.post(finalUrl, headers: _headers, body: _bodyJson);
          break;

        case HttpMethod.Put:
          await Client.put(finalUrl, headers: _headers, body: _bodyJson);
          break;

        default:
          return null;
      }
    } catch (ex) {
      print(ex);
    }
  }
}
