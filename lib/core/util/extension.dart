import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constant/navigation.dart';
import '../model/screen.dart';
import 'dialog_route.dart';

extension BlankSpace on num {
  /// [vb] verilen yükseklikte bir SizedBox(height: vb) döndürür
  SizedBox get vb => SizedBox(height: (this).toDouble());

  /// [hb] verilen genişlikte bir SizedBox(width: hb) döndürür
  SizedBox get hb => SizedBox(width: (this).toDouble());
}

extension StringMultipler on String {
  /// [multipler] değeri kadar uc uca ekler
  String multiple([int multipler = 1, int space = 1]) {
    String spaceStr = '';
    for (var i = 0; i < space; i++) {
      spaceStr = '$spaceStr ';
    }
    String str = this;
    for (var i = 0; i < multipler - 1; i++) {
      str = '$str$spaceStr$this';
    }
    return str;
  }
}

extension DateTimeUtils on DateTime {
  /// Verilen aralıktaki günleri `List<DateTime>` formatında döndürür
  List<DateTime> betweenDays(DateTime other, {bool lastDayIncluded = false}) {
    DateTime date1 = this;
    if ((this).isSameDay(other)) {
      return <DateTime>[DateTime(date1.year, date1.month, date1.day)];
    } else {
      date1 = DateTime(date1.year, date1.month, date1.day);
      other = DateTime(other.year, other.month, other.day);

      List<DateTime> days = [];

      if (date1.isAfter(other)) {
        DateTime temp = date1;
        date1 = other;
        other = temp;
      }

      while (!date1.isAfter(other)) {
        if (other == date1 && lastDayIncluded == false) break;
        days.add(date1);
        date1 = date1.add(const Duration(days: 1));
      }

      return days;
    }
  }

  /// [other] ile aynı ay içerisinde olup olmadığını kontrol eder
  bool isSameMonth(DateTime other) => year == other.year && month == other.month;

  /// [other] ile aynı gün olup olmadığını kontrol eder
  bool isSameDay(DateTime other) {
    return (this).year == other.year && (this).month == other.month && (this).day == other.day;
  }

  /// [other] ile aynı dakika olup olmadığını kontrol eder
  bool isSameMinute(DateTime other) {
    return year == other.year && month == other.month && day == other.day && hour == other.hour && minute == other.minute;
  }

  bool isBeforeMinute(DateTime other) {
    if (year < other.year) {
      return true;
    } else if (year > other.year) {
      return false;
    }

    if (month < other.month) {
      return true;
    } else if (month > other.month) {
      return false;
    }

    if (day < other.day) {
      return true;
    } else if (day > other.day) {
      return false;
    }

    if (hour < other.hour) {
      return true;
    } else if (hour > other.hour) {
      return false;
    }

    return minute < other.minute;
  }

  bool isAfterMinute(DateTime other) {
    if (year > other.year) {
      return true;
    } else if (year < other.year) {
      return false;
    }

    if (month > other.month) {
      return true;
    } else if (month < other.month) {
      return false;
    }

    if (day > other.day) {
      return true;
    } else if (day < other.day) {
      return false;
    }

    if (hour > other.hour) {
      return true;
    } else if (hour < other.hour) {
      return false;
    }

    return minute > other.minute;
  }

  String toMonthString() => '$year-${month.toString().padLeft(2, '0')}';

  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);
  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  DateTime get onlyDate => DateTime(year, month, day);
}

extension DurationExtension on int {
  Duration get day => Duration(days: this);
  Duration get hour => Duration(hours: this);
  Duration get minute => Duration(minutes: this);
  Duration get second => Duration(seconds: this);
  Duration get millisecond => Duration(milliseconds: this);
}

extension DeviceExt on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600;
}

extension FormDataExt on FormData {
  String get toJson {
    var m = <String, dynamic>{};
    m.addEntries(fields);
    m.addEntries(files);
    var json = jsonEncode(m);
    return json;
  }

  String get multiline {
    var str = '\n{';
    for (var f in fields) {
      if (f == fields.first) {
        str = '$str\n  "${f.key}":"${f.value}"';
      } else {
        str = '$str,\n  "${f.key}":"${f.value}"';
      }
    }
    for (var f in files) {
      if (f == files.first) {
        str = '$str\n  "${f.key}":"${f.value}"';
      } else {
        str = '$str,\n  "${f.key}":"${f.value}"';
      }
    }
    str = '$str\n}';
    return str;
  }
}

extension JsonExt on Map<String, dynamic> {
  String get fieldString {
    String str = '';
    for (var ent in entries) {
      if (ent.key == entries.first.key) {
        str = '$str\x1B[32m${ent.key}\x1B[37m: \x1B[36m${ent.value}\x1B[37m';
      } else {
        str = '$str, \x1B[32m${ent.key}\x1B[37m: \x1B[36m${ent.value}\x1B[37m';
      }
    }
    return str;
  }
}

extension DurationTextExt on Duration {
  String timeString() {
    String str = '';
    if (inDays > 0) {
      str += '$inDays Gün ';
    }
    if (inHours > 0 && inHours % 24 != 0) {
      str += '${inHours % 24} Saat ';
    }
    if (inMinutes > 0 && inMinutes % 60 != 0) {
      str += '${inMinutes % 60} Dakika ';
    }
    if (inSeconds > 0 && inSeconds % 60 != 0) {
      str += '${inSeconds % 60} Saniye';
    }
    return str;
  }
}

extension ListExt on List {
  List<T> reduceListLenght<T>(int toReduce) {
    if (length > toReduce) {
      return sublist(0, toReduce) as List<T>;
    } else {
      return this as List<T>;
    }
  }
}

/// BİR GRİD DÜZENİNİ INDEXİNE GÖRE ÇARPRAZ RENKLENDİRME KODU<br>
/// [gridCount] crossAxis değeri<br>
/// [index] grid child index değeri
bool paintGrid(int gridCount, int index) {
  int refresh = gridCount * 2;
  final paint = paintedGridCell(gridCount);
  var a = index % refresh;
  bool b = paint.contains(a);
  return b;
}

List<int> paintedGridCell(int gridCount) {
  List<int> painted = [];
  int max = gridCount * 2;

  for (var i = 0; i < max; i = i + 2) {
    if (i < gridCount) {
      painted.add(i);
    } else {
      painted.add(i + 1);
    }
  }
  return painted;
}

List<T> reduceListLenght<T>({required List<T> list, required int toReduce}) {
  if (list.length > toReduce) {
    return list.sublist(0, toReduce);
  } else {
    return list;
  }
}

extension TagExt on List<String>? {
  String? toTagString() {
    if (this != null) {
      String str = '';
      for (var s in this!) {
        if (s == this!.last) {
          str = str + s;
        } else {
          str = '$str$s,';
        }
      }
      return str;
    } else {
      return null;
    }
  }
}

extension DialogExtension on BuildContext {
  ///Bu fonksiyon [AppDialogRoute] kullanarak yeni bir [DialogRoute] oluşturur.
  ///```dart
  ///context.showAppDialog(
  ///   const Dialog(),
  ///   settings: const RouteSettings(
  ///     name: 'home',
  ///     arguments: {'param1': 1, 'param2': 'check'},
  ///   ),
  ///);
  ///```
  ///Şeklinde kullanılabilir
  Future<T?> showAppDialog<T extends Object?>(
    Widget child, {
    RouteSettings? settings,
  }) {
    return AppNavigation.state.push<T>(
      AppDialogRoute<T>(
        builder: (_) => child,
        settings: settings,
      ),
    );
  }

  Future<T?> push<T extends Object?>(Widget screen, {RouteSettings? settings}) async {
    return AppNavigation.state.push(MaterialPageRoute(builder: (_) => screen, settings: settings));
  }

  Future<T?> pushScreen<T extends Object?>(AppScreen screen, {Object? args}) async {
    return AppNavigation.state.push(
      MaterialPageRoute(builder: (_) => screen, settings: RouteSettings(name: screen.name.name, arguments: args)),
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(AppScreen screen, RoutePredicate? predicate, {Object? args}) async {
    return AppNavigation.state.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => screen, settings: RouteSettings(name: screen.name.name)),
      predicate ?? (route) => route.isFirst,
    );
  }

  void pop<T extends Object?>([Object? result]) async {
    return AppNavigation.state.pop(result);
  }
}

