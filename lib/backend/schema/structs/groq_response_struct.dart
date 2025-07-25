// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroqResponseStruct extends BaseStruct {
  GroqResponseStruct({
    String? content,
    String? modelUsed,
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
    String? timestamp,
    bool? isAgenticModel,
    bool? success,
    String? errorMessage,
    List<String>? executedTools,
  })  : _content = content,
        _modelUsed = modelUsed,
        _promptTokens = promptTokens,
        _completionTokens = completionTokens,
        _totalTokens = totalTokens,
        _timestamp = timestamp,
        _isAgenticModel = isAgenticModel,
        _success = success,
        _errorMessage = errorMessage,
        _executedTools = executedTools;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "model_used" field.
  String? _modelUsed;
  String get modelUsed => _modelUsed ?? '';
  set modelUsed(String? val) => _modelUsed = val;

  bool hasModelUsed() => _modelUsed != null;

  // "prompt_tokens" field.
  int? _promptTokens;
  int get promptTokens => _promptTokens ?? 0;
  set promptTokens(int? val) => _promptTokens = val;

  void incrementPromptTokens(int amount) =>
      promptTokens = promptTokens + amount;

  bool hasPromptTokens() => _promptTokens != null;

  // "completion_tokens" field.
  int? _completionTokens;
  int get completionTokens => _completionTokens ?? 0;
  set completionTokens(int? val) => _completionTokens = val;

  void incrementCompletionTokens(int amount) =>
      completionTokens = completionTokens + amount;

  bool hasCompletionTokens() => _completionTokens != null;

  // "total_tokens" field.
  int? _totalTokens;
  int get totalTokens => _totalTokens ?? 0;
  set totalTokens(int? val) => _totalTokens = val;

  void incrementTotalTokens(int amount) => totalTokens = totalTokens + amount;

  bool hasTotalTokens() => _totalTokens != null;

  // "timestamp" field.
  String? _timestamp;
  String get timestamp => _timestamp ?? '';
  set timestamp(String? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "is_agentic_model" field.
  bool? _isAgenticModel;
  bool get isAgenticModel => _isAgenticModel ?? false;
  set isAgenticModel(bool? val) => _isAgenticModel = val;

  bool hasIsAgenticModel() => _isAgenticModel != null;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "error_message" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  set errorMessage(String? val) => _errorMessage = val;

  bool hasErrorMessage() => _errorMessage != null;

  // "executedTools" field.
  List<String>? _executedTools;
  List<String> get executedTools => _executedTools ?? const [];
  set executedTools(List<String>? val) => _executedTools = val;

  void updateExecutedTools(Function(List<String>) updateFn) {
    updateFn(_executedTools ??= []);
  }

  bool hasExecutedTools() => _executedTools != null;

  static GroqResponseStruct fromMap(Map<String, dynamic> data) =>
      GroqResponseStruct(
        content: data['content'] as String?,
        modelUsed: data['model_used'] as String?,
        promptTokens: castToType<int>(data['prompt_tokens']),
        completionTokens: castToType<int>(data['completion_tokens']),
        totalTokens: castToType<int>(data['total_tokens']),
        timestamp: data['timestamp'] as String?,
        isAgenticModel: data['is_agentic_model'] as bool?,
        success: data['success'] as bool?,
        errorMessage: data['error_message'] as String?,
        executedTools: getDataList(data['executedTools']),
      );

  static GroqResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? GroqResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'model_used': _modelUsed,
        'prompt_tokens': _promptTokens,
        'completion_tokens': _completionTokens,
        'total_tokens': _totalTokens,
        'timestamp': _timestamp,
        'is_agentic_model': _isAgenticModel,
        'success': _success,
        'error_message': _errorMessage,
        'executedTools': _executedTools,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'model_used': serializeParam(
          _modelUsed,
          ParamType.String,
        ),
        'prompt_tokens': serializeParam(
          _promptTokens,
          ParamType.int,
        ),
        'completion_tokens': serializeParam(
          _completionTokens,
          ParamType.int,
        ),
        'total_tokens': serializeParam(
          _totalTokens,
          ParamType.int,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.String,
        ),
        'is_agentic_model': serializeParam(
          _isAgenticModel,
          ParamType.bool,
        ),
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'error_message': serializeParam(
          _errorMessage,
          ParamType.String,
        ),
        'executedTools': serializeParam(
          _executedTools,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static GroqResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      GroqResponseStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        modelUsed: deserializeParam(
          data['model_used'],
          ParamType.String,
          false,
        ),
        promptTokens: deserializeParam(
          data['prompt_tokens'],
          ParamType.int,
          false,
        ),
        completionTokens: deserializeParam(
          data['completion_tokens'],
          ParamType.int,
          false,
        ),
        totalTokens: deserializeParam(
          data['total_tokens'],
          ParamType.int,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.String,
          false,
        ),
        isAgenticModel: deserializeParam(
          data['is_agentic_model'],
          ParamType.bool,
          false,
        ),
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        errorMessage: deserializeParam(
          data['error_message'],
          ParamType.String,
          false,
        ),
        executedTools: deserializeParam<String>(
          data['executedTools'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'GroqResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GroqResponseStruct &&
        content == other.content &&
        modelUsed == other.modelUsed &&
        promptTokens == other.promptTokens &&
        completionTokens == other.completionTokens &&
        totalTokens == other.totalTokens &&
        timestamp == other.timestamp &&
        isAgenticModel == other.isAgenticModel &&
        success == other.success &&
        errorMessage == other.errorMessage &&
        listEquality.equals(executedTools, other.executedTools);
  }

  @override
  int get hashCode => const ListEquality().hash([
        content,
        modelUsed,
        promptTokens,
        completionTokens,
        totalTokens,
        timestamp,
        isAgenticModel,
        success,
        errorMessage,
        executedTools
      ]);
}

GroqResponseStruct createGroqResponseStruct({
  String? content,
  String? modelUsed,
  int? promptTokens,
  int? completionTokens,
  int? totalTokens,
  String? timestamp,
  bool? isAgenticModel,
  bool? success,
  String? errorMessage,
}) =>
    GroqResponseStruct(
      content: content,
      modelUsed: modelUsed,
      promptTokens: promptTokens,
      completionTokens: completionTokens,
      totalTokens: totalTokens,
      timestamp: timestamp,
      isAgenticModel: isAgenticModel,
      success: success,
      errorMessage: errorMessage,
    );
