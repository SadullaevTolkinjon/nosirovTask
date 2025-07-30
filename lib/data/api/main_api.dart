
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:nosirovtask/data/api/api.dart';

@Injectable()
class MainApi {
  final Api _api;
  MainApi(this._api);
  Future<Response> fetchOnboarding() async {
    final response = await _api.get(
        path: 'knowledge_base/onboarding/get_onboarding_mobile/');
    return response;
  }
}
