import 'package:app_test1/app/models/product_store.dart';
import 'package:app_test1/app/modules/home/components/edit_dialog.dart';
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

  @action
  void removeProduct(int index) {
    listPrduct.removeAt(index);
  }

  //Edit
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  showDialogToEdit(BuildContext context, int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return EditDialog(
          productStore: listPrduct[index],
          nameController: nameController,
          priceController: priceController,
        );
      },
    );
  }
}
