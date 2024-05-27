//Importando a main
import 'package:app_test1/app/shared/currency_util.dart';
import 'package:app_test1/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  testWidgets('Integration Test', (tester) async {
    //Isso garante que o app vai rodar no emulador
    //antes de fazer os testes.
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    //rodando a main
    app.main();
    //aguarda tudo acontecer (microações, estados iniciais)
    await tester.pumpAndSettle();

    //ENCONTAR OS ELEMENTOS DA TELA HOME:
    expect(find.text('Home'), findsNWidgets(2));
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.text('Produto 1'), findsOneWidget);
    expect(find.text(CurrencyUtil.doubleToReal(20.0)), findsOneWidget);
    expect(find.text('Produto 2'), findsOneWidget);
    expect(find.text(CurrencyUtil.doubleToReal(15.0)), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsNWidgets(2));
    expect(find.byIcon(Icons.delete), findsNWidgets(2));

    //ENCOTAR OS ELEMENTOS DA TELA REGISTER:
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.app_registration), findsOneWidget);
    await tester.tap(find.byIcon(Icons.app_registration));
    await tester.pumpAndSettle();
    expect(find.text('Cadastro'), findsOneWidget);
    expect(find.text('Registro'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Salvar'), findsOneWidget);
    await tester.pumpAndSettle();

    //ENCONTAR OS ELEMENTOS DA TELA PROFILE:
    expect(find.byIcon(Icons.person), findsOneWidget);
    await tester.tap(find.byIcon(Icons.person));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.person), findsNWidgets(2));
    expect(find.text('Username'), findsOneWidget);

    //IR PARA TELA DE REGISTRO E CADASTRAR UM PORODUTO:
    await tester.tap(find.byIcon(Icons.app_registration));
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(
        const Key('registerNameKey'),
      ),
      'Produto 3',
    );
    await tester.enterText(
      find.byKey(
        const Key('registerNameKey'),
      ),
      'Produto 3',
    );
    await tester.enterText(
      find.byKey(
        const Key('registerPriceKey'),
      ),
      '3000',
    );
    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    await tester.tap(find.text('Fechar'));
    await tester.pumpAndSettle();

    //IR PARA TELA DE HOME E EDITAR O PRODUTO CADASTRADO:
    expect(find.byIcon(Icons.home), findsOneWidget);
    await tester.tap(find.byIcon(Icons.home));
    await tester.pumpAndSettle();
    //vê se tem esse produto novo na tela
    expect(find.text('Produto 3'), findsOneWidget);
    expect(find.text(CurrencyUtil.doubleToReal(30.0)), findsOneWidget);
    //pegar o card pelo texto
    final newProduct = find.text('Produto 3');
    final cardOfNewProduct = find.ancestor(
      of: newProduct,
      matching: find.byType(Card),
    );
    //encontar o botão de editar dentro do card
    final editButtonFinder = find.descendant(
      of: cardOfNewProduct,
      matching: find.byIcon(Icons.edit),
    );
    expect(editButtonFinder, findsOneWidget);
    //clica no editar específico
    await tester.tap(editButtonFinder);
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    await tester.enterText(
      find.byKey(
        const Key('editNameKey'),
      ),
      'Produto Editado',
    );
    await tester.enterText(
      find.byKey(
        const Key('editPriceKey'),
      ),
      '3500',
    );
    await tester.tap(find.text('Editar'));
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    await tester.tap(find.text('Fechar'));
    await tester.pumpAndSettle();
    expect(find.text('Produto Editado'), findsOneWidget);
    expect(find.text(CurrencyUtil.doubleToReal(35.0)), findsOneWidget);

    //EXCLUIR O ÍTEM CADASTRADO E EDITADO:

    //encontar card editado
    final newProductEdited = find.text('Produto Editado');
    final cardOfNewProductEdited = find.ancestor(
      of: newProductEdited,
      matching: find.byType(Card),
    );
    //encontar o botão de excluir dentro do card
    final deleButtonFinder = find.descendant(
      of: cardOfNewProductEdited,
      matching: find.byIcon(Icons.delete),
    );
    expect(deleButtonFinder, findsOneWidget);
    await tester.tap(deleButtonFinder);
    await tester.pumpAndSettle();
    expect(find.byType(Dialog), findsOneWidget);
    await tester.tap(find.text('Fechar'));
    await tester.pumpAndSettle();
    //encontar apenas dois cards
    expect(
      find.byWidgetPredicate(
        (widget) {
          //se esse widget é um BoxCard então retorne true
          if (widget is Card) {
            return true;
          } else {
            return false;
          }
        },
      ),
      //espera se encontrar 2 desse widget
      findsNWidgets(2),
    );
    //espera não encontar mais o card deletado:
    expect(find.text('Produto Editado'), findsNothing);
    expect(find.text(CurrencyUtil.doubleToReal(35.0)), findsNothing);
  });
}
