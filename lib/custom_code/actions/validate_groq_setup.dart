// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:groq/groq.dart';

// VALIDATION FUNCTION: Test API setup and return validation result
Future<GroqResponseStruct> validateGroqSetup(
    String apiKey, String model) async {
  try {
    final groq = Groq(
      apiKey: apiKey,
      model: model,
    );

    groq.startChat();
    GroqResponse response =
        await groq.sendMessage("Hello, this is a test message.");

    // Validate response has choices before accessing
    if (response.choices.isEmpty) {
      throw Exception('No response choices returned from Groq API');
    }

    String responseContent = response.choices.first.message.content;

    return GroqResponseStruct(
      content: 'Setup validated successfully. Test response: $responseContent',
      modelUsed: response.model,
      promptTokens: response.usage.promptTokens,
      completionTokens: response.usage.completionTokens,
      totalTokens: response.usage.totalTokens,
      timestamp: DateTime.now().toIso8601String(),
      isAgenticModel: _isAgenticModel(model),
      success: true,
      errorMessage: '',
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
      errorMessage: 'Setup validation failed: ${e.toString()}',
    );
  }
}

// HELPER FUNCTION: Check if model supports agentic tooling
bool _isAgenticModel(String model) {
  const agenticModels = {
    'compound-beta',
    'compound-beta-mini',
    'kimi-k2-instruct',
  };
  return agenticModels.contains(model);
}
