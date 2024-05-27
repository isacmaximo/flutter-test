// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  late final _$listPrductAtom =
      Atom(name: 'ProductControllerBase.listPrduct', context: context);

  @override
  ObservableList<ProductStore> get listPrduct {
    _$listPrductAtom.reportRead();
    return super.listPrduct;
  }

  @override
  set listPrduct(ObservableList<ProductStore> value) {
    _$listPrductAtom.reportWrite(value, super.listPrduct, () {
      super.listPrduct = value;
    });
  }

  late final _$ProductControllerBaseActionController =
      ActionController(name: 'ProductControllerBase', context: context);

  @override
  void clearAllControllers() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.clearAllControllers');
    try {
      return super.clearAllControllers();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(int index, BuildContext context) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.removeProduct');
    try {
      return super.removeProduct(index, context);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editProdut(int index, ProductStore product, BuildContext context) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.editProdut');
    try {
      return super.editProdut(index, product, context);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addProduct(BuildContext context) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.addProduct');
    try {
      return super.addProduct(context);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPrduct: ${listPrduct}
    ''';
  }
}
