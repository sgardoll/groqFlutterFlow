# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter project built with FlutterFlow that implements a Groq AI Agent. The app allows users to interact with the Groq AI API through a Flutter interface. The project uses FlutterFlow's visual development environment with custom code extensions.

## Essential Development Commands

```bash
# Run the Flutter app on connected device/emulator
flutter run

# Build for release (Android)
flutter build apk --release

# Build for release (iOS) 
flutter build ios --release

# Run tests
flutter test

# Analyze code for issues
flutter analyze

# Clean build artifacts
flutter clean

# Get dependencies
flutter pub get

# Run in debug mode with hot reload
flutter run --debug
```

## Architecture Overview

### FlutterFlow Integration
- Built with FlutterFlow visual development platform
- Custom code is stored in `/lib/custom_code/` directory
- Auto-generated files should NOT be modified directly
- FlutterFlow manages routing, theming, and app state through generated code

### Key Directories Structure
```
lib/
├── custom_code/          # Custom code that syncs with FlutterFlow
│   ├── actions/         # Custom action functions
│   └── widgets/         # Custom widget components
├── flutter_flow/        # FlutterFlow generated utilities
├── backend/            # Data structures and API schemas
│   └── schema/structs/ # Custom data types (e.g., GroqResponseStruct)
├── pages/             # App pages/screens
└── main.dart          # App entry point
```

### Custom Code Implementation
- **Custom Actions**: Defined in `/lib/custom_code/actions/` (e.g., `send_groq_message.dart`)
- **Custom Functions**: Stored in `/lib/flutter_flow/custom_functions.dart`
- **Data Structures**: Custom structs in `/lib/backend/schema/structs/`
- **App State**: Managed through FFAppState() accessible globally

## FlutterFlow Development Rules

### CRITICAL: Follow FlutterFlow Cursor Rules
The project must adhere to strict FlutterFlow development patterns found in `/Users/home/Projects/flutterflow_cursor_rules.md`. Key requirements:

1. **Custom Code File Headers**: All custom code files MUST start with exact FlutterFlow import headers
2. **Directory Restrictions**: Only files in `/lib/custom_code/` sync with FlutterFlow
3. **Parameter Types**: Use only simple types (String, int, double, bool, Color) in custom widgets/actions
4. **Action Returns**: All custom actions must return `Future<T>`
5. **Dependencies**: Add only through FlutterFlow UI, never edit pubspec.yaml directly

### Custom Code Integration
- Custom actions handle API calls and business logic
- Custom widgets extend UI capabilities beyond FlutterFlow's components
- Custom functions provide utility methods (synchronous only)
- Data structures defined as Structs for type safety

## Key Dependencies

Based on `pubspec.yaml`:
- **groq**: Groq AI API integration
- **flutter_secure_storage**: Secure credential storage
- **dio**: HTTP client for API requests
- **provider**: State management
- **go_router**: Navigation management
- **google_fonts**: Typography

## API Integration

### Groq AI Integration
- Primary API: Groq AI for language model interactions
- Implementation: `/lib/custom_code/actions/send_groq_message.dart`
- Response handling: `GroqResponseStruct` data structure
- Security: API keys stored using flutter_secure_storage

## Testing and Quality

- Run `flutter analyze` before committing code changes
- Use `flutter test` to run unit tests
- Test on multiple devices/screen sizes due to responsive design
- Validate custom code in FlutterFlow UI before syncing

## Important Notes

- **Never modify** auto-generated FlutterFlow files
- **Always test** custom code locally before syncing to FlutterFlow
- **Follow naming conventions**: UpperCamelCase for data types, custom structs append "Struct"
- **App State access**: Use `FFAppState()` for global state management
- **Theme integration**: Use `FlutterFlowTheme.of(context)` for consistent styling