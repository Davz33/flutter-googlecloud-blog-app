import 'package:flutter/material.dart';

void main() => runApp(BloggerCloneApp());

// Simple Post model
class Post {
  final String id;
  final String title;
  final String content;
  Post({required this.id, required this.title, required this.content});
}

// In-memory post list for demo
final List<Post> demoPosts = [
  Post(id: '1', title: 'First Post', content: 'This is the first post.'),
  Post(id: '2', title: 'Second Post', content: 'This is the second post.'),
  Post(id: '3', title: 'Third Post', content: 'This is the third post.'),
];

class BloggerCloneApp extends StatelessWidget {
  const BloggerCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fondue Blogger',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Color(0xFFF8F5F2),
        cardColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Color(0xFF222222),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => BlogHomePage(),
        '/post': (context) => PostPage(),
        '/new': (context) => NewPostPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/postDetails') {
          final post = settings.arguments as Post;
          return MaterialPageRoute(
            builder: (context) => PostDetailsPage(post: post),
          );
        }
        return null;
      },
    );
  }
}

class BlogHomePage extends StatelessWidget {
  const BlogHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fondue Blogger')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: demoPosts.length,
        itemBuilder: (context, index) {
          final post = demoPosts[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(post.title),
              subtitle: Text(post.content, maxLines: 2, overflow: TextOverflow.ellipsis),
              onTap: () => Navigator.pushNamed(
                context,
                '/postDetails',
                arguments: post,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/new'),
        tooltip: 'New Post',
        child: Icon(Icons.add),
      ),
    );
  }
}

class PostDetailsPage extends StatelessWidget {
  final Post post;
  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(post.content),
      ),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post')),
      body: Center(child: Text('Post details here')),
    );
  }
}

class NewPostPage extends StatelessWidget {
  const NewPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Post')),
      body: Center(child: Text('Post creation form here')),
    );
  }
}
