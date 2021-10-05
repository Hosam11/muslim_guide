/*
  Usage:
  $  dart playstore_lookup.dart id=com.hossam.muslim_guide
 */

import 'package:upgrader/upgrader.dart';

void testPlay(List<String> arguments) async {
  const defaultLookupId = 'com.hossam.muslim_guide';
  var lookupId = defaultLookupId;

  if (arguments.length == 1) {
    final arg0 = arguments[0].split('=');
    if (arg0.length == 2) {
      final argName = arg0[0];
      final argValue = arg0[1];

      if (argName == 'id') {
        lookupId = argValue;
      }
    }
  }

  final playStore = PlayStoreSearchAPI();
  playStore.debugEnabled = true;

  final results = await playStore.lookupById(lookupId);

  if (results == null) {
    print('playstore_lookup there are no results');
    return;
  }

  final releaseNotes = PlayStoreResults.releaseNotes(results);
  final version = PlayStoreResults.version(results);

  print('playstore_lookup releaseNotes: $releaseNotes');
  print('playstore_lookup version: $version');

  print('playstore_lookup all results:\n$results');
  return;
}
