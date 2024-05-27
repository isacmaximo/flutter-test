import 'package:app_test1/app/models/product_store.dart';
import 'package:app_test1/app/modules/home/components/custom_button.dart';
import 'package:app_test1/app/modules/home/components/custom_input.dart';
import 'package:app_test1/app/shared/currency_util.dart';
import 'package:app_test1/app/shared/validators.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditDialog extends StatefulWidget {
  final int index;
  final ProductStore productStore;
  final TextEditingController nameController;
  final MoneyMaskedTextController priceController;
  final void Function(int index, ProductStore product)? onPressedEdit;
  final _formKey = GlobalKey<FormState>();
  EditDialog({
    super.key,
    required this.index,
    required this.productStore,
    required this.nameController,
    required this.priceController,
    this.onPressedEdit,
  });

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  @override
  void initState() {
    widget.nameController.text = widget.productStore.name!;
    widget.priceController.text = CurrencyUtil.doubleToReal(
      widget.productStore.price!,
    );
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
        child: Form(
          key: widget._formKey,
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              CustomInput(
                width: size.width * 0.7,
                controller: widget.nameController,
                hintText: 'Nome do Produto',
                validator: Validators.requiredInputField,
              ),
              CustomInput(
                width: size.width * 0.7,
                controller: widget.priceController,
                hintText: 'Preço do produto',
                validator: Validators.requiredValidPrice,
              ),
              const Spacer(
                flex: 1,
              ),
              CustomButton(
                title: 'Editar',
                onPressed: () {
                  if (widget._formKey.currentState!.validate()) {
                    widget.onPressedEdit!(
                      widget.index,
                      ProductStore(
                        name: widget.nameController.text,
                        price: CurrencyUtil.parseCurrency(
                          widget.priceController.text,
                        ),
                      ),
                    );
                    Modular.to.pop();
                  }
                },
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
