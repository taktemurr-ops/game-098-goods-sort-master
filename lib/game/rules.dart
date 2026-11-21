import 'package:studio_core/core/arcade.dart';
import 'package:studio_core/core/level_plan.dart';
import 'package:studio_core/core/missions.dart';
import 'package:studio_core/core/stats.dart';
import 'casual_engine.dart';

class GoodsSortRules extends ArcadeRules<CasualLevel> {
  @override
  String get gameId => 'game-098-goods-sort-master';

  @override
  List<String> get optionalMechanics => const [];

  @override
  List<GameStat> get gameStats => const [
        GameStat('goods_cleared', 'Sıralanan ürün', 'Goods sorted', scale: 2000),
        GameStat('combos', 'Çoklu temizleme', 'Combos', scale: 50),
        GameStat('moves', 'Hamle', 'Moves', scale: 3000),
      ];

  @override
  List<MissionTemplate> get missionTemplates => const [
        MissionTemplate('goods_cleared', 'goods_cleared', [500, 1000, 2000]),
        MissionTemplate('combos', 'combos', [6, 12, 25], coinReward: 80),
      ];

  @override
  CasualLevel generate(LevelSpec spec) => generateCasual(CasualKind.goods, spec);

  @override
  ArcadeMeta metaOf(CasualLevel l) => l.meta;

  @override
  ArcadeSim createSim(CasualLevel l) => CasualSim(l);

  @override
  ArcadeInput bot(ArcadeSim sim) => casualBot(sim);
}

ArcadeRules createRules() => GoodsSortRules();
