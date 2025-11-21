class VisaType {
  final String id;
  final String title;
  final String iconName; // We'll map this to IconData later
  final List<VisaDocument> documents;

  const VisaType({
    required this.id,
    required this.title,
    required this.iconName,
    required this.documents,
  });
}

class VisaDocument {
  final String name;
  final String? observation;

  const VisaDocument({
    required this.name,
    this.observation,
  });
}

class ConsultancyService {
  final String id;
  final String name;
  final String description;

  const ConsultancyService({
    required this.id,
    required this.name,
    required this.description,
  });
}

class MockData {
  static const List<ConsultancyService> services = [
    ConsultancyService(
      id: 'flight',
      name: 'Reserva de Voo',
      description: 'Reserva de passagem aérea para o requerente.',
    ),
    ConsultancyService(
      id: 'hotel',
      name: 'Reserva de Hotel',
      description: 'Reserva de hotel confirmada para o período.',
    ),
    ConsultancyService(
      id: 'accommodation_decl',
      name: 'Declaração de Alojamento',
      description: 'Documento formal comprovando local de estadia.',
    ),
    ConsultancyService(
      id: 'responsibility',
      name: 'Termo de Responsabilidade',
      description: 'Emissão de termo de responsabilidade.',
    ),
    ConsultancyService(
      id: 'university',
      name: 'Candidatura e Matrícula',
      description: 'Processo completo de inscrição na universidade (taxa adicional).',
    ),
  ];

  static const List<VisaType> visaTypes = [
    VisaType(
      id: 'study',
      title: 'Visto de Estudo',
      iconName: 'school',
      documents: [
        VisaDocument(name: 'Passaporte válido'),
        VisaDocument(name: 'Declaração de matrícula da instituição'),
        VisaDocument(name: 'Comprovativo de pagamento da matrícula'),
        VisaDocument(name: 'Comprovativo de meios de subsistência'),
        VisaDocument(name: 'Comprovativo de alojamento'),
        VisaDocument(name: 'Seguro de saúde'),
        VisaDocument(name: 'Registo criminal'),
        VisaDocument(name: 'Foto tipo passe'),
        VisaDocument(name: 'Formulário de pedido de visto preenchido'),
      ],
    ),
    VisaType(
      id: 'work',
      title: 'Visto de Trabalho',
      iconName: 'work',
      documents: [
        VisaDocument(name: 'Passaporte válido'),
        VisaDocument(name: 'Contrato de trabalho'),
        VisaDocument(name: 'Carta da empresa'),
        VisaDocument(name: 'Comprovativo de alojamento'),
        VisaDocument(name: 'Seguro de saúde'),
        VisaDocument(name: 'Registo criminal'),
        VisaDocument(name: 'Formulário de pedido de visto'),
        VisaDocument(name: '1 foto tipo passe'),
        VisaDocument(name: 'Comprovativo de rendimentos'),
      ],
    ),
    VisaType(
      id: 'residence',
      title: 'Visto de Residência',
      iconName: 'home',
      documents: [
        VisaDocument(name: 'Passaporte válido'),
        VisaDocument(name: 'Comprovativo de residência', observation: 'Contrato ou carta de alojamento'),
        VisaDocument(name: 'Comprovativo de rendimentos'),
        VisaDocument(name: 'Seguro de saúde'),
        VisaDocument(name: 'Formulário de pedido de visto'),
        VisaDocument(name: '1 foto tipo passe'),
        VisaDocument(name: 'Registo criminal'),
        VisaDocument(name: 'Outros documentos específicos'),
      ],
    ),
    VisaType(
      id: 'tourism',
      title: 'Visto de Turismo',
      iconName: 'tour',
      documents: [
        VisaDocument(name: 'Passaporte válido'),
        VisaDocument(name: 'Reserva de hotel'),
        VisaDocument(name: 'Passagem aérea de ida e volta'),
        VisaDocument(name: 'Comprovativo de meios financeiros'),
        VisaDocument(name: 'Seguro de viagem'),
        VisaDocument(name: 'Carta convite', observation: 'Se aplicável'),
        VisaDocument(name: 'Formulário de pedido de visto preenchido'),
        VisaDocument(name: '1 foto tipo passe'),
      ],
    ),
    VisaType(
      id: 'family',
      title: 'Visto de Reagrupamento Familiar',
      iconName: 'family_restroom',
      documents: [
        VisaDocument(name: 'Passaporte válido'),
        VisaDocument(name: 'Certidão familiar', observation: 'Casamento ou nascimento'),
        VisaDocument(name: 'Autorização de residência do familiar'),
        VisaDocument(name: 'Comprovativo de rendimentos do familiar'),
        VisaDocument(name: 'Comprovativo de alojamento'),
        VisaDocument(name: 'Seguro de saúde'),
        VisaDocument(name: 'Formulário de pedido de visto'),
        VisaDocument(name: '1 foto tipo passe'),
      ],
    ),
  ];
}
