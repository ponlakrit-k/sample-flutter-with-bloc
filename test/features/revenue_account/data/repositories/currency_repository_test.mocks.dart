// Mocks generated by Mockito 5.4.2 from annotations
// in sample_flutter_with_bloc/test/features/revenue_account/data/repositories/currency_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sample_flutter_with_bloc/features/revenue_account/data/datasources/currency_datasource.dart'
    as _i3;
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/currency_model.dart'
    as _i2;

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

class _FakeCurrencyModel_0 extends _i1.SmartFake implements _i2.CurrencyModel {
  _FakeCurrencyModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CurrencyDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockCurrencyDataSource extends _i1.Mock
    implements _i3.CurrencyDataSource {
  MockCurrencyDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.CurrencyModel> getCurrencyFromTHBToUSD(double? amountTHB) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrencyFromTHBToUSD,
          [amountTHB],
        ),
        returnValue: _i4.Future<_i2.CurrencyModel>.value(_FakeCurrencyModel_0(
          this,
          Invocation.method(
            #getCurrencyFromTHBToUSD,
            [amountTHB],
          ),
        )),
      ) as _i4.Future<_i2.CurrencyModel>);
}