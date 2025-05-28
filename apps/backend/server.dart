import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_static/shelf_static.dart';

void main(List<String> args) async {
  // Serve static files from public
  final staticHandler = createStaticHandler(
    'public',
    defaultDocument: 'index.html',
    serveFilesOutsidePath: true,
  );

  // Example API route placeholder
  final handler = Cascade()
      .add((Request request) {
        if (request.url.path.startsWith('api/')) {
          // Example: handle /api/hello
          if (request.url.path == 'api/hello') {
            return Response.ok('Hello from Dart server!');
          }
          return Response.notFound('API route not found');
        }
        return staticHandler(request);
      })
      .handler;

  final port = int.tryParse(Platform.environment['PORT'] ?? '8080') ?? 8080;
  final server = await io.serve(
    logRequests().addHandler(handler),
    InternetAddress.anyIPv4,
    port,
  );
  print('Serving at http://${server.address.host}:${server.port}');
} 