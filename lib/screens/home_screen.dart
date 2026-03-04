import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/article_cubit.dart';
import '../controller/article_state.dart';
import 'post_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleCubit>().loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'News',
          style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w900),
        ),
      ),
      body: BlocBuilder<ArticleCubit, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticleSuccess) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: state.dataList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemBuilder: (context, index) {
                final item = state.dataList[index];
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PostView(article: item)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.headLine ?? "No Title",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 1.3),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.writer ?? "Unknown",
                              style: const TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 110,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: item.thumbUrl != null && item.thumbUrl!.isNotEmpty
                                ? NetworkImage(item.thumbUrl!)
                                : const AssetImage('assets/no_image.jpg') as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Error loading news"));
          }
        },
      ),
    );
  }
}