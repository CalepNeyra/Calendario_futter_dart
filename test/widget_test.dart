import 'package:flutter_test/flutter_test.dart';
import 'package:futter_aplication_5and6/main.dart';

void main() {
  testWidgets('Verificar carga inicial del calendario', (
    WidgetTester tester,
  ) async {
    // Carga la aplicación del calendario
    await tester.pumpWidget(const MiCalendarioApp());

    // Verifica que el título del mes aparezca en pantalla
    expect(find.text('Septiembre 2026'), findsOneWidget);

    // Verifica que exista la sección de eventos
    expect(find.text('Eventos del mes'), findsOneWidget);
  });
}
