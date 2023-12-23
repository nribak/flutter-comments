import 'package:learning_flutter/blog/data/helpers/http_client.dart';

import 'helpers/comment.dart';

class BlogAPIProvider {
  final client = AppHTTPClient(baseUrl: 'sample-comments-service-5y6owysdhq-uc.a.run.app', apiKey: '795cfec4-68b1-42d6-baa0-16a53ce09a1d');

  Future<Iterable<Comment>> listComments() async {
    final req = HTTPClientRequest(path: "/comments", method: HTTPRequestMethod.get);
    final res = await client.execute(req);
    return res.parseList((map) => Comment.fromJson(map));
  }
}