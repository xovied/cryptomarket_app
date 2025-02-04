// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      rank: (json['rank'] as num).toInt(),
      price_usd: json['price_usd'] as String,
      percent_change_24h: json['percent_change_24h'] as String,
      percent_change_1h: json['percent_change_1h'] as String,
      percent_change_7d: json['percent_change_7d'] as String,
      price_btc: json['price_btc'] as String,
      market_cap_usd: json['market_cap_usd'] as String,
      volume24: json['volume24'],
      volume24a: json['volume24a'],
      csupply: json['csupply'],
      tsupply: json['tsupply'],
      msupply: json['msupply'],
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'rank': instance.rank,
      'price_usd': instance.price_usd,
      'percent_change_24h': instance.percent_change_24h,
      'percent_change_1h': instance.percent_change_1h,
      'percent_change_7d': instance.percent_change_7d,
      'price_btc': instance.price_btc,
      'market_cap_usd': instance.market_cap_usd,
      'volume24': instance.volume24,
      'volume24a': instance.volume24a,
      'csupply': instance.csupply,
      'tsupply': instance.tsupply,
      'msupply': instance.msupply,
    };
