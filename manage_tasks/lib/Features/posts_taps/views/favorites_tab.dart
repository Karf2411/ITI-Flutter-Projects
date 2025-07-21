import 'package:flutter/material.dart';
import 'package:manage_tasks/Features/posts_taps/data/post_model.dart';
import 'package:manage_tasks/Features/posts_taps/data/shared_posts.dart';
import 'package:manage_tasks/Features/posts_taps/views/widgets/post_item.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => FavoritesTabState();
}

class FavoritesTabState extends State<FavoritesTab> {
  late List<PostModel> favoritePosts;

  @override
  void initState() {
    super.initState();
    favoritePosts = SharedPosts.getFavoritePosts();
  }

  void toggleFavorite(int postId) {
    setState(() {
      SharedPosts.toggleFavorite(postId);
      favoritePosts = SharedPosts.getFavoritePosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    favoritePosts = SharedPosts.getFavoritePosts();

    return Scaffold(
      backgroundColor: const Color(0xFF1a2332),
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF1a2332),
        elevation: 0,
        centerTitle: true,
      ),
      body: favoritePosts.isEmpty
          ? const Center(
              child: Text(
                'No favorite posts yet.',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: favoritePosts.length,
              itemBuilder: (context, index) {
                final post = favoritePosts[index];
                return PostItem(
                  post: post,
                  onToggleFavorite: () => toggleFavorite(post.id),
                );
              },
            ),
    );
  }
}
