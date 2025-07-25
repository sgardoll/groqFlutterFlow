// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:groq/groq.dart';

// SIMPLE VERSION: Returns just the content string
Future<String> sendGroqMessage(
    String message, String apiKey, String model) async {
  try {
    final groq = Groq(
      apiKey: apiKey,
      model: model,
    );

    groq.startChat();
    GroqResponse response = await groq.sendMessage(message);

    // Validate response has choices before accessing
    if (response.choices.isEmpty) {
      throw Exception('No response choices returned from Groq API');
    }

    return response.choices.first.message.content;
  } catch (e) {
    print('Error with Groq API: $e');
    return 'Error: Unable to get response from Groq API: ${e.toString()}';
  }
}
