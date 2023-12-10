
import 'package:comments_app/src/data/comments_model.dart';
import 'package:comments_app/src/data/providers/comments_provider.dart';
import 'package:comments_app/src/data/providers/http_client.dart';

const url = "sample-comments-service-5y6owysdhq-uc.a.run.app";
const userIdParam = {'userId': "tempUserId"};
const apiKey = '795cfec4-68b1-42d6-baa0-16a53ce09a1d';

class CommentsAPIProvider implements CommentsProvider {

  final client = HTTPClient(baseUrl: url, apiKey: apiKey);

  @override
  Future<AppCommentChildren> childComments(String id) {
    final req = HTTPClientRequest(
        path: 'comments/$id',
        method: HTTPRequestMethod.get
    );
    return client.execute<AppCommentChildren>(req).then((res) =>
        res.asObject(AppCommentChildren.fromJSON));
  }

  @override
  Future<List<SummaryAppComment>> list() {
    final req = HTTPClientRequest(
        path: 'comments',
        method: HTTPRequestMethod.get
    );
    return client.execute<SummaryAppComment>(req).then((res) =>
        res.asList(SummaryAppComment.fromJSON));
  }

  @override
  Future<AppComment> postComment(String title, String? subtitle, String? ref) {
    final req = HTTPClientRequest(
        path: 'comments',
        method: HTTPRequestMethod.post,
        body: {'title': title, 'subtitle': subtitle, 'ref': ref},
        urlParams: userIdParam
    );
    return client.execute<AppComment>(req).then((res) =>
        res.asObject(AppComment.fromJSON));
  }
}