// // ignore: depend_on_referenced_packages
// import 'package:connectivity_plus/connectivity_plus.dart';

// // For checking internet connectivity
// abstract class NetworkInfoI {
//   Future<bool> isConnected();

//   Future<List<ConnectivityResult>> get connectivityResult;

//   Stream<List<ConnectivityResult>> get onConnectivityChanged;
// }

// class NetworkInfo implements NetworkInfoI {
//   Connectivity connectivity;

//   static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());

//   factory NetworkInfo() {
//     return _networkInfo;
//   }

//   NetworkInfo._internal(this.connectivity) {
//     connectivity = this.connectivity;
//   }

//   ///checks internet is connected or not
//   ///returns [true] if internet is connected
//   ///else it will return [false]
//   @override
//   Future<bool> isConnected() async {
//     final result = await connectivity.checkConnectivity();
//     if (result != ConnectivityResult.none) {
//       return true;
//     }
//     return false;
//   }

//   // to check type of internet connectivity
//   @override
//   Future<List<ConnectivityResult>> get connectivityResult async {
//     return  connectivity.checkConnectivity();
//   }

//   //check the type on internet connection on changed of internet connection
//   @override
//   Stream<List<ConnectivityResult>> get onConnectivityChanged =>
//       connectivity.onConnectivityChanged;
// }
