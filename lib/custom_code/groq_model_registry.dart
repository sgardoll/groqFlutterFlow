import '../backend/schema/structs/index.dart';

class GroqModelRegistry {
  static final GroqModelRegistry _instance = GroqModelRegistry._internal();
  factory GroqModelRegistry() => _instance;
  GroqModelRegistry._internal();

  static final List<GroqModelStruct> _models = [
    // Kimi K2 Instruct - Agentic flagship model
    GroqModelStruct(
      id: 'kimi-k2-instruct',
      name: 'moonshotai/kimi-k2-instruct',
      displayName: 'Kimi K2 Instruct',
      description:
          'Advanced agentic model with 1T parameters and sophisticated tool use capabilities. Ideal for complex reasoning and multi-step tasks.',
      provider: 'Moonshot AI',
      maxTokens: 4096,
      contextWindow: 131072,
      isAgentic: true,
      isMultiModal: false,
      supportedResponseFormats: ['text', 'json'],
      tokensPerSecond: 200,
      maxImages: 0,
      maxImageSizeMb: 0,
      maxImageResolutionMp: 0,
      category: 'agentic',
      supportsToolUse: true,
      supportsJsonMode: true,
      isActive: true,
    ),

    // Qwen 3 32B - High-performance agentic model
    GroqModelStruct(
      id: 'qwen3-32b',
      name: 'qwen/qwen3-32b',
      displayName: 'Qwen 3 32B',
      description:
          'Fast agentic model with advanced reasoning and multilingual support. Excellent for complex problem-solving and agent workflows.',
      provider: 'Alibaba Cloud',
      maxTokens: 4096,
      contextWindow: 32768,
      isAgentic: true,
      isMultiModal: false,
      supportedResponseFormats: ['text', 'json'],
      tokensPerSecond: 400,
      maxImages: 0,
      maxImageSizeMb: 0,
      maxImageResolutionMp: 0,
      category: 'agentic',
      supportsToolUse: true,
      supportsJsonMode: true,
      isActive: true,
    ),

    // Llama 4 Scout - Multi-modal vision model
    GroqModelStruct(
      id: 'llama-4-scout-17b',
      name: 'meta-llama/llama-4-scout-17b-16e-instruct',
      displayName: 'Llama 4 Scout 17B',
      description:
          'Powerful multimodal model capable of processing both text and images. Perfect for visual analysis, OCR, and image understanding tasks.',
      provider: 'Meta',
      maxTokens: 4096,
      contextWindow: 128000,
      isAgentic: false,
      isMultiModal: true,
      supportedResponseFormats: ['text', 'json'],
      tokensPerSecond: 300,
      maxImages: 5,
      maxImageSizeMb: 20,
      maxImageResolutionMp: 33,
      category: 'multimodal',
      supportsToolUse: true,
      supportsJsonMode: true,
      isActive: true,
    ),

    // Llama 4 Maverick - Alternative multi-modal model
    GroqModelStruct(
      id: 'llama-4-maverick-17b',
      name: 'meta-llama/llama-4-maverick-17b-128e-instruct',
      displayName: 'Llama 4 Maverick 17B',
      description:
          'Alternative multimodal model with identical capabilities to Scout. Optimized for visual question answering and caption generation.',
      provider: 'Meta',
      maxTokens: 4096,
      contextWindow: 128000,
      isAgentic: false,
      isMultiModal: true,
      supportedResponseFormats: ['text', 'json'],
      tokensPerSecond: 300,
      maxImages: 5,
      maxImageSizeMb: 20,
      maxImageResolutionMp: 33,
      category: 'multimodal',
      supportsToolUse: true,
      supportsJsonMode: true,
      isActive: true,
    ),

    // Llama 3.3 70B - General purpose fallback
    GroqModelStruct(
      id: 'llama-3.3-70b-versatile',
      name: 'llama-3.3-70b-versatile',
      displayName: 'Llama 3.3 70B Versatile',
      description:
          'Fast general-purpose model for standard chat and reasoning tasks. Reliable fallback option with strong performance across domains.',
      provider: 'Meta',
      maxTokens: 8192,
      contextWindow: 131072,
      isAgentic: false,
      isMultiModal: false,
      supportedResponseFormats: ['text', 'json'],
      tokensPerSecond: 400,
      maxImages: 0,
      maxImageSizeMb: 0,
      maxImageResolutionMp: 0,
      category: 'general',
      supportsToolUse: false,
      supportsJsonMode: true,
      isActive: true,
    ),

    // Compound Beta - Existing compound model for research
    GroqModelStruct(
      id: 'compound-beta',
      name: 'compound-beta',
      displayName: 'Compound Beta',
      description:
          'Uses Llama 4 Scout for reasoning and Llama 3.3 70B for tool use. Supports multiple tool calls per query for research and current events.',
      provider: 'Groq',
      maxTokens: 4096,
      contextWindow: 128000,
      isAgentic: true,
      isMultiModal: true,
      supportedResponseFormats: ['text', 'json'],
      tokensPerSecond: 250,
      maxImages: 5,
      maxImageSizeMb: 20,
      maxImageResolutionMp: 33,
      category: 'compound',
      supportsToolUse: true,
      supportsJsonMode: true,
      isActive: true,
    ),

    // Compound Beta Mini - Lightweight compound model
    GroqModelStruct(
      id: 'compound-beta-mini',
      name: 'compound-beta-mini',
      displayName: 'Compound Beta Mini',
      description:
          'Faster version that supports one tool call per request. Ideal for lightweight calculations and low-latency tasks.',
      provider: 'Groq',
      maxTokens: 4096,
      contextWindow: 128000,
      isAgentic: false,
      isMultiModal: false,
      supportedResponseFormats: ['text', 'json'],
      tokensPerSecond: 350,
      maxImages: 0,
      maxImageSizeMb: 0,
      maxImageResolutionMp: 0,
      category: 'compound',
      supportsToolUse: true,
      supportsJsonMode: true,
      isActive: true,
    ),
  ];

  /// Get all available models
  static List<GroqModelStruct> getAllModels() {
    return List.from(_models.where((model) => model.isActive));
  }

  /// Get a specific model by ID
  static GroqModelStruct? getModelById(String id) {
    try {
      return _models.firstWhere((model) => model.id == id && model.isActive);
    } catch (e) {
      return null;
    }
  }

  /// Get a specific model by name (API name)
  static GroqModelStruct? getModelByName(String name) {
    try {
      return _models
          .firstWhere((model) => model.name == name && model.isActive);
    } catch (e) {
      return null;
    }
  }

  /// Get all agentic models
  static List<GroqModelStruct> getAgenticModels() {
    return _models.where((model) => model.isAgentic && model.isActive).toList();
  }

  /// Get all multi-modal models
  static List<GroqModelStruct> getMultiModalModels() {
    return _models
        .where((model) => model.isMultiModal && model.isActive)
        .toList();
  }

  /// Get models by category
  static List<GroqModelStruct> getModelsByCategory(String category) {
    return _models
        .where((model) => model.category == category && model.isActive)
        .toList();
  }

  /// Get models that support tool use
  static List<GroqModelStruct> getToolCapableModels() {
    return _models
        .where((model) => model.supportsToolUse && model.isActive)
        .toList();
  }

  /// Get fastest models (sorted by tokens per second)
  static List<GroqModelStruct> getFastestModels({int limit = 3}) {
    final sortedModels = List<GroqModelStruct>.from(_models);
    sortedModels.removeWhere((model) => !model.isActive);
    sortedModels.sort((a, b) => b.tokensPerSecond.compareTo(a.tokensPerSecond));
    return sortedModels.take(limit).toList();
  }

  /// Add a new model to the registry
  static void addModel(GroqModelStruct model) {
    final existingIndex = _models.indexWhere((m) => m.id == model.id);
    if (existingIndex != -1) {
      _models[existingIndex] = model;
    } else {
      _models.add(model);
    }
  }

  /// Deactivate a model
  static void deactivateModel(String id) {
    final modelIndex = _models.indexWhere((m) => m.id == id);
    if (modelIndex != -1) {
      _models[modelIndex] = GroqModelStruct(
        id: _models[modelIndex].id,
        name: _models[modelIndex].name,
        displayName: _models[modelIndex].displayName,
        description: _models[modelIndex].description,
        provider: _models[modelIndex].provider,
        maxTokens: _models[modelIndex].maxTokens,
        contextWindow: _models[modelIndex].contextWindow,
        isAgentic: _models[modelIndex].isAgentic,
        isMultiModal: _models[modelIndex].isMultiModal,
        supportedResponseFormats: _models[modelIndex].supportedResponseFormats,
        tokensPerSecond: _models[modelIndex].tokensPerSecond,
        maxImages: _models[modelIndex].maxImages,
        maxImageSizeMb: _models[modelIndex].maxImageSizeMb,
        maxImageResolutionMp: _models[modelIndex].maxImageResolutionMp,
        category: _models[modelIndex].category,
        supportsToolUse: _models[modelIndex].supportsToolUse,
        supportsJsonMode: _models[modelIndex].supportsJsonMode,
        isActive: false,
      );
    }
  }

  /// Get models grouped by category
  static Map<String, List<GroqModelStruct>> getModelsByCategories() {
    final Map<String, List<GroqModelStruct>> categorizedModels = {};

    for (final model in _models.where((m) => m.isActive)) {
      final category = model.category;
      if (!categorizedModels.containsKey(category)) {
        categorizedModels[category] = [];
      }
      categorizedModels[category]!.add(model);
    }

    return categorizedModels;
  }
}

/// Helper function to get all models (for FlutterFlow custom functions)
Future<List<GroqModelStruct>> getAllGroqModels() async {
  return GroqModelRegistry.getAllModels();
}

/// Helper function to get a model by ID (for FlutterFlow custom functions)
Future<GroqModelStruct?> getGroqModelById(String id) async {
  return GroqModelRegistry.getModelById(id);
}

/// Helper function to get agentic models (for FlutterFlow custom functions)
Future<List<GroqModelStruct>> getAgenticGroqModels() async {
  return GroqModelRegistry.getAgenticModels();
}

/// Helper function to get multi-modal models (for FlutterFlow custom functions)
Future<List<GroqModelStruct>> getMultiModalGroqModels() async {
  return GroqModelRegistry.getMultiModalModels();
}
