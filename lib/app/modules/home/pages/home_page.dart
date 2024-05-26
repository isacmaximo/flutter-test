import 'package:app_test1/app/modules/home/components/base_screen.dart';
import 'package:app_test1/app/modules/home/components/product_tile.dart';
import 'package:app_test1/app/modules/home/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  final _controller = Modular.get<ProductController>();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: 'Home',
      child: SingleChildScrollView(
        child: Observer(
          builder: (_) => Column(
            children: List.generate(
              _controller.listPrduct.length,
              (index) {
                return ProductTile(
                  name: _controller.listPrduct[index].name!,
                  price: _controller.listPrduct[index].price!,
                  onPressedEdit: () async {
                    await _controller.showDialogToEdit(context, index);
                  },
                  onPressedDelete: () {
                    _controller.removeProduct(index);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
