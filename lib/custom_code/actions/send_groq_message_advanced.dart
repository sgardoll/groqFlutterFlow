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

/// ADVANCED: Sends a user message (with optional prior chat history & search settings & image), returns GroqResponseStruct with tokens and executedTools if available.
Future<GroqResponseStruct> sendGroqMessageAdvanced(
  String message,
  String apiKey,
  String model,
  List<String>? chatHistory,
  SearchSettingsStruct? searchSettings,
  FFUploadedFile? imageFile,
) async {
  final url = Uri.parse('https://api.groq.com/openai/v1/chat/completions');
  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  // Extract base64 and format from FFUploadedFile if provided
  String? imageBase64;
  String? imageFormat;
  if (imageFile != null) {
    imageBase64 = base64Encode(imageFile.bytes ?? []);
    imageFormat = _getImageFormat(imageFile.name ?? '');
  }

  // Validate image support for model
  if (imageBase64 != null && !_supportsImages(model)) {
    return GroqResponseStruct(
      content: '',
      modelUsed: model,
      promptTokens: 0,
      completionTokens: 0,
      totalTokens: 0,
      timestamp: DateTime.now().toIso8601String(),
      isAgenticModel: _isAgenticModel(model),
      success: false,
      errorMessage:
          'Model $model does not support image input. Only compound-beta and compound-beta-mini support images.',
      executedTools: [],
    );
  }

  // Validate image size (4MB limit for original file)
  if (imageFile != null && (imageFile.bytes?.length ?? 0) > 4194304) {
    // 4MB limit
    return GroqResponseStruct(
      content: '',
      modelUsed: model,
      promptTokens: 0,
      completionTokens: 0,
      totalTokens: 0,
      timestamp: DateTime.now().toIso8601String(),
      isAgenticModel: _isAgenticModel(model),
      success: false,
      errorMessage: 'Image size exceeds 4MB limit. Please use a smaller image.',
      executedTools: [],
    );
  }

  // If chatHistory provided, include as previous user messages
  final messages = [
    if (chatHistory != null)
      ...chatHistory.map((m) => {'role': 'user', 'content': m}),
    {
      'role': 'user',
      'content': imageBase64 != null
          ? [
              {'type': 'text', 'text': message},
              {
                'type': 'image_url',
                'image_url': {
                  'url':
                      'data:image/${imageFormat ?? 'jpeg'};base64,$imageBase64'
                }
              }
            ]
          : message
    },
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

bool _supportsImages(String model) => const {
      'compound-beta',
      'compound-beta-mini',
    }.contains(model);

String _getImageFormat(String filename) {
  final extension = filename.toLowerCase().split('.').last;
  switch (extension) {
    case 'jpg':
    case 'jpeg':
      return 'jpeg';
    case 'png':
      return 'png';
    case 'gif':
      return 'gif';
    case 'webp':
      return 'webp';
    default:
      return 'jpeg'; // Default fallback
  }
}
