import 'package:app_test1/app/models/product_store.dart';
import 'package:app_test1/app/modules/home/components/edit_dialog.dart';
import 'package:app_test1/app/shared/currency_util.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  //Lista de produtos iniciais
  @observable
  ObservableList<ProductStore> listPrduct = ObservableList<ProductStore>.of([
    ProductStore(
      name: 'Produto 1',
      price: 20.0,
    ),
    ProductStore(
      name: 'Produto 2',
      price: 15.0,
    ),
  ]);

  //Edit
  final nameController = TextEditingController();
  final priceController = MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
    leftSymbol: 'R\$ ',
  );

  @action
  void clearAllControllers() {
    nameController.clear();
    priceController.clear();
  }

  @action
  void removeProduct(int index) {
    listPrduct.removeAt(index);
  }

  @action
  void editProdut(int index, ProductStore product) {
    listPrduct[index] = product;
    clearAllControllers();
  }

  @action
  void addProduct() {
    listPrduct.add(
      ProductStore(
        name: nameController.text,
        price: CurrencyUtil.parseCurrency(
          priceController.text,
        ),
      ),
    );
    clearAllControllers();
  }

  showDialogToEdit(BuildContext context, int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return EditDialog(
          index: index,
          productStore: listPrduct[index],
          nameController: nameController,
          priceController: priceController,
          onPressedEdit: editProdut,
        );
      },
    ).then((value) => clearAllControllers());
  }
}
