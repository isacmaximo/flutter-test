import 'package:app_test1/app/models/product.dart';
import 'package:app_test1/app/modules/home/components/base_screen.dart';
import 'package:app_test1/app/modules/home/components/custom_button.dart';
import 'package:app_test1/app/modules/home/components/custom_input.dart';
import 'package:app_test1/app/modules/home/controllers/product_controller.dart';
import 'package:app_test1/app/shared/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatelessWidget {
  final _controller = Modular.get<ProductController>();
  final _formKey = GlobalKey<FormState>();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseScreen(
      title: 'Cadastro',
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(flex: 1),
              CustomInput(
                width: size.width * 0.9,
                controller: _controller.nameController,
                hintText: 'Nome do Produto',
                validator: Validators.requiredInputField,
              ),
              CustomInput(
                width: size.width * 0.9,
                controller: _controller.priceController,
                hintText: 'Preço do produto',
                validator: Validators.requiredValidPrice,
              ),
              const Spacer(flex: 1),
              CustomButton(
                width: size.width * 0.9,
                title: 'Salvar',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _controller.addProduct();
                  }
                },
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
