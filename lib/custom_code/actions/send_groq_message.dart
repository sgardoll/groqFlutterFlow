// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

/// SIMPLE one-shot message; returns only the assistant's text as String.
/// Use for commodity Q&A where token usage/executed tools aren't needed.
Future<String> sendGroqMessage(
  String message,
  String apiKey,
  String model,
  SearchSettingsStruct? searchSettings,
) async {
  final url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };
  final body = {
    'model': model,
    'messages': [
      {'role': 'user', 'content': message},
    ],
    if (searchSettings != null) 'search_settings': _mapSettings(searchSettings),
  };

  try {
    final res = await http.post(url, headers: headers, body: jsonEncode(body));
    final decoded = jsonDecode(res.body);

    if (res.statusCode != 200) {
      throw Exception(decoded['error']?['message'] ?? res.body.toString());
    }

    return decoded['choices'][0]['message']['content'] ?? '';
  } catch (e) {
    return 'Groq API error: ${e.toString()}';
  }
}

Map<String, dynamic> _mapSettings(SearchSettingsStruct settings) => {
      if (settings.excludeDomains.isNotEmpty)
        "exclude_domains": settings.excludeDomains,
      if (settings.includeDomains.isNotEmpty)
        "include_domains": settings.includeDomains,
      if (settings.country.isNotEmpty) "country": settings.country,
    };
