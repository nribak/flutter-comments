
import 'package:comments_app/src/data/comments_model.dart';
import 'package:comments_app/src/data/di/app_config.dart';
import 'package:comments_app/src/data/providers/comments_provider.dart';
import 'package:comments_app/src/data/providers/http_client.dart';

class CommentsAPIProvider implements CommentsProvider {
  final HTTPClient client = HTTPClient(baseUrl: AppConfig.instance().apiBaseUrl, apiKey: AppConfig.instance().apiKey);

  @override
  Future<AppCommentChildren?> childComments(String id) {
    final req = HTTPClientRequest(
        path: 'comments/$id',
        method: HTTPRequestMethod.get
    );
    return client.execute<AppCommentChildren>(req).then((res) =>
        res.isSuccess() ? res.asObject(AppCommentChildren.fromJSON) : null);
  }

  @override
  Future<List<SummaryAppComment>> list() {
    final req = HTTPClientRequest(
        path: 'comments',
        method: HTTPRequestMethod.get
    );
    return client.execute<SummaryAppComment>(req).then((res) =>
        res.isSuccess() ? res.asList(SummaryAppComment.fromJSON): []);
  }

  @override
  Future<AppComment?> postComment(String title, String? subtitle, String? ref) {
    final userId = AppConfig.instance().userId;
    final req = HTTPClientRequest(
        path: 'comments',
        method: HTTPRequestMethod.post,
        body: {'title': title, 'subtitle': subtitle, 'ref': ref},
        urlParams: {'userId': userId}
    );
    return client.execute<AppComment>(req).then((res) =>
        res.isSuccess() ? res.asObject(AppComment.fromJSON) : null);
  }
}