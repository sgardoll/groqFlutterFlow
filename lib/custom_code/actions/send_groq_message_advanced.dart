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

/// ADVANCED: Sends a user message (with optional prior chat history & search settings), returns GroqResponseStruct with tokens and executedTools if available.
Future<GroqResponseStruct> sendGroqMessageAdvanced(
  String message,
  String apiKey,
  String model,
  List<String>? chatHistory,
  SearchSettingsStruct? searchSettings,
) async {
  final url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  // If chatHistory provided, include as previous user messages
  final messages = [
    if (chatHistory != null)
      ...chatHistory.map((m) => {'role': 'user', 'content': m}),
    {'role': 'user', 'content': message},
  ];

  final body = {
    'model': model,
    'messages': messages,
    if (searchSettings != null) 'search_settings': _mapSettings(searchSettings),
  };

  try {
    final res = await http.post(url, headers: headers, body: jsonEncode(body));
    final decoded = jsonDecode(res.body);

    if (res.statusCode != 200) {
      throw Exception(decoded['error']?['message'] ?? res.body.toString());
    }

    final firstChoice = decoded['choices'][0];
    final content = firstChoice['message']['content'] ?? "(empty)";
    final executedTools = firstChoice['message']['executed_tools'];

    return GroqResponseStruct(
      content: content,
      modelUsed: decoded['model'],
      promptTokens: decoded['usage']?['prompt_tokens'] ?? 0,
      completionTokens: decoded['usage']?['completion_tokens'] ?? 0,
      totalTokens: decoded['usage']?['total_tokens'] ?? 0,
      timestamp: DateTime.now().toIso8601String(),
      isAgenticModel: _isAgenticModel(model),
      success: true,
      errorMessage: '',
      executedTools: executedTools == null
          ? []
          : (executedTools is List
              ? executedTools.map((e) => e.toString()).toList()
              : [executedTools.toString()]),
    );
  } catch (e) {
    return GroqResponseStruct(
      content: '',
      modelUsed: model,
      promptTokens: 0,
      completionTokens: 0,
      totalTokens: 0,
      timestamp: DateTime.now().toIso8601String(),
      isAgenticModel: _isAgenticModel(model),
      success: false,
      errorMessage: 'Groq API error: ${e.toString()}',
      executedTools: [],
    );
  }
}

Map<String, dynamic> _mapSettings(SearchSettingsStruct settings) => {
      if (settings.excludeDomains.isNotEmpty)
        "exclude_domains": settings.excludeDomains,
      if (settings.includeDomains.isNotEmpty)
        "include_domains": settings.includeDomains,
      if (settings.country.isNotEmpty) "country": settings.country,
    };

bool _isAgenticModel(String model) => const {
      'compound-beta',
      'compound-beta-mini',
    }.contains(model);
