import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_weather/display/component/weather_card.dart';
import 'package:simple_weather/domain/model/weather_model.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('weather card test', () {
    testWidgets('has date, degrees, icon and condition', (tester) async {
      final _weather = WeatherModel(
          degrees: '23',
          condition: 'Clear sky',
          date: 'TUE 2',
          icon: 'http://openweathermap.org/img/wn/01d.png');
      final _degreesText = find.text('${_weather.degrees}°');
      final _conditionText = find.text(_weather.condition);
      final _dateText = find.text(_weather.date);
      final _iconImage = find.byType(Image);

      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: WeatherCard(weather: _weather))));
      await tester.pump();

      expect(_degreesText, findsOneWidget);
      expect(_conditionText, findsOneWidget);
      expect(_dateText, findsOneWidget);
      expect(_iconImage, findsOneWidget);
    });
  });
}
