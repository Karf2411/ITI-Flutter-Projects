import 'package:flutter/material.dart';
import 'package:manage_tasks/Features/posts_taps/data/api_service.dart';
import 'package:manage_tasks/Features/posts_taps/data/shared_posts.dart';
import 'package:manage_tasks/Features/posts_taps/views/widgets/post_item.dart';
import '../data/post_model.dart';

class PostsTab extends StatefulWidget {
  const PostsTab({super.key});

  @override
  State<PostsTab> createState() => _PostsTabState();
}

class _PostsTabState extends State<PostsTab> {
  List<PostModel> filteredPosts = [];
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    if (SharedPosts.posts.isEmpty) {
      try {
        setState(() {
          isLoading = true;
          errorMessage = null;
        });

        final fetchedPosts = await ApiService.fetchPosts();
        SharedPosts.setPosts(fetchedPosts);

        setState(() {
          filteredPosts = SharedPosts.posts;
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          errorMessage = e.toString();
          isLoading = false;
        });
      }
    } else {
      setState(() {
        filteredPosts = SharedPosts.posts;
        isLoading = false;
      });
    }
  }

  void toggleFavorite(int postId) {
    setState(() {
      SharedPosts.toggleFavorite(postId);
      filterPosts(searchController.text);
    });
  }

  void filterPosts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPosts = SharedPosts.posts;
      } else {
        filteredPosts = SharedPosts.posts
            .where(
              (post) => post.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isSearching) {
      filteredPosts = SharedPosts.posts;
    }
    return Scaffold(
      backgroundColor: const Color(0xFF1a2332),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: const BoxDecoration(
              color: Color(0xFF1a2332),
              border: Border(
                bottom: BorderSide(color: Colors.white24, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: isSearching
                      ? TextField(
                          controller: searchController,
                          autofocus: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: 'Search posts...',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white54,
                            ),
                          ),
                          onChanged: filterPosts,
                        )
                      : const Text(
                          'Posts',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
                IconButton(
                  icon: Icon(
                    isSearching ? Icons.close : Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      if (isSearching) {
                        isSearching = false;
                        searchController.clear();
                        filteredPosts = SharedPosts.posts;
                      } else {
                        isSearching = true;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildBody(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF00FF00)),
      );
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 64),
            const SizedBox(height: 16),
            Text(
              'there was an error please try again',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage!,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loadPosts,
              child: const Text('try again'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        final post = filteredPosts[index];
        return PostItem(
          post: post,
          onToggleFavorite: () => toggleFavorite(post.id),
        );
      },
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
