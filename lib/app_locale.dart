mixin AppLocale {
  static const String icon = 'icon';
  static const String homeTitle = 'title';
  static const String tokenTitle = 'title2';
  static const String marketTitle = 'title3';

  static const Map<String, dynamic> en = {
    icon: 'assets/icon/en/en.png',
    homeTitle: 'Token Rating',
    tokenTitle: 'Token Info',
    marketTitle: 'Markets for ',
  };
  static const Map<String, dynamic> ru = {
    icon: 'assets/icon/ru/ru.png',
    homeTitle: 'Рейтинг токенов',
    tokenTitle: 'Информация о токене',
    marketTitle: "Маркеты для "
  };
}
