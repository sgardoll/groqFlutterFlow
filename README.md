# Groq Agentic Tools FlutterFlow Library #

<img width="1557" height="1036" alt="Screenshot 2026-02-06 at 5 37 17 PM" src="https://github.com/user-attachments/assets/b2616a3d-f8b7-40a1-b352-6ebd46e73490" />

This repository contains a FlutterFlow-generated Flutter demo and custom Dart actions for sending chat messages to Groq. It is for Flutter and FlutterFlow developers who want to inspect the actions, run the exported demo, or adapt the source in their own project.

## Get the exported source

Clone the actual repository from GitHub:

```bash
git clone https://github.com/sgardoll/groqFlutterFlow.git
cd groqFlutterFlow
```

This is an exported Flutter project. Cloning it does not import a library into the FlutterFlow editor.

## Set up the local demo

Install the [Flutter SDK](https://docs.flutter.dev/install) and Chrome for the web demo. The root [pubspec.yaml](pubspec.yaml) declares Dart `>=3.0.0 <4.0.0` and the Flutter dependencies. From the cloned repository root:

```bash
flutter pub get
flutter run -d chrome
```

The project includes `web/` and opens the [Demo page](lib/groq_pages/demo/demo_widget.dart). The Chrome command follows [Flutter's web setup instructions](https://docs.flutter.dev/platform-integration/web/building). These are setup commands, not a claim that this checkout has been built or tested with your SDK.

### Required configuration

1. Obtain your own Groq API key using [Groq's quickstart](https://console.groq.com/docs/quickstart).
2. Use a chat model API ID currently available to your account; check [Groq's model documentation](https://console.groq.com/docs/models). The bundled [model registry](lib/custom_code/groq_model_registry.dart) is a static list, not a live availability check.
3. In the demo, open the key icon and submit your key. Select a model from the dropdown, enter a text message, and press the send arrow. Choose a listed model that your account still supports; the direct Dart example below accepts your chosen API ID without relying on that list.

The demo passes the key through `FFAppState().groqApiKey` and persists it using the storage code in [app_state.dart](lib/app_state.dart). The actions make requests directly from the app to Groq; they do not read a server environment variable. Use your own key for local experimentation and do not commit it or include it in shared examples.

## Minimal Dart example

Use this helper inside the exported project, for example from a widget event handler. Pass the key supplied by the user and a current chat model API ID as arguments; no credential or model ID is hardcoded here.

```dart
import 'package:groq_agentic_tools/custom_code/actions/index.dart' as actions;

Future<String> tryGroq(String apiKey, String modelId) async {
  final setup = await actions.validateGroqSetup(apiKey, modelId, null);
  if (!setup.success) {
    return setup.errorMessage;
  }

  return await actions.sendGroqMessage(
    'Explain what a Flutter widget is in one sentence.',
    apiKey,
    modelId,
    null,
  );
}
```

This makes two API requests: validation sends a fixed test message, then the simple action sends the example prompt. Passing `null` omits optional search settings. `validateGroqSetup` returns a `GroqResponseStruct`; check `success` and `errorMessage` before proceeding. `sendGroqMessage` returns the assistant text, or a string beginning `Groq API error:` on failure, so callers must handle that result rather than assume every returned string is an answer.

## Action contracts and source

| Action | Inputs, in order | Result |
| --- | --- | --- |
| [validateGroqSetup](lib/custom_code/actions/validate_groq_setup.dart) | `String apiKey`, `String model`, `SearchSettingsStruct? searchSettings` | `Future<GroqResponseStruct>` with validation status, content, token counts and error details |
| [sendGroqMessage](lib/custom_code/actions/send_groq_message.dart) | `String message`, `String apiKey`, `String model`, `SearchSettingsStruct? searchSettings` | `Future<String>` containing assistant text or an error string |
| [sendGroqMessageAdvanced](lib/custom_code/actions/send_groq_message_advanced.dart) | `String message`, `String apiKey`, `String model`, `List<String>? chatHistory`, `SearchSettingsStruct? searchSettings`, `FFUploadedFile? imageFile` | `Future<GroqResponseStruct>` with content, token counts, success/error and executed tools when returned by Groq |

The actions are exported by [actions/index.dart](lib/custom_code/actions/index.dart); generated data types live in [schema/structs](lib/backend/schema/structs/index.dart). Search settings map nonempty include/exclude domains and country into the request. The advanced action sends each supplied history string as a **user** message; it does not accept role-tagged conversation history. Image checks use the bundled registry, so model capabilities there also need checking against the provider's current documentation.

## Scope and limitations

This repository provides action source and a demo, not a verified FlutterFlow Marketplace installation link or library ID. To adapt the actions, inspect their imports, generated structs and model registry together; copying an action file alone does not include those dependencies.

All three actions call Groq's chat-completions endpoint. Provider access, model availability, optional search/image support and live responses depend on your account and the selected model. This documentation describes the checked-in source contract; it does not establish live API success, mobile-device support or a production-ready credential design.
