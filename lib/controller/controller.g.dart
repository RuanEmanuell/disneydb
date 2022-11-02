// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on _Controller, Store {
  late final _$loadingAtom = Atom(name: '_Controller.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$jsonAtom = Atom(name: '_Controller.json', context: context);

  @override
  dynamic get json {
    _$jsonAtom.reportRead();
    return super.json;
  }

  @override
  set json(dynamic value) {
    _$jsonAtom.reportWrite(value, super.json, () {
      super.json = value;
    });
  }

  late final _$fetchDataAsyncAction = AsyncAction('_Controller.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
json: ${json}
    ''';
  }
}
