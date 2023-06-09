// Mocks generated by Mockito 5.4.0 from annotations
// in sports_app/test/features/scores/data/repository/scores_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sports_app/core/network/network_info.dart' as _i7;
import 'package:sports_app/features/scores/data/datasources/scores_remote_data_source.dart'
    as _i3;
import 'package:sports_app/features/scores/data/models/scores_model.dart'
    as _i5;
import 'package:sports_app/features/scores/data/models/sport_model.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ScoresRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockScoresRemoteDataSourceImpl extends _i1.Mock
    implements _i3.ScoresRemoteDataSourceImpl {
  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
        returnValueForMissingStub: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);
  @override
  _i4.Future<List<_i5.ScoresModel>> getScoresBySportKey(String? key) =>
      (super.noSuchMethod(
        Invocation.method(
          #getScoresBySportKey,
          [key],
        ),
        returnValue:
            _i4.Future<List<_i5.ScoresModel>>.value(<_i5.ScoresModel>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.ScoresModel>>.value(<_i5.ScoresModel>[]),
      ) as _i4.Future<List<_i5.ScoresModel>>);
  @override
  _i4.Future<List<_i6.SportModel>> getSportList() => (super.noSuchMethod(
        Invocation.method(
          #getSportList,
          [],
        ),
        returnValue: _i4.Future<List<_i6.SportModel>>.value(<_i6.SportModel>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i6.SportModel>>.value(<_i6.SportModel>[]),
      ) as _i4.Future<List<_i6.SportModel>>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}
