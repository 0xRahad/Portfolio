import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Recent Projects",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Gap(10),
      ],
    );
  }
}

class RecentProjectCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String usedTechnologies;

  const RecentProjectCard({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.usedTechnologies,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 220,
        width: 600,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.2))),
        child: Row(
          children: [
            CldImageWidget(
                publicId: 'sample.jpg',
                transformation: Transformation()
                  ..resize(Resize.crop()
                    ..width(100)
                    ..height(150))
            ),
        
          ],
        ),
      ),
    );
  }
}
