import 'package:flutter/material.dart';
import '../models/article_info.dart';

class PostView extends StatelessWidget {
  final Article article;
  const PostView({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: (article.thumbUrl != null && article.thumbUrl!.isNotEmpty)
                        ? NetworkImage(article.thumbUrl!)
                        : const AssetImage('assets/no_image.jpg') as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.headLine ?? "",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.2),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const CircleAvatar(radius: 14, child: Icon(Icons.person, size: 15)),
                        const SizedBox(width: 12),
                        Text(
                          "${article.writer} • ${article.date?.day}/${article.date?.month}/${article.date?.year}",
                          style: TextStyle(color: Colors.grey[700], fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          article.body ?? article.description ?? "No content available",
                          style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black87),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}