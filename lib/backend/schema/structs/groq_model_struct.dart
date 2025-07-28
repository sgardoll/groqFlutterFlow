// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GroqModelStruct extends BaseStruct {
  GroqModelStruct({
    String? id,
    String? name,
    String? displayName,
    String? description,
    String? provider,
    int? maxTokens,
    int? contextWindow,
    bool? isAgentic,
    bool? modelProvider,
    List<String>? supportedResponseFormats,
    int? tokensPerSecond,
    int? maxImages,
    int? maxImageSizeMb,
    int? maxImageResolutionMp,
    bool? supportsToolUse,
    bool? supportsJsonMode,
    bool? isActive,
    bool? isMultiModal,
    String? category,
  })  : _id = id,
        _name = name,
        _displayName = displayName,
        _description = description,
        _provider = provider,
        _maxTokens = maxTokens,
        _contextWindow = contextWindow,
        _isAgentic = isAgentic,
        _modelProvider = modelProvider,
        _supportedResponseFormats = supportedResponseFormats,
        _tokensPerSecond = tokensPerSecond,
        _maxImages = maxImages,
        _maxImageSizeMb = maxImageSizeMb,
        _maxImageResolutionMp = maxImageResolutionMp,
        _supportsToolUse = supportsToolUse,
        _supportsJsonMode = supportsJsonMode,
        _isActive = isActive,
        _isMultiModal = isMultiModal,
        _category = category;

  // "id" field.
  String? _id;
  String get id => _id ?? 'llama-3.3-70b-versatile';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? 'llama-3.3-70b-versatile';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? 'Llama 3.3 70B Versatile';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "provider" field.
  String? _provider;
  String get provider => _provider ?? '';
  set provider(String? val) => _provider = val;

  bool hasProvider() => _provider != null;

  // "maxTokens" field.
  int? _maxTokens;
  int get maxTokens => _maxTokens ?? 0;
  set maxTokens(int? val) => _maxTokens = val;

  void incrementMaxTokens(int amount) => maxTokens = maxTokens + amount;

  bool hasMaxTokens() => _maxTokens != null;

  // "contextWindow" field.
  int? _contextWindow;
  int get contextWindow => _contextWindow ?? 0;
  set contextWindow(int? val) => _contextWindow = val;

  void incrementContextWindow(int amount) =>
      contextWindow = contextWindow + amount;

  bool hasContextWindow() => _contextWindow != null;

  // "isAgentic" field.
  bool? _isAgentic;
  bool get isAgentic => _isAgentic ?? false;
  set isAgentic(bool? val) => _isAgentic = val;

  bool hasIsAgentic() => _isAgentic != null;

  // "modelProvider" field.
  bool? _modelProvider;
  bool get modelProvider => _modelProvider ?? false;
  set modelProvider(bool? val) => _modelProvider = val;

  bool hasModelProvider() => _modelProvider != null;

  // "supportedResponseFormats" field.
  List<String>? _supportedResponseFormats;
  List<String> get supportedResponseFormats =>
      _supportedResponseFormats ?? const [];
  set supportedResponseFormats(List<String>? val) =>
      _supportedResponseFormats = val;

  void updateSupportedResponseFormats(Function(List<String>) updateFn) {
    updateFn(_supportedResponseFormats ??= []);
  }

  bool hasSupportedResponseFormats() => _supportedResponseFormats != null;

  // "tokensPerSecond" field.
  int? _tokensPerSecond;
  int get tokensPerSecond => _tokensPerSecond ?? 0;
  set tokensPerSecond(int? val) => _tokensPerSecond = val;

  void incrementTokensPerSecond(int amount) =>
      tokensPerSecond = tokensPerSecond + amount;

  bool hasTokensPerSecond() => _tokensPerSecond != null;

  // "maxImages" field.
  int? _maxImages;
  int get maxImages => _maxImages ?? 0;
  set maxImages(int? val) => _maxImages = val;

  void incrementMaxImages(int amount) => maxImages = maxImages + amount;

  bool hasMaxImages() => _maxImages != null;

  // "maxImageSizeMb" field.
  int? _maxImageSizeMb;
  int get maxImageSizeMb => _maxImageSizeMb ?? 0;
  set maxImageSizeMb(int? val) => _maxImageSizeMb = val;

  void incrementMaxImageSizeMb(int amount) =>
      maxImageSizeMb = maxImageSizeMb + amount;

  bool hasMaxImageSizeMb() => _maxImageSizeMb != null;

  // "maxImageResolutionMp" field.
  int? _maxImageResolutionMp;
  int get maxImageResolutionMp => _maxImageResolutionMp ?? 0;
  set maxImageResolutionMp(int? val) => _maxImageResolutionMp = val;

  void incrementMaxImageResolutionMp(int amount) =>
      maxImageResolutionMp = maxImageResolutionMp + amount;

  bool hasMaxImageResolutionMp() => _maxImageResolutionMp != null;

  // "supportsToolUse" field.
  bool? _supportsToolUse;
  bool get supportsToolUse => _supportsToolUse ?? false;
  set supportsToolUse(bool? val) => _supportsToolUse = val;

  bool hasSupportsToolUse() => _supportsToolUse != null;

  // "supportsJsonMode" field.
  bool? _supportsJsonMode;
  bool get supportsJsonMode => _supportsJsonMode ?? false;
  set supportsJsonMode(bool? val) => _supportsJsonMode = val;

  bool hasSupportsJsonMode() => _supportsJsonMode != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

  // "isMultiModal" field.
  bool? _isMultiModal;
  bool get isMultiModal => _isMultiModal ?? false;
  set isMultiModal(bool? val) => _isMultiModal = val;

  bool hasIsMultiModal() => _isMultiModal != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  static GroqModelStruct fromMap(Map<String, dynamic> data) => GroqModelStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        displayName: data['displayName'] as String?,
        description: data['description'] as String?,
        provider: data['provider'] as String?,
        maxTokens: castToType<int>(data['maxTokens']),
        contextWindow: castToType<int>(data['contextWindow']),
        isAgentic: data['isAgentic'] as bool?,
        modelProvider: data['modelProvider'] as bool?,
        supportedResponseFormats: getDataList(data['supportedResponseFormats']),
        tokensPerSecond: castToType<int>(data['tokensPerSecond']),
        maxImages: castToType<int>(data['maxImages']),
        maxImageSizeMb: castToType<int>(data['maxImageSizeMb']),
        maxImageResolutionMp: castToType<int>(data['maxImageResolutionMp']),
        supportsToolUse: data['supportsToolUse'] as bool?,
        supportsJsonMode: data['supportsJsonMode'] as bool?,
        isActive: data['isActive'] as bool?,
        isMultiModal: data['isMultiModal'] as bool?,
        category: data['category'] as String?,
      );

  static GroqModelStruct? maybeFromMap(dynamic data) => data is Map
      ? GroqModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'displayName': _displayName,
        'description': _description,
        'provider': _provider,
        'maxTokens': _maxTokens,
        'contextWindow': _contextWindow,
        'isAgentic': _isAgentic,
        'modelProvider': _modelProvider,
        'supportedResponseFormats': _supportedResponseFormats,
        'tokensPerSecond': _tokensPerSecond,
        'maxImages': _maxImages,
        'maxImageSizeMb': _maxImageSizeMb,
        'maxImageResolutionMp': _maxImageResolutionMp,
        'supportsToolUse': _supportsToolUse,
        'supportsJsonMode': _supportsJsonMode,
        'isActive': _isActive,
        'isMultiModal': _isMultiModal,
        'category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'displayName': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'provider': serializeParam(
          _provider,
          ParamType.String,
        ),
        'maxTokens': serializeParam(
          _maxTokens,
          ParamType.int,
        ),
        'contextWindow': serializeParam(
          _contextWindow,
          ParamType.int,
        ),
        'isAgentic': serializeParam(
          _isAgentic,
          ParamType.bool,
        ),
        'modelProvider': serializeParam(
          _modelProvider,
          ParamType.bool,
        ),
        'supportedResponseFormats': serializeParam(
          _supportedResponseFormats,
          ParamType.String,
          isList: true,
        ),
        'tokensPerSecond': serializeParam(
          _tokensPerSecond,
          ParamType.int,
        ),
        'maxImages': serializeParam(
          _maxImages,
          ParamType.int,
        ),
        'maxImageSizeMb': serializeParam(
          _maxImageSizeMb,
          ParamType.int,
        ),
        'maxImageResolutionMp': serializeParam(
          _maxImageResolutionMp,
          ParamType.int,
        ),
        'supportsToolUse': serializeParam(
          _supportsToolUse,
          ParamType.bool,
        ),
        'supportsJsonMode': serializeParam(
          _supportsJsonMode,
          ParamType.bool,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
        'isMultiModal': serializeParam(
          _isMultiModal,
          ParamType.bool,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
      }.withoutNulls;

  static GroqModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      GroqModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['displayName'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        provider: deserializeParam(
          data['provider'],
          ParamType.String,
          false,
        ),
        maxTokens: deserializeParam(
          data['maxTokens'],
          ParamType.int,
          false,
        ),
        contextWindow: deserializeParam(
          data['contextWindow'],
          ParamType.int,
          false,
        ),
        isAgentic: deserializeParam(
          data['isAgentic'],
          ParamType.bool,
          false,
        ),
        modelProvider: deserializeParam(
          data['modelProvider'],
          ParamType.bool,
          false,
        ),
        supportedResponseFormats: deserializeParam<String>(
          data['supportedResponseFormats'],
          ParamType.String,
          true,
        ),
        tokensPerSecond: deserializeParam(
          data['tokensPerSecond'],
          ParamType.int,
          false,
        ),
        maxImages: deserializeParam(
          data['maxImages'],
          ParamType.int,
          false,
        ),
        maxImageSizeMb: deserializeParam(
          data['maxImageSizeMb'],
          ParamType.int,
          false,
        ),
        maxImageResolutionMp: deserializeParam(
          data['maxImageResolutionMp'],
          ParamType.int,
          false,
        ),
        supportsToolUse: deserializeParam(
          data['supportsToolUse'],
          ParamType.bool,
          false,
        ),
        supportsJsonMode: deserializeParam(
          data['supportsJsonMode'],
          ParamType.bool,
          false,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
          false,
        ),
        isMultiModal: deserializeParam(
          data['isMultiModal'],
          ParamType.bool,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GroqModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is GroqModelStruct &&
        id == other.id &&
        name == other.name &&
        displayName == other.displayName &&
        description == other.description &&
        provider == other.provider &&
        maxTokens == other.maxTokens &&
        contextWindow == other.contextWindow &&
        isAgentic == other.isAgentic &&
        modelProvider == other.modelProvider &&
        listEquality.equals(
            supportedResponseFormats, other.supportedResponseFormats) &&
        tokensPerSecond == other.tokensPerSecond &&
        maxImages == other.maxImages &&
        maxImageSizeMb == other.maxImageSizeMb &&
        maxImageResolutionMp == other.maxImageResolutionMp &&
        supportsToolUse == other.supportsToolUse &&
        supportsJsonMode == other.supportsJsonMode &&
        isActive == other.isActive &&
        isMultiModal == other.isMultiModal &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        displayName,
        description,
        provider,
        maxTokens,
        contextWindow,
        isAgentic,
        modelProvider,
        supportedResponseFormats,
        tokensPerSecond,
        maxImages,
        maxImageSizeMb,
        maxImageResolutionMp,
        supportsToolUse,
        supportsJsonMode,
        isActive,
        isMultiModal,
        category
      ]);
}

GroqModelStruct createGroqModelStruct({
  String? id,
  String? name,
  String? displayName,
  String? description,
  String? provider,
  int? maxTokens,
  int? contextWindow,
  bool? isAgentic,
  bool? modelProvider,
  int? tokensPerSecond,
  int? maxImages,
  int? maxImageSizeMb,
  int? maxImageResolutionMp,
  bool? supportsToolUse,
  bool? supportsJsonMode,
  bool? isActive,
  bool? isMultiModal,
  String? category,
}) =>
    GroqModelStruct(
      id: id,
      name: name,
      displayName: displayName,
      description: description,
      provider: provider,
      maxTokens: maxTokens,
      contextWindow: contextWindow,
      isAgentic: isAgentic,
      modelProvider: modelProvider,
      tokensPerSecond: tokensPerSecond,
      maxImages: maxImages,
      maxImageSizeMb: maxImageSizeMb,
      maxImageResolutionMp: maxImageResolutionMp,
      supportsToolUse: supportsToolUse,
      supportsJsonMode: supportsJsonMode,
      isActive: isActive,
      isMultiModal: isMultiModal,
      category: category,
    );
