import 'package:flutter/material.dart';

class VisaCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const VisaCategoryCard({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: Navigate to the document list screen for this visa type
          print('$title tapped');
        },
      ),
    );
  }
}
