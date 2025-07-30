import 'package:nosirovtask/core/expections/api_exception.dart';
import '../expections/invalid_credentials_exceptions.dart';
import '../expections/name_un_available_exception.dart';
import '../expections/user_not_found_exception.dart';

Future<void> handleApiCall(
    Future<void> Function() apiCall, Function(String) onError) async {
  try {
    await apiCall();
  } on UserNotFoundException catch (e) {
    onError(e.message!);
  } on InvalidCredentialsException catch (e) {
    onError(e.message!);
  } on NameUnavailableException catch (e) {
    onError(e.message!);
  } on ApiException catch (e) {
    onError(e.message!);
  } catch (e) {
    onError(e.toString());
  }
}
