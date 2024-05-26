import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = ProductStoreBase with _$ProductStore;

abstract class ProductStoreBase with Store {
  @observable
  String? name;

  @observable
  double? price;

  ProductStoreBase({
    this.name,
    this.price,
  });
}
