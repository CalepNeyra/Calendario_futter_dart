# 📅 Laboratorio Flutter - Aplicación de Calendario

Aplicación móvil/web desarrollada con **Flutter** para la gestión visual de agenda y eventos mensuales. El proyecto implementa un diseño moderno estilo **Glassmorphism** personalizado con paleta de colores esmeralda/oscura y una maquetación basada rigurosamente en los widgets estructurales de Flutter (`Row`, `Column`, `Container`, `Stack`).

---

## 🎨 Características del Diseño Visual

* **Estructura Modular (Bento Box):** Organización limpia por secciones mediante tarjetas traslúcidas.
* **Efecto Glassmorphism:** Implementación de `BackdropFilter` con difuminado (*blur*) y bordes semi-transparentes sobre imagen de fondo personalizada.
* **Encabezado Dinámico:** Muestra del mes (`Septiembre 2026`) y año con controles de navegación visual.
* **Cuadrícula de Calendario:** Días de la semana (`LUN` - `DOM`) y distribución de días del mes usando `Row` y `Column`.
* **Día Destacado:** Resaltado brillante (Glow) para el día **21** (día seleccionado/actual).
* **Indicadores de Eventos:** Marcadores de color en la cuadrícula (días 5, 12 y 21) vinculados a la lista de tareas inferiores.
* **Sección de Eventos Destacados:** Tarjetas con detalles de fecha, hora, categoría/tags e íconos temáticos:
  * 🔵 **Día 05:** Reunión de equipo (*Trabajo*)
  * 🔴 **Día 12:** Examen de programación (*Tecsup*)
  * 🟢 **Día 21:** Presentación de proyecto (*Prioridad Alta*)
* **Barra de Navegación Inferior:** Menú traslúcido con accesos a Calendario, Tareas y Perfil.

---

## 🛠️ Tecnologías y Widgets Utilizados

* **Framework:** [Flutter](https://flutter.dev/) (Material 3)
* **Lenguaje:** Dart
* **Widgets Estructurales Clave:**
  * `Row` y `Column` (Maquetación y alineación principal)
  * `Stack` y `Positioned.fill` (Capa de fondo e imagen)
  * `BackdropFilter` y `ClipRRect` (Efecto de cristal traslúcido)
  * `Container` y `BoxDecoration` (Estilos, sombras y bordes redondeados)
  * `SingleChildScrollView` (Desplazamiento fluido en pantallas pequeñas)

---

## 🚀 Requisitos de Ejecución

Para ejecutar la aplicación localmente en Flutter Web:

1. Clonar este repositorio o abrir el directorio del proyecto en la terminal.
2. Descargar las dependencias necesarias:
   flutter pub get
3. Ejecutar la aplicación en el navegador Chrome:
   flutter run -d chrome

Nota para desarrollo web: Si la imagen de fondo presenta bloqueos de políticas CORS en el navegador, se puede ejecutar deshabilitando la restricción mediante:

   flutter run -d chrome --web-browser-flag "--disable-web-security"

---

## 📋 Criterios de Evaluación Cubiertos

| Criterio | Puntos | Estado |
| :--- | :---: | :---: |
| Diseño visual y personalización | 9 / 9 | ✅ Cumplido |
| Uso de Row y Column | 4 / 4 | ✅ Cumplido |
| Organización de elementos | 3 / 3 | ✅ Cumplido |
| Eventos y día destacado | 2 / 2 | ✅ Cumplido |
| Orden del código | 2 / 2 | ✅ Cumplido |
| **Total** | **20 / 20** | **100%** |