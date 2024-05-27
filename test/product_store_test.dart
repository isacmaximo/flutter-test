//TESTES DE UNIDADE
import 'package:app_test1/app/models/product.dart';
import 'package:app_test1/app/models/product_store.dart';
import 'package:mobx/mobx.dart';
import 'package:test/test.dart';

void main() {
  group('TESTES DE UNIDADE:', () {
    test(
      'Criar ProductStore e verificar valores',
      () {
        final product = ProductStore();
        product.name = 'Produto 1';
        product.price = 30.0;
        expect(product.name, 'Produto 1');
        expect(product.price, 30.0);
      },
    );
    test(
      'Adicionar 2 ProductStore em uma ObservableList<Product> depois verificar o tamanho da lista',
      () {
        ObservableList list = ObservableList<ProductStore>.of([]);
        list.add(ProductStore(name: 'P1', price: 10.0));
        expect(list.length, 1);
        list.add(ProductStore(name: 'P2', price: 20.0));
        expect(list.length, 2);
      },
    );

    test(
      'Criar um Product, inserir valores de um json, depois verificar valores do objeto',
      () {
        String json = '{"name": "Produto 2", "price": 35.0}';
        final product = Product.fromJson(json);

        expect(product.name, 'Produto 2');
        expect(product.price, 35.0);
      },
    );
  });
}
