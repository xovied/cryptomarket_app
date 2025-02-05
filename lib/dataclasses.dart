import 'package:json_annotation/json_annotation.dart';
part 'dataclasses.g.dart';

@JsonSerializable()
class Token {
  final String id;
  final String symbol;
  final String name;
  final int rank;
  @JsonKey(name: "price_usd")
  @_StringToDoubleJsonConverter()
  final String priceUsd;

  @JsonKey(name: "percent_change_24h")
  @_StringToDoubleJsonConverter()
  final String percentChange24h;

  @JsonKey(name: "percent_change_1h")
  @_StringToDoubleJsonConverter()
  final String percentChange1h;

  @JsonKey(name: "percent_change_7d")
  @_StringToDoubleJsonConverter()
  final String percentChange7d;

  @JsonKey(name: "price_btc")
  @_StringToDoubleJsonConverter()
  final String priceBtc;

  @JsonKey(name: "market_cap_usd")
  @_StringToDoubleJsonConverter()
  final String marketCapUsd;

  final dynamic volume24;
  final dynamic volume24a;
  final dynamic csupply;
  final dynamic tsupply;
  final dynamic msupply;
  Token({
    required this.id,
    required this.symbol,
    required this.name,
    required this.rank,
    required this.priceUsd,
    required this.percentChange24h,
    required this.percentChange1h,
    required this.percentChange7d,
    required this.priceBtc,
    required this.marketCapUsd,
    required this.volume24,
    required this.volume24a,
    required this.csupply,
    required this.tsupply,
    required this.msupply,
  });
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

class _StringToDoubleJsonConverter implements JsonConverter<double, String> {
  final double _defaultValue;

  const _StringToDoubleJsonConverter({
    double defaultValue = 0,
  }) : _defaultValue = defaultValue;

  @override
  double fromJson(String json) => double.tryParse(json) ?? _defaultValue;

  @override
  String toJson(double object) => object.toString();
}

@JsonSerializable()
class Market {
  final dynamic name;
  final dynamic base;
  final dynamic quote;
  final dynamic price;

  @JsonKey(name: "price_usd")
  @_StringToDoubleJsonConverter()
  final dynamic priceUsd;

  final dynamic volume;

  @JsonKey(name: "volume_usd")
  @_StringToDoubleJsonConverter()
  final dynamic volumeUsd;

  final dynamic time;
  Market({
    required this.name,
    required this.base,
    required this.quote,
    required this.price,
    required this.priceUsd,
    required this.volume,
    required this.volumeUsd,
    required this.time,
  });
  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
  Map<String, dynamic> toJson() => _$MarketToJson(this);
}
