import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/visa_category_card.dart';
import 'package:couldai_user_app/data/mock_data.dart';
import 'package:couldai_user_app/screens/visa_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Helper to map string icon names to IconData
  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'school':
        return Icons.school;
      case 'work':
        return Icons.work;
      case 'home':
        return Icons.home;
      case 'tour':
        return Icons.tour;
      case 'family_restroom':
        return Icons.family_restroom;
      default:
        return Icons.article;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultoria de Vistos'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: MockData.visaTypes.length,
        itemBuilder: (context, index) {
          final visa = MockData.visaTypes[index];
          return VisaCategoryCard(
            title: visa.title,
            icon: _getIconData(visa.iconName),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VisaDetailScreen(visaType: visa),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
