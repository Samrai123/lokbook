import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_second_app/model/visual.dart';

class VisualController extends GetxController {
  var _visual = {}.obs;
  void addVisual(Visual visual) {
    if (_visual.containsKey(visual)) {
      _visual[visual] += 1;
    } else {
      _visual[visual] = 1;
    }
  }

  void clearVisual() {
    _visual.clear();
  }

  get visual => _visual;
  void removeVisual(Visual visual) {
    if (_visual.containsKey(visual) && _visual[visual] == 1) {
      _visual.removeWhere((key, value) => key == visual);
    } else {
      _visual[visual] -= 1;
    }
  }

  get visualSubTotal =>
      _visual.entries.map((Visual) => visual.key.price * visual.value).toList();
  String get total {
    try {
      return _visual.entries
          .map(
            (visual) => num.parse(visual.key.price).toInt() * visual.value,
          )
          .toList()
          .reduce(
            (value, element) => value + element,
          )
          .toString();
    } catch (error) {
      return '0';
    }
  }
}
