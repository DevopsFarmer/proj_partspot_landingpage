import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/utils/classes/base_controller.dart';

class ExploreController extends BaseController {

  final Rxn<PartyTheme?> _partyTheme = Rxn<PartyTheme?>();
  PartyTheme? get partyTheme => _partyTheme.value;
  set partyTheme(PartyTheme? busy) {
    _partyTheme.value = busy;
  }
  List<String> areaList = [
    'Ratanada',
    'Sardarpura',
    'Shastri Nagar',
    'Pratap Nagar',
  ];

  List<String> themeList = [
    'Night Club',
    'Karaoke Night',
    'Rooftop',
    'Cocktail',
  ];

  List<String> priceList = [
    '₹1000 - ₹10000',
    '₹20000 - ₹20000',
    'More than ₹25000',
  ];
  List<String> months = [
    'Alll Months',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  RxList<String> selectedArea = <String>[].obs;
  RxList<String> selectedPrice = <String>[].obs;
  RxList<String> selectedTheme = <String>[].obs;
  RxnString selectedMonth = RxnString();

  void setData({
    required List<String> area,
    required List<String> price,
    required List<String> theme,
    required List<String> monthList,
  }) {
    areaList = area;
    priceList = price;
    themeList = theme;
    months = monthList;
  }

  void toggleSelection(
    List<String> selectedList,
    String value, {
    bool allowMultiple = false,
  }) {
    if (allowMultiple) {
      if (selectedList.contains(value)) {
        selectedList.remove(value);
      } else {
        selectedList.add(value);
      }
    } else {
      selectedList.clear();
      selectedList.add(value);
    }
    update();
  }

  void setMonth(String? value) {
    selectedMonth.value = value;
  }

  void clearAll() {
    selectedArea.clear();
    selectedPrice.clear();
    selectedTheme.clear();
    selectedMonth.value = null;
    update();
  }


}
