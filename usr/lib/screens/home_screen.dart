import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/visa_category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acompanhamento Imigratório'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          VisaCategoryCard(
            title: 'Visto de Estudo',
            icon: Icons.school,
          ),
          VisaCategoryCard(
            title: 'Visto de Trabalho',
            icon: Icons.work,
          ),
          VisaCategoryCard(
            title: 'Visto de Residência',
            icon: Icons.home,
          ),
          VisaCategoryCard(
            title: 'Visto de Turismo',
            icon: Icons.tour,
          ),
          VisaCategoryCard(
            title: 'Visto para Reagrupamento Familiar',
            icon: Icons.family_restroom,
          ),
        ],
      ),
    );
  }
}
