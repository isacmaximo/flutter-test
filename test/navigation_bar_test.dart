import 'package:app_test1/app/app_module.dart';
import 'package:app_test1/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Verificar se a tela de HOME tem todos os widgets',
    (tester) async {
      await tester.pumpWidget(
        ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      );
      await tester.pumpAndSettle();

      //encontar o texto home da appar e do navigator item
      expect(find.text('Home'), findsNWidgets(2));

      //espera encontrar 2 ítens iniciais na lista

      expect(find.byIcon(Icons.edit), findsNWidgets(2));
      expect(find.byIcon(Icons.delete), findsNWidgets(2));
    },
  );
}
