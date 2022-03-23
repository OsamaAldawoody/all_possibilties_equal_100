void main(List<String> arguments) {
  // final calcList = preprocess('');
  // final coreResult = coreAlgorithm(calcList);
  // // final result = postprocess(coreResult);
  // print(coreResult);

  final items = [1, 2, 3, 4, 5, 6, 7, 8, 9].join('+').toString();

  print(items);
}

List<int> preprocess(String str) {
  return [1, 2, 3, 4, 5, 6, 78, 9];
}

MapEntry<int, List<int>> coreAlgorithm(List<int> calcList) {
  final initialDef = 100 - calcList[0];
  final sOfOthers = calcList.fold(
          0, (dynamic previousValue, element) => previousValue + element) -
      calcList[0];
  int def = sOfOthers - initialDef;
  if (def % 2 > 0) {
    return MapEntry(0, []);
  } else {
    final val = def / 2;
    final mayBeTruncated = calcList
        .where(
          (element) => element <= val,
        )
        .toList();

    return MapEntry(val.toInt(), mayBeTruncated);
  }
}

String postprocess(MapEntry<int, List<int>> map) {
  final possibilities = <String>[];
  final value = map.key;
  final mayBeTruncated = map.value;
  for (var i = mayBeTruncated.length - 1; i > 0; i--) {
    if (mayBeTruncated[i] == value) {
      // possibilities.add(prepareResult(mayBeTruncated, value.toString())!);
      continue;
    }
    var val1 = mayBeTruncated[i];
    for (var j = mayBeTruncated.length; j > 0; i--) {
      var val2 = mayBeTruncated[j];
      final sum = val1 + val2;
      if (sum == value) {
        possibilities.add(prepareResult(mayBeTruncated, [val1, val2])!);
      }
    }
    print('loop');
  }
  return '';
}

String? prepareResult(List<int> numbers, List<int> vals) {
  
  final items = [1,2,3,4,5,6,7,8,9].join('+');
  final newItems = items.join('+');
  if (vals.length == 1) {
    newItems.replaceFirst('+${vals.first}', '-${vals.first}');
  }

  for (var item in items) {
    if (item == vals[0] || item == vals[1]) {
      // newItems.replaceFirst('+$val', '-$val');
    }
  }
  return newItems;
}

List<int> calcNums(List<int> numbers) {
  final calcNums = <int>[];
  for (var i = 0; i < numbers.length; i++) {
    final mergedNum = StringBuffer();
    if (i == numbers.length - 2) {
      mergedNum.writeAll([numbers[i], numbers[i + 1]]);
      calcNums.add(int.parse(mergedNum.toString()));
      break;
    }
    calcNums.add(numbers[i]);
  }
  return calcNums;
}
