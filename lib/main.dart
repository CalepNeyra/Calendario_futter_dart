import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MiCalendarioApp());
}

class MiCalendarioApp extends StatelessWidget {
  const MiCalendarioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laboratorio Flutter - Calendario',
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const CalendarioPage(),
    );
  }
}

class CalendarioPage extends StatelessWidget {
  const CalendarioPage({super.key});

  final String imageUrl =
      'https://preview.redd.it/dl8vicfp8dle1.jpeg?auto=webp&s=a88ccbf2e059e2422f0349c4f0aaa0e1421b889e';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062016),
      body: Stack(
        children: [
          // 1. ILUSTRACIÓN DE FONDO FULLSCREEN
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // 2. CAPA DE GRADIENTE Y DESENFOQUE PARA LEGIBILIDAD
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.45),
                      const Color(0xFF062016).withValues(alpha: 0.85),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 3. CONTENIDO PRINCIPAL
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 460),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // BARRA SUPERIOR
                            _buildTopHeader(),
                            const SizedBox(height: 20),

                            // TARJETA DE MES Y AÑO
                            _buildGlassCard(child: _buildMonthCard()),
                            const SizedBox(height: 16),

                            // TARJETA PRINCIPAL DEL CALENDARIO
                            _buildGlassCard(
                              child: Column(
                                children: [
                                  _buildDaysOfWeekHeader(),
                                  const SizedBox(height: 12),
                                  Divider(
                                    color: Colors.white.withValues(alpha: 0.15),
                                    height: 1,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildCalendarGrid(),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            // SECCIÓN DE EVENTOS DESTACADOS
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Eventos Destacados',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '3 tareas programadas',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFA7F3D0),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF10B981)
                                        .withValues(alpha: 0.25),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: const Color(0xFF34D399)
                                          .withValues(alpha: 0.4),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sep 2026',
                                    style: TextStyle(
                                      color: Color(0xFF34D399),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            // LISTA DE EVENTOS CON VIDRIO TRASLÚCIDO
                            _buildGlassCard(
                              child: Column(
                                children: [
                                  _buildEventItem(
                                    dia: '05',
                                    titulo: 'Reunión de equipo',
                                    subtitulo:
                                        'Sincronización de sprint semanal',
                                    hora: '10:00 AM - 11:30 AM',
                                    color: const Color(0xFF38BDF8),
                                    icono: Icons.groups_rounded,
                                    tag: 'Trabajo',
                                  ),
                                  Divider(
                                    color: Colors.white.withValues(alpha: 0.12),
                                    height: 20,
                                  ),
                                  _buildEventItem(
                                    dia: '12',
                                    titulo: 'Examen de programación',
                                    subtitulo:
                                        'Evaluación práctica en laboratorio',
                                    hora: '09:00 AM - 11:00 AM',
                                    color: const Color(0xFFF87171),
                                    icono: Icons.terminal_rounded,
                                    tag: 'Tecsup',
                                  ),
                                  Divider(
                                    color: Colors.white.withValues(alpha: 0.12),
                                    height: 20,
                                  ),
                                  _buildEventItem(
                                    dia: '21',
                                    titulo: 'Presentación de proyecto',
                                    subtitulo:
                                        'Entrega de prototipo móvil Flutter',
                                    hora: '02:00 PM - 04:00 PM',
                                    color: const Color(0xFF34D399),
                                    icono: Icons.rocket_launch_rounded,
                                    tag: 'Prioridad Alta',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // BARRA DE NAVEGACIÓN INFERIOR
                    _buildBottomNav(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Contenedor Glassmorphism (Efecto Cristal Traslúcido)
  Widget _buildGlassCard({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFF062016).withValues(alpha: 0.45),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFF34D399).withValues(alpha: 0.25),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  // Header superior
  Widget _buildTopHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF34D399), width: 1.8),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mi Agenda',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Laboratorio 00',
                  style: TextStyle(fontSize: 12, color: Color(0xFFA7F3D0)),
                ),
              ],
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }

  // Fila del mes
  Widget _buildMonthCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.calendar_today_rounded,
              color: Color(0xFF34D399),
              size: 20,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Septiembre 2026',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Vista mensual de actividades',
                  style: TextStyle(fontSize: 11, color: Color(0xFFA7F3D0)),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildSmallIconButton(Icons.chevron_left_rounded),
            const SizedBox(width: 6),
            _buildSmallIconButton(Icons.chevron_right_rounded),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallIconButton(IconData icon) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

  // Encabezado de Días de la Semana
  Widget _buildDaysOfWeekHeader() {
    final dias = ['LUN', 'MAR', 'MIÉ', 'JUE', 'VIE', 'SÁB', 'DOM'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: dias.map((dia) {
        return Expanded(
          child: Center(
            child: Text(
              dia,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF6EE7B7),
                fontSize: 11,
                letterSpacing: 1,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Cuadrícula del Calendario
  Widget _buildCalendarGrid() {
    final semanas = [
      [
        {'dia': '31', 'tipo': 'prev'},
        {'dia': '1', 'tipo': 'normal'},
        {'dia': '2', 'tipo': 'normal'},
        {'dia': '3', 'tipo': 'normal'},
        {'dia': '4', 'tipo': 'normal'},
        {'dia': '5', 'tipo': 'evento_azul'},
        {'dia': '6', 'tipo': 'normal'},
      ],
      [
        {'dia': '7', 'tipo': 'normal'},
        {'dia': '8', 'tipo': 'normal'},
        {'dia': '9', 'tipo': 'normal'},
        {'dia': '10', 'tipo': 'normal'},
        {'dia': '11', 'tipo': 'normal'},
        {'dia': '12', 'tipo': 'evento_rojo'},
        {'dia': '13', 'tipo': 'normal'},
      ],
      [
        {'dia': '14', 'tipo': 'normal'},
        {'dia': '15', 'tipo': 'normal'},
        {'dia': '16', 'tipo': 'normal'},
        {'dia': '17', 'tipo': 'normal'},
        {'dia': '18', 'tipo': 'normal'},
        {'dia': '19', 'tipo': 'normal'},
        {'dia': '20', 'tipo': 'normal'},
      ],
      [
        {'dia': '21', 'tipo': 'destacado'}, // Día 21 destacado
        {'dia': '22', 'tipo': 'normal'},
        {'dia': '23', 'tipo': 'normal'},
        {'dia': '24', 'tipo': 'normal'},
        {'dia': '25', 'tipo': 'normal'},
        {'dia': '26', 'tipo': 'normal'},
        {'dia': '27', 'tipo': 'normal'},
      ],
      [
        {'dia': '28', 'tipo': 'normal'},
        {'dia': '29', 'tipo': 'normal'},
        {'dia': '30', 'tipo': 'normal'},
        {'dia': '1', 'tipo': 'next'},
        {'dia': '2', 'tipo': 'next'},
        {'dia': '3', 'tipo': 'next'},
        {'dia': '4', 'tipo': 'next'},
      ],
    ];

    return Column(
      children: semanas.map((semana) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: semana.map((item) {
              return Expanded(
                child: _buildDayCell(item['dia']!, item['tipo']!),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  // Celdas del calendario
  Widget _buildDayCell(String dia, String tipo) {
    bool isPrevNext = tipo == 'prev' || tipo == 'next';
    bool isDestacado = tipo == 'destacado';
    bool isEventoAzul = tipo == 'evento_azul';
    bool isEventoRojo = tipo == 'evento_rojo';

    BoxDecoration decoration;
    Color textColor;

    if (isDestacado) {
      textColor = const Color(0xFF062016);
      decoration = BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF34D399), Color(0xFF10B981)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF10B981).withValues(alpha: 0.6),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      );
    } else {
      textColor = isPrevNext ? Colors.white38 : Colors.white;
      decoration = BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            dia,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isDestacado ? FontWeight.bold : FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
        const SizedBox(height: 4),
        if (isEventoAzul)
          _buildDot(const Color(0xFF38BDF8))
        else if (isEventoRojo)
          _buildDot(const Color(0xFFF87171))
        else if (isDestacado)
          _buildDot(const Color(0xFF34D399))
        else
          const SizedBox(height: 4),
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.8), blurRadius: 4),
        ],
      ),
    );
  }

  // Ítem de evento individual
  Widget _buildEventItem({
    required String dia,
    required String titulo,
    required String subtitulo,
    required String hora,
    required Color color,
    required IconData icono,
    required String tag,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.4)),
          ),
          child: Column(
            children: [
              Text(
                dia,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const Text(
                'SEP',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    hora,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFFCBD5E1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitulo,
                style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icono, color: color, size: 18),
        ),
      ],
    );
  }

  // Navegación Inferior
  Widget _buildBottomNav() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF062016).withValues(alpha: 0.6),
            border: Border(
              top: BorderSide(
                color: const Color(0xFF34D399).withValues(alpha: 0.2),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                Icons.calendar_month_rounded,
                'Calendario',
                isSelected: true,
              ),
              _buildNavItem(
                Icons.assignment_rounded,
                'Tareas',
                isSelected: false,
              ),
              _buildNavItem(Icons.person_rounded, 'Perfil', isSelected: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label, {
    required bool isSelected,
  }) {
    final color = isSelected ? const Color(0xFF34D399) : Colors.white60;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: color,
          ),
        ),
      ],
    );
  }
}
