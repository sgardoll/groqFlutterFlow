// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:groq/groq.dart';

// MAIN ADVANCED FUNCTION: Returns GroqResponseStruct with full details
Future<GroqResponseStruct> sendGroqMessageAdvanced(String message,
    String apiKey, String model, List<String>? chatHistory) async {
  // Provide default empty list if chatHistory is null
  chatHistory ??= [];

  try {
    final groq = Groq(
      apiKey: apiKey,
      model: model,
    );

    groq.startChat();

    // Build conversation context by sending history messages
    // This maintains proper conversation flow
    for (String previousMessage in chatHistory) {
      try {
        await groq.sendMessage(previousMessage);
        // Note: We don't store the response as we're just building context
      } catch (e) {
        print('Warning: Failed to send chat history message: $e');
        // Continue with remaining history even if one message fails
      }
    }

    // Send the current message
    GroqResponse response = await groq.sendMessage(message);

    // Validate response has choices before accessing
    if (response.choices.isEmpty) {
      throw Exception('No response choices returned from Groq API');
    }

    final firstChoice = response.choices.first;

    // Create and return GroqResponseStruct
    return GroqResponseStruct(
      content: firstChoice.message.content,
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
    print('Error with Groq API: $e');
    return GroqResponseStruct(
      content: '',
      modelUsed: model,
      promptTokens: 0,
      completionTokens: 0,
      totalTokens: 0,
      timestamp: DateTime.now().toIso8601String(),
      isAgenticModel: _isAgenticModel(model),
      success: false,
      errorMessage: 'Unable to get response from Groq API: ${e.toString()}',
    );
  }
}

// HELPER FUNCTION: Convert executed tools to List<String> for FlutterFlow compatibility
// Note: Current Groq API v1.0.0 doesn't include executedTools in response
// Keeping this function for future API versions that may include tool execution
List<String> _convertToolsToStringList(dynamic executedTools) {
  if (executedTools == null) return <String>[];

  try {
    if (executedTools is List) {
      return executedTools.map((tool) => tool.toString()).toList();
    } else {
      return [executedTools.toString()];
    }
  } catch (e) {
    print('Error converting tools to string list: $e');
    return <String>[];
  }
}

// UTILITY FUNCTION: Get recommended model based on use case
String getRecommendedModel(String useCase) {
  switch (useCase.toLowerCase()) {
    case 'research':
    case 'current_events':
    case 'web_search':
      return 'compound-beta';
    case 'calculation':
    case 'math':
    case 'code':
      return 'compound-beta-mini';
    case 'chat':
    case 'conversation':
      return 'llama-3.3-70b-versatile';
    case 'fast':
    case 'quick':
      return 'llama-3.1-8b-instant';
    case 'vision':
    case 'image':
      return 'llama-3.2-11b-vision-preview';
    case 'agentic':
    case 'tools':
      return 'kimi-k2-instruct';
    default:
      return 'llama-3.3-70b-versatile';
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
