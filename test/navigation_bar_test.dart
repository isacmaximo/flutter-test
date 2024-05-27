import 'package:app_test1/app/app_module.dart';
import 'package:app_test1/app/app_widget.dart';
import 'package:app_test1/app/shared/currency_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Verificar se a tela de HOME tem todos os widgets',
    (tester) async {
      //desenha a tela
      await tester.pumpWidget(
        ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      );

      //aguarda todas as microações acontecerem
      await tester.pumpAndSettle();

      //encontar o texto home da appar e do navigator item
      expect(find.text('Home'), findsNWidgets(2));
      //espera encontrar io ícone de home
      expect(find.byIcon(Icons.home), findsOneWidget);

      //espera encontrar 2 ítens iniciais na lista
      expect(find.text('Produto 1'), findsOneWidget);
      expect(find.text(CurrencyUtil.doubleToReal(20.0)), findsOneWidget);
      expect(find.text('Produto 2'), findsOneWidget);
      expect(find.text(CurrencyUtil.doubleToReal(15.0)), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsNWidgets(2));
      expect(find.byIcon(Icons.delete), findsNWidgets(2));
    },
  );
  testWidgets(
    'Verificar se a tela de REGISTER tem todos os widgets',
    (tester) async {
      //desenha a tela
      await tester.pumpWidget(
        ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      );

      //aguarda todas as microações acontecerem
      await tester.pumpAndSettle();

      //clicar no ícone de registro
      expect(find.byIcon(Icons.app_registration), findsOneWidget);
      await tester.tap(find.byIcon(Icons.app_registration));
      //carregando todas as microações
      await tester.pumpAndSettle();

      //encontar o textos da tela
      expect(find.text('Cadastro'), findsOneWidget);
      expect(find.text('Registro'), findsOneWidget);

      //espera encontrar 2 TextFormField
      expect(find.byType(TextFormField), findsNWidgets(2));

      //espera encontrar um botão de salvar
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Salvar'), findsOneWidget);
    },
  );

  testWidgets(
    'Verificar se a tela de PROFILE tem todos os widgets',
    (tester) async {
      //desenha a tela
      await tester.pumpWidget(
        ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      );

      //aguarda todas as microações acontecerem
      await tester.pumpAndSettle();

      //clicar no ícone de person
      expect(find.byIcon(Icons.person), findsOneWidget);
      await tester.tap(find.byIcon(Icons.person));
      //carregando todas as microações
      await tester.pumpAndSettle();

      //encontar os ícones da tela
      expect(find.byIcon(Icons.person), findsNWidgets(2));
      //espera encontrar o texto 'Username'
      expect(find.text('Username'), findsOneWidget);
    },
  );
}
