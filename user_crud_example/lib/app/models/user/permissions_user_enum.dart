import 'package:user_crud_example/app/core/utils/home_page_texts.dart';

enum PermissionsUserEnum {
  one,
  two,
  three
}

extension PermissionsUserEnumExt on PermissionsUserEnum {
  static final displayValues = displayValuesMap.values.toList();
  static final displayKeys = displayValuesMap.keys.toList();
  static final displayEntries = displayValuesMap.entries.toList();

  static const displayValuesMap = {
    PermissionsUserEnum.one: 'Permissão um',
    PermissionsUserEnum.two: 'Permissão dois',
    PermissionsUserEnum.three: 'Permissão três',
  };

  static const displayTextsMap = {
    PermissionsUserEnum.one: HomePageTexts.firstPermission,
    PermissionsUserEnum.two: HomePageTexts.secondPermission,
    PermissionsUserEnum.three: HomePageTexts.thirdPermission,
  };

  String get displayValue => displayValuesMap[this]!;
  String get displayTextValue => displayTextsMap[this]!;
}