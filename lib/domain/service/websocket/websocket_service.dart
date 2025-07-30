
// import 'package:injectable/injectable.dart';
// import 'package:nosirovtask/data/preference/token_preference.dart';

// @injectable
// class WebSocketService {
//  final TokenPreference _tokenPreference;

//   WebSocketService(this._tokenPreference);
//   Future<WebSocketChannel?> connect() async {
//     try {
//       return WebSocketChannel.connect(
//           Uri.parse('ws://sott.uz:5500/ws/chatting/${_dbService.getUserId}'));
//     } catch (e) {
//       return null;
//     }
 
//   }
// }