import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/mock_data.dart';

class VisaDetailScreen extends StatefulWidget {
  final VisaType visaType;

  const VisaDetailScreen({super.key, required this.visaType});

  @override
  State<VisaDetailScreen> createState() => _VisaDetailScreenState();
}

class _VisaDetailScreenState extends State<VisaDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // Local state to track checked documents. 
  // In a real app, this would be persisted to SharedPreferences or a Database.
  final Set<String> _checkedDocuments = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleDocument(String docName) {
    setState(() {
      if (_checkedDocuments.contains(docName)) {
        _checkedDocuments.remove(docName);
      } else {
        _checkedDocuments.add(docName);
      }
    });
  }

  void _requestService(BuildContext context, ConsultancyService service) {
    // Mock service request
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Solicitar ${service.name}'),
        content: Text('Deseja solicitar o serviço "${service.name}" ao consultor?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Solicitação para "${service.name}" enviada com sucesso!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.visaType.title),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Documentos', icon: Icon(Icons.description)),
            Tab(text: 'Serviços', icon: Icon(Icons.room_service)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDocumentsTab(),
          _buildServicesTab(),
        ],
      ),
    );
  }

  Widget _buildDocumentsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: widget.visaType.documents.length,
      itemBuilder: (context, index) {
        final doc = widget.visaType.documents[index];
        final isChecked = _checkedDocuments.contains(doc.name);

        return Card(
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 8),
          child: CheckboxListTile(
            value: isChecked,
            onChanged: (_) => _toggleDocument(doc.name),
            title: Text(
              doc.name,
              style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null,
                color: isChecked ? Colors.grey : null,
              ),
            ),
            subtitle: doc.observation != null ? Text(doc.observation!) : null,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }

  Widget _buildServicesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: MockData.services.length,
      itemBuilder: (context, index) {
        final service = MockData.services[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  service.description,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _requestService(context, service),
                    icon: const Icon(Icons.touch_app),
                    label: const Text('Solicitar Serviço'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
