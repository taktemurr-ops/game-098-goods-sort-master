import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'casual_engine.dart';
import 'casual_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-098-goods-sort-master',
  title: const ['Ürün Sıralama Ustası', 'Goods Sort Master', 'Waren-Sortiermeister', 'Maestro de Ordenar', 'Maître du Tri'],
  tagline: const ['Raflara üçlü diz, mağazayı düzenle!', 'Line up three on a shelf and tidy the store!', 'Drei gleiche ins Regal!', '¡Tres iguales en el estante!', 'Trois pareils sur l\'étagère !'],
  seedColor: const Color(0xFFFFB4A2),
  icon: Icons.storefront,
  rules: GoodsSortRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => CasualSim((ctx.generated as GeneratedLevel<CasualLevel>).puzzle),
    paint: paintCasual,
    sound: casualSound,
    boosterIcon: Icons.add_circle,
    boosterLabel: (l) => l == 'tr' ? '+5 hamle' : '+5 moves',
    howTo: const ['Bir ürüne dokun, sonra götürmek istediğin rafa dokun. Aynı üç ürün yan yana gelince kaybolur.', 'Tap an item, then the shelf to move it to. Three identical items vanish.', 'Ware antippen, dann Regal.', 'Toca un producto y luego el estante.', 'Touchez un produit puis l\'étagère.'],
  ),
  tutorial: const [
    TutorialStep(Icons.touch_app, ['Ürüne dokun: seçilir.', 'Tap an item to pick it.', 'Ware wählen.', 'Elige un producto.', 'Choisissez un produit.']),
    TutorialStep(Icons.shelves, ['Boş yeri olan rafa dokun.', 'Tap a shelf with a free slot.', 'Regal mit Platz.', 'Estante con hueco.', 'Étagère avec place.']),
    TutorialStep(Icons.layers, ['Arka sıradaki ürünler öne gelir.', 'Items behind move to the front.', 'Hintere rücken vor.', 'Los de atrás avanzan.', 'Ceux derrière avancent.']),
  ],
);
