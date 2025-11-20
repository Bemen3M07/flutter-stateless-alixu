[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XRrsqZ_g)
# empty

# P2.3 Components Visuals — Stateless (RA4)

Autora: Alicia Dionicio i Uxue Esteve
Mòdul:M0489 PROG. MULTIM. I DISP. MÒB. / M0488 DESENV. INTER
Professor: Víctor Naranjo  
Entorn: Flutter (Dart SDK)

---

## Objectiu de la pràctica
Aquesta pràctica té com a objectiu aplicar els conceptes de Flutter vistos a classe,
treballant exclusivament amb widgets Stateless per crear interfícies visuals senzilles,
declaratives i modulars.  
No s’ha fet servir cap codi ni llibreria externa no vista al temari.

---

## Estructura del projecte
Cada exercici es troba dins del directori `lib/` com un fitxer separat:

| Fitxer | Descripció | Elements utilitzats |
|---------|-------------|---------------------|
| `ex1_hello_world.dart` | Mostra un text simple "Hello World" | `MaterialApp`, `Scaffold`, `Text`, `AppBar`, `Center` |
| `ex2_welcome.dart` | Pantalla de benvinguda amb dos botons | `Column`, `Text`, `ElevatedButton`, `SizedBox` |
| `ex3_resource.dart` | Exemple de recurs amb imatge en línia | `Image.network`, `Padding`, `Align`, `Column`, `Text` |
| `ex4_contact.dart` | Fitxa de contacte amb dades i imatge | Classe `Contact`, `CircleAvatar`, `Container`, `Row`, `Column` |
| `ex5_message_list.dart` | Llista de missatges simple | `ListView.builder`, `Container`, `Text`, `Column` |
| `ex6_message_list_navbar.dart` | Mateixa llista amb barra de navegació inferior | `BottomNavigationBar`, `FloatingActionButton`, `ListView` |

---

## Conceptes treballats
- Widgets stateless (`extends StatelessWidget`)
- Estructura declarativa amb `MaterialApp` i `Scaffold`
- Layout bàsic: `Column`, `Row`, `Center`, `Padding`, `Container`
- Estilització: `TextStyle`, `SizedBox`, `BoxDecoration`
- Llistes: `ListView.builder` i models de dades simples
- Recursos: ús d’imatges via `Image.network`
- Botons: `ElevatedButton`, `FloatingActionButton`
- Navegació visual: `BottomNavigationBar` (sense lògica, només estètica)

---

## Resultat visual
A continuació es mostren captures o descripcions visuals dels exercicis (simulació en dispositiu Android):

- Ex1: Pantalla amb text “Hello World!”
- Ex2: Pantalla de benvinguda amb títol, subtítol i botons “Login” i “Register”
- Ex3: Text i imatge carregada des d’una URL
- Ex4: Fitxa de contacte amb foto de perfil i dades (nom, correu, telèfon)
- Ex5: Llista vertical de missatges amb autor i cos
- Ex6: Llista amb barra de navegació inferior (icones de missatges, contactes i configuració)


## Execució
Els fitxers `.dart` es poden executar directament des de VS Code o Android Studio
obrint l’arxiu corresponent i fent clic a “Run”.

Tots els exercicis funcionen correctament.

# Exercicis P4 – Widgets Stateful (DAM / Flutter)

Aquesta carpeta conté els exercicis corresponents a la pràctica **P4**, on treballem amb **StatefulWidget** a Flutter.  
A diferència dels widgets Stateless, els widgets Stateful **mantenen i actualitzen el seu estat durant l’execució de l’aplicació** cada cop que hi ha un canvi provocat per l’usuari o pel sistema.

---

## Objectiu de la Pràctica

- Entendre la diferència entre **StatelessWidget** i **StatefulWidget**.
- Gestionar estats interns mitjançant **setState()**.
- Controlar variables que poden canviar durant l’ús de l’aplicació.
- Implementar interacció bàsica amb l’usuari (botons, inputs, canvis d’estils, etc.).
- Crear aplicacions modulars, separant vista i comportament.

---

## Contingut d’Exercicis (P4)

| Nº | Arxiu | Descripció del concepte |
|---:|-------|-------------------------|
| 1 | `ejercicio1.dart` | Introducció a **StatefulWidget** i ús de **setState()** per modificar valors a la pantalla. |
| 2 | `ejercicio2.dart` | Gestió d’estat amb entrades de text i interacció amb l’usuari. |
| 3 | `ejercicio3.dart` | Estat dependent de condicions (canvis de color, missatges dinàmics, etc.). |
| 4 | `ejercicio4.dart` | Ús de components interactius avançats (sliders, switches, etc.). |
| 5 | `ejercicio5.dart` | Llistats que s’actualitzen dinàmicament en temps real. |
| 6 | `ejercicio6.dart` | Funcions que modifiquen l’estat i separació de lògica en mètodes. |
| 7 | `main_ej7.dart` | Exercici complet d’integració: múltiples canvis d’estat i interaccions combinades. |

---

## Ús del `setState()`

En widgets Stateful, **setState()** és el mètode que informa a Flutter que l’estat ha canviat i cal reconstruir la UI. Exemple bàsic:

```dart
setState(() {
  _counter++;
});
