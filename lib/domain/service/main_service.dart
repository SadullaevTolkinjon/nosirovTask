import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../data/api/main_api.dart';

@Injectable()
class MainService {
  final MainApi _mainApi;
  MainService(this._mainApi);
  // Future fetchOnboarding() async {
  //   final Response response = await _mainApi.fetchOnboarding();
  //   var decodedResponse = utf8.decode(response.bodyBytes);
  //   Iterable list = jsonDecode(decodedResponse);
  //   return List<OnboardingModel>.from(
  //       list.map((e) => OnboardingModel.fromJson(e)));
  // }

  Future fetchOnboardings() async {
    final Response response = await _mainApi.fetchOnboarding();
    var decodedResponse = utf8.decode(response.bodyBytes);
    var decoded = jsonDecode(decodedResponse);
    return decoded;
  }
}
