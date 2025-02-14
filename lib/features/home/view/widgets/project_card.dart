import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/utils/screen_size.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final List<String> technologies;
  final String description;
  final String imageUrl;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = context.isMobile; // Mobile breakpoint

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity, // Ensures it adapts to parent width
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: screenWidth * 0.9, // 90% of screen width
                    height: 250, // Fixed height for mobile
                    fit: BoxFit.cover,
                    imageUrl: imageUrl.isNotEmpty
                        ? imageUrl
                        : "https://res.cloudinary.com/dgvpyx7at/image/upload/f_auto,q_auto/ss5wsewp1dui8lq6gxpt",
                  ),
                ),
                const Gap(10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
                  ),
                ),
                const Gap(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: technologies
                      .map((tech) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                tech, // Adding bullet point
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ))
                      .toList(),
                ),
                const Gap(5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: screenWidth * 0.4, // 40% of screen width
                    height: 400, // Adjusted height
                    fit: BoxFit.cover,
                    imageUrl: imageUrl.isNotEmpty
                        ? imageUrl
                        : "https://res.cloudinary.com/dgvpyx7at/image/upload/f_auto,q_auto/ss5wsewp1dui8lq6gxpt",
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent,
                        ),
                      ),
                      const Gap(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: technologies
                            .map((tech) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      tech, // Adding bullet point
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      const Gap(5),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 20),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
