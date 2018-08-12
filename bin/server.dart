import 'dart:io';

import 'package:logging/logging.dart';
import 'package:rpc/rpc.dart';

import 'package:persons_answers/persons_api.dart';

const String _API_PREFIX = '/api';

final ApiServer _apiServer = ApiServer(apiPrefix: _API_PREFIX, prettyPrint: true);

main() async {
  // Add a simple log handler to log information to a server side file.
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  _apiServer.addApi(PersonsApi());
  _apiServer.enableDiscoveryApi();

  HttpServer server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
  server.listen(_apiServer.httpRequestHandler);
}
