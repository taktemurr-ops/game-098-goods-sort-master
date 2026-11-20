import 'package:flutter_test/flutter_test.dart';
import 'package:game_098_goods_sort_master/core/arcade.dart';
import 'package:game_098_goods_sort_master/core/level_plan.dart';
import 'package:game_098_goods_sort_master/game/casual_engine.dart';
import 'package:game_098_goods_sort_master/game/rules.dart';

void main() {
  final rules = GoodsSortRules();
  final planner = LevelPlanner(gameId: rules.gameId, optionalMechanics: rules.optionalMechanics);

  CasualSim fresh([int n = 1]) => CasualSim(rules.build(planner.spec(n)).puzzle);

  test('a stuck board costs a life and restarts the same board', () {
    final s = fresh(4);
    final g = s.goalText;
    s.boardFailed();
    expect(s.lives, 2);
    expect(s.goalText, g);
  });

  test('autopilot clears the first twelve boards without losing a life', () {
    for (var n = 1; n <= 12; n++) {
      final s = fresh(n);
      expect(runBot(s, rules.bot, 60 * 60 * 6).won, isTrue, reason: 'level $n');
      expect(s.lives, 3, reason: 'level $n');
    }
  });

  test('goods: three of a kind on a shelf clear and reveal the next layer', () {
    final ss = [Shelf()..front.setAll(0, [1, 1, -1]), Shelf()..front.setAll(0, [1, 2, 2]), Shelf()..front.setAll(0, [2, -1, -1])];
    ss[0].back.add([3, 3, 3]);
    expect(GoodsSim.applyMove(ss, 1, 0, 0), isTrue);
    GoodsSim.applyMove(ss, 0, 0, 0);
    final sol = GoodsSim.solveGoods(ss, 5000);
    expect(sol, isNotNull);
  });
}
