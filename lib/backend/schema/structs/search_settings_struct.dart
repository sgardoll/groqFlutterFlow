// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchSettingsStruct extends BaseStruct {
  SearchSettingsStruct({
    List<String>? excludeDomains,
    List<String>? includeDomains,
    String? country,
  })  : _excludeDomains = excludeDomains,
        _includeDomains = includeDomains,
        _country = country;

  // "excludeDomains" field.
  List<String>? _excludeDomains;
  List<String> get excludeDomains => _excludeDomains ?? const [];
  set excludeDomains(List<String>? val) => _excludeDomains = val;

  void updateExcludeDomains(Function(List<String>) updateFn) {
    updateFn(_excludeDomains ??= []);
  }

  bool hasExcludeDomains() => _excludeDomains != null;

  // "includeDomains" field.
  List<String>? _includeDomains;
  List<String> get includeDomains => _includeDomains ?? const [];
  set includeDomains(List<String>? val) => _includeDomains = val;

  void updateIncludeDomains(Function(List<String>) updateFn) {
    updateFn(_includeDomains ??= []);
  }

  bool hasIncludeDomains() => _includeDomains != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  static SearchSettingsStruct fromMap(Map<String, dynamic> data) =>
      SearchSettingsStruct(
        excludeDomains: getDataList(data['excludeDomains']),
        includeDomains: getDataList(data['includeDomains']),
        country: data['country'] as String?,
      );

  static SearchSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'excludeDomains': _excludeDomains,
        'includeDomains': _includeDomains,
        'country': _country,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'excludeDomains': serializeParam(
          _excludeDomains,
          ParamType.String,
          isList: true,
        ),
        'includeDomains': serializeParam(
          _includeDomains,
          ParamType.String,
          isList: true,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
      }.withoutNulls;

  static SearchSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchSettingsStruct(
        excludeDomains: deserializeParam<String>(
          data['excludeDomains'],
          ParamType.String,
          true,
        ),
        includeDomains: deserializeParam<String>(
          data['includeDomains'],
          ParamType.String,
          true,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SearchSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SearchSettingsStruct &&
        listEquality.equals(excludeDomains, other.excludeDomains) &&
        listEquality.equals(includeDomains, other.includeDomains) &&
        country == other.country;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([excludeDomains, includeDomains, country]);
}

SearchSettingsStruct createSearchSettingsStruct({
  String? country,
}) =>
    SearchSettingsStruct(
      country: country,
    );
