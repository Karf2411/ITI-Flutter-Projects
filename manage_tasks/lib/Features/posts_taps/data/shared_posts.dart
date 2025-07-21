import 'package:manage_tasks/Features/posts_taps/data/post_model.dart';

class SharedPosts {
  static List<PostModel> posts = [];

  static void setPosts(List<PostModel> fetchedPosts) {
    posts = fetchedPosts;
  }

  static void toggleFavorite(int postId) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      posts[postIndex].isFavorite = !posts[postIndex].isFavorite;
    }
  }

  static List<PostModel> getFavoritePosts() {
    return posts.where((post) => post.isFavorite).toList();
  }
}
