class SubscriptionManager {
  TariffData? activeTariff;

  SubscriptionManager._privateConstructor();
  static final SubscriptionManager _instance =
      SubscriptionManager._privateConstructor();
  factory SubscriptionManager() => _instance;
}

class TariffData {
  final String duration;
  final String subtitle;
  final String price;

  TariffData({
    required this.duration,
    required this.subtitle,
    required this.price,
  });
}
