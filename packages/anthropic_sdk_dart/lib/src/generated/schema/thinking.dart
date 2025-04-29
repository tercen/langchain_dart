// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: invalid_annotation_target
part of anthropic_schema;

// ==========================================
// CLASS: Thinking
// ==========================================

/// An object describing extended thinking about the request.
@freezed
class Thinking with _$Thinking {
  const Thinking._();

  /// Factory constructor for Thinking
  const factory Thinking({
    /// Enable extended thinking.
    @Default('disabled') String type,

    /// Token budget.
    @JsonKey(name: 'budget_tokens', includeIfNull: false) int? budgetTokens,
  }) = _Thinking;

  /// Object construction from a JSON representation
  factory Thinking.fromJson(Map<String, dynamic> json) =>
      _$ThinkingFromJson(json);

  /// List of all property names of schema
  static const List<String> propertyNames = ['type', 'budget_tokens'];

  /// Perform validations on the schema property values
  String? validateSchema() {
    return null;
  }

  /// Map representation of object (not serialized)
  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'budget_tokens': budgetTokens,
    };
  }
}
