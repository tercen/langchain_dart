// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: CreateMessageRequest
// ==========================================

/// The request parameters for creating a message.
@freezed
class CreateMessageRequest with _$CreateMessageRequest {
  const CreateMessageRequest._();

  /// Factory constructor for CreateMessageRequest
  const factory CreateMessageRequest({
    /// The model that will complete your prompt.
    ///
    /// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    /// details and options.
    @_ModelConverter() required Model model,

    /// Input messages.
    ///
    /// Our models are trained to operate on alternating `user` and `assistant`
    /// conversational turns. When creating a new `Message`, you specify the prior
    /// conversational turns with the `messages` parameter, and the model then generates
    /// the next `Message` in the conversation.
    ///
    /// Each input message must be an object with a `role` and `content`. You can
    /// specify a single `user`-role message, or you can include multiple `user` and
    /// `assistant` messages. The first message must always use the `user` role.
    ///
    /// If the final message uses the `assistant` role, the response content will
    /// continue immediately from the content in that message. This can be used to
    /// constrain part of the model's response.
    ///
    /// See [message content](https://docs.anthropic.com/en/api/messages-content) for
    /// details on how to construct valid message objects.
    ///
    /// Example with a single `user` message:
    ///
    /// ```json
    /// [{ "role": "user", "content": "Hello, Claude" }]
    /// ```
    ///
    /// Example with multiple conversational turns:
    ///
    /// ```json
    /// [
    ///   { "role": "user", "content": "Hello there." },
    ///   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
    ///   { "role": "user", "content": "Can you explain LLMs in plain English?" }
    /// ]
    /// ```
    ///
    /// Example with a partially-filled response from Claude:
    ///
    /// ```json
    /// [
    ///   {
    ///     "role": "user",
    ///     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
    ///   },
    ///   { "role": "assistant", "content": "The best answer is (" }
    /// ]
    /// ```
    ///
    /// Each input message `content` may be either a single `string` or an array of
    /// content blocks, where each block has a specific `type`. Using a `string` for
    /// `content` is shorthand for an array of one content block of type `"text"`. The
    /// following input messages are equivalent:
    ///
    /// ```json
    /// { "role": "user", "content": "Hello, Claude" }
    /// ```
    ///
    /// ```json
    /// { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
    /// ```
    ///
    /// Starting with Claude 3 models, you can also send image content blocks:
    ///
    /// ```json
    /// {
    ///   "role": "user",
    ///   "content": [
    ///     {
    ///       "type": "image",
    ///       "source": {
    ///         "type": "base64",
    ///         "media_type": "image/jpeg",
    ///         "data": "/9j/4AAQSkZJRg..."
    ///       }
    ///     },
    ///     { "type": "text", "text": "What is in this image?" }
    ///   ]
    /// }
    /// ```
    ///
    /// We currently support the `base64` source type for images, and the `image/jpeg`,
    /// `image/png`, `image/gif`, and `image/webp` media types.
    ///
    /// See [examples](https://docs.anthropic.com/en/api/messages-examples) for more
    /// input examples.
    ///
    /// Note that if you want to include a
    /// [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
    /// the top-level `system` parameter — there is no `"system"` role for input
    /// messages in the Messages API.
    required List<Message> messages,

    /// An object describing extended thinking about the request.
    @JsonKey(includeIfNull: false) Thinking? thinking,

    /// The maximum number of tokens to generate before stopping.
    ///
    /// Note that our models may stop _before_ reaching this maximum. This parameter
    /// only specifies the absolute maximum number of tokens to generate.
    ///
    /// Different models have different maximum values for this parameter. See
    /// [models](https://docs.anthropic.com/en/docs/models-overview) for details.
    @JsonKey(name: 'max_tokens') required int maxTokens,

    /// An object describing metadata about the request.
    @JsonKey(includeIfNull: false) CreateMessageRequestMetadata? metadata,

    /// Custom text sequences that will cause the model to stop generating.
    ///
    /// Our models will normally stop when they have naturally completed their turn,
    /// which will result in a response `stop_reason` of `"end_turn"`.
    ///
    /// If you want the model to stop generating when it encounters custom strings of
    /// text, you can use the `stop_sequences` parameter. If the model encounters one of
    /// the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
    /// and the response `stop_sequence` value will contain the matched stop sequence.
    @JsonKey(name: 'stop_sequences', includeIfNull: false)
    List<String>? stopSequences,

    /// System prompt.
    ///
    /// A system prompt is a way of providing context and instructions to Claude, such
    /// as specifying a particular goal or role. See our
    /// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
    @_CreateMessageRequestSystemConverter()
    @JsonKey(includeIfNull: false)
    CreateMessageRequestSystem? system,

    /// Amount of randomness injected into the response.
    ///
    /// Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
    /// for analytical / multiple choice, and closer to `1.0` for creative and
    /// generative tasks.
    ///
    /// Note that even with `temperature` of `0.0`, the results will not be fully
    /// deterministic.
    @JsonKey(includeIfNull: false) double? temperature,

    /// How the model should use the provided tools. The model can use a specific tool,
    /// any available tool, or decide by itself.
    ///
    /// - `auto`: allows Claude to decide whether to call any provided tools or not. This is the default value.
    /// - `any`: tells Claude that it must use one of the provided tools, but doesn’t force a particular tool.
    /// - `tool`: allows us to force Claude to always use a particular tool specified in the `name` field.
    @JsonKey(name: 'tool_choice', includeIfNull: false) ToolChoice? toolChoice,

    /// Definitions of tools that the model may use.
    ///
    /// If you include `tools` in your API request, the model may return `tool_use`
    /// content blocks that represent the model's use of those tools. You can then run
    /// those tools using the tool input generated by the model and then optionally
    /// return results back to the model using `tool_result` content blocks.
    ///
    /// Each tool definition includes:
    ///
    /// - `name`: Name of the tool.
    /// - `description`: Optional, but strongly-recommended description of the tool.
    /// - `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input`
    ///   shape that the model will produce in `tool_use` output content blocks.
    ///
    /// For example, if you defined `tools` as:
    ///
    /// ```json
    /// [
    ///   {
    ///     "name": "get_stock_price",
    ///     "description": "Get the current stock price for a given ticker symbol.",
    ///     "input_schema": {
    ///       "type": "object",
    ///       "properties": {
    ///         "ticker": {
    ///           "type": "string",
    ///           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
    ///         }
    ///       },
    ///       "required": ["ticker"]
    ///     }
    ///   }
    /// ]
    /// ```
    ///
    /// And then asked the model "What's the S&P 500 at today?", the model might produce
    /// `tool_use` content blocks in the response like this:
    ///
    /// ```json
    /// [
    ///   {
    ///     "type": "tool_use",
    ///     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
    ///     "name": "get_stock_price",
    ///     "input": { "ticker": "^GSPC" }
    ///   }
    /// ]
    /// ```
    ///
    /// You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
    /// input, and return the following back to the model in a subsequent `user`
    /// message:
    ///
    /// ```json
    /// [
    ///   {
    ///     "type": "tool_result",
    ///     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
    ///     "content": "259.75 USD"
    ///   }
    /// ]
    /// ```
    ///
    /// Tools can be used for workflows that include running client-side tools and
    /// functions, or more generally whenever you want the model to produce a particular
    /// JSON structure of output.
    ///
    /// See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
    @JsonKey(includeIfNull: false) List<Tool>? tools,

    /// Only sample from the top K options for each subsequent token.
    ///
    /// Used to remove "long tail" low probability responses.
    /// [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
    ///
    /// Recommended for advanced use cases only. You usually only need to use
    /// `temperature`.
    @JsonKey(name: 'top_k', includeIfNull: false) int? topK,

    /// Use nucleus sampling.
    ///
    /// In nucleus sampling, we compute the cumulative distribution over all the options
    /// for each subsequent token in decreasing probability order and cut it off once it
    /// reaches a particular probability specified by `top_p`. You should either alter
    /// `temperature` or `top_p`, but not both.
    ///
    /// Recommended for advanced use cases only. You usually only need to use
    /// `temperature`.
    @JsonKey(name: 'top_p', includeIfNull: false) double? topP,

    /// Whether to incrementally stream the response using server-sent events.
    ///
    /// See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
    /// details.
    @Default(false) bool stream,
  }) = _CreateMessageRequest;

  /// Object construction from a JSON representation
  factory CreateMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageRequestFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = [
    'model',
    'messages',
    'thinking',
    'max_tokens',
    'metadata',
    'stop_sequences',
    'system',
    'temperature',
    'tool_choice',
    'tools',
    'top_k',
    'top_p',
    'stream'
  ];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'messages': messages,
      'thinking': thinking,
      'max_tokens': maxTokens,
      'metadata': metadata,
      'stop_sequences': stopSequences,
      'system': system,
      'temperature': temperature,
      'tool_choice': toolChoice,
      'tools': tools,
      'top_k': topK,
      'top_p': topP,
      'stream': stream,
    };
  }
}

// ==========================================
// ENUM: Models
// ==========================================

/// Available models. Mind that the list may not be exhaustive nor up-to-date.
enum Models {
  @JsonValue('claude-3-5-sonnet-latest')
  claude35SonnetLatest,
  @JsonValue('claude-3-5-sonnet-20241022')
  claude35Sonnet20241022,
  @JsonValue('claude-3-5-sonnet-20240620')
  claude35Sonnet20240620,
  @JsonValue('claude-3-opus-latest')
  claude3OpusLatest,
  @JsonValue('claude-3-opus-20240229')
  claude3Opus20240229,
  @JsonValue('claude-3-sonnet-20240229')
  claude3Sonnet20240229,
  @JsonValue('claude-3-haiku-20240307')
  claude3Haiku20240307,
  @JsonValue('claude-2.1')
  claude21,
  @JsonValue('claude-2.0')
  claude20,
}

// ==========================================
// CLASS: Model
// ==========================================

/// The model that will complete your prompt.
///
/// See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
/// details and options.
@freezed
sealed class Model with _$Model {
  const Model._();

  /// Available models. Mind that the list may not be exhaustive nor up-to-date.
  const factory Model.model(
    Models value,
  ) = ModelCatalog;

  /// The ID of the model to use for this request.
  const factory Model.modelId(
    String value,
  ) = ModelId;

  /// Object construction from a JSON representation
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

/// Custom JSON converter for [Model]
class _ModelConverter implements JsonConverter<Model, Object?> {
  const _ModelConverter();

  @override
  Model fromJson(Object? data) {
    if (data is String && _$ModelsEnumMap.values.contains(data)) {
      return ModelCatalog(
        _$ModelsEnumMap.keys.elementAt(
          _$ModelsEnumMap.values.toList().indexOf(data),
        ),
      );
    }
    if (data is String) {
      return ModelId(data);
    }
    throw Exception(
      'Unexpected value for Model: $data',
    );
  }

  @override
  Object? toJson(Model data) {
    return switch (data) {
      ModelCatalog(value: final v) => _$ModelsEnumMap[v]!,
      ModelId(value: final v) => v,
    };
  }
}

// ==========================================
// CLASS: CreateMessageRequestSystem
// ==========================================

/// System prompt.
///
/// A system prompt is a way of providing context and instructions to Claude, such
/// as specifying a particular goal or role. See our
/// [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
@freezed
sealed class CreateMessageRequestSystem with _$CreateMessageRequestSystem {
  const CreateMessageRequestSystem._();

  /// An array of content blocks.
  const factory CreateMessageRequestSystem.blocks(
    List<Block> value,
  ) = SystemMessageContentBlocks;

  /// A single text block.
  const factory CreateMessageRequestSystem.text(
    String value,
  ) = SystemMessageContentText;

  /// Object construction from a JSON representation
  factory CreateMessageRequestSystem.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageRequestSystemFromJson(json);
}

/// Custom JSON converter for [CreateMessageRequestSystem]
class _CreateMessageRequestSystemConverter
    implements JsonConverter<CreateMessageRequestSystem?, Object?> {
  const _CreateMessageRequestSystemConverter();

  @override
  CreateMessageRequestSystem? fromJson(Object? data) {
    if (data == null) {
      return null;
    }
    if (data is List && data.every((item) => item is Map)) {
      return SystemMessageContentBlocks(data
          .map((i) => Block.fromJson(i as Map<String, dynamic>))
          .toList(growable: false));
    }
    if (data is String) {
      return SystemMessageContentText(data);
    }
    throw Exception(
      'Unexpected value for CreateMessageRequestSystem: $data',
    );
  }

  @override
  Object? toJson(CreateMessageRequestSystem? data) {
    return switch (data) {
      SystemMessageContentBlocks(value: final v) => v,
      SystemMessageContentText(value: final v) => v,
      null => null,
    };
  }
}
