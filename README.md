[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XRrsqZ_g)
# empty

# P2.3 Components Visuals — Stateless (RA4)

Autoray: Alicia Dionicio i Uxue Esteve
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