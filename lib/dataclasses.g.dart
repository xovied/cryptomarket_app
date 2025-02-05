// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataclasses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      rank: (json['rank'] as num).toInt(),
      priceUsd: json['price_usd'] as String,
      percentChange24h: json['percent_change_24h'] as String,
      percentChange1h: json['percent_change_1h'] as String,
      percentChange7d: json['percent_change_7d'] as String,
      priceBtc: json['price_btc'] as String,
      marketCapUsd: json['market_cap_usd'] as String,
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
      'price_usd': instance.priceUsd,
      'percent_change_24h': instance.percentChange24h,
      'percent_change_1h': instance.percentChange1h,
      'percent_change_7d': instance.percentChange7d,
      'price_btc': instance.priceBtc,
      'market_cap_usd': instance.marketCapUsd,
      'volume24': instance.volume24,
      'volume24a': instance.volume24a,
      'csupply': instance.csupply,
      'tsupply': instance.tsupply,
      'msupply': instance.msupply,
    };

Market _$MarketFromJson(Map<String, dynamic> json) => Market(
      name: json['name'],
      base: json['base'],
      quote: json['quote'],
      price: json['price'],
      priceUsd: json['price_usd'],
      volume: json['volume'],
      volumeUsd: json['volume_usd'],
      time: json['time'],
    );

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'name': instance.name,
      'base': instance.base,
      'quote': instance.quote,
      'price': instance.price,
      'price_usd': instance.priceUsd,
      'volume': instance.volume,
      'volume_usd': instance.volumeUsd,
      'time': instance.time,
    };
