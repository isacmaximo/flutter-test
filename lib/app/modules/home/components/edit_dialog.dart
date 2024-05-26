import 'package:app_test1/app/models/product_store.dart';
import 'package:app_test1/app/modules/home/components/custom_button.dart';
import 'package:app_test1/app/modules/home/components/custom_input.dart';
import 'package:flutter/material.dart';

class EditDialog extends StatefulWidget {
  final ProductStore productStore;
  final TextEditingController nameController;
  final TextEditingController priceController;
  const EditDialog({
    super.key,
    required this.productStore,
    required this.nameController,
    required this.priceController,
  });

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  @override
  void initState() {
    widget.nameController.text = widget.productStore.name!;
    widget.priceController.text = widget.productStore.price.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            CustomInput(
              width: size.width * 0.7,
              controller: widget.nameController,
              hintText: 'Nome do Produto',
            ),
            CustomInput(
              width: size.width * 0.7,
              controller: widget.priceController,
              hintText: 'Preço do produto',
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              title: 'Editar',
              onPressed: () {},
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
