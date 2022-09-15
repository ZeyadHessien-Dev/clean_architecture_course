import 'package:internet_connection_checker/internet_connection_checker.dart';
abstract class NetworkInformation {
  Future<bool> get isConnected;
}

class NetworkInformationImpl implements NetworkInformation {
  final InternetConnectionChecker connectionChecker;
  NetworkInformationImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}