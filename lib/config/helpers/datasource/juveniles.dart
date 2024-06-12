enum ContentType {
  Audio, Video, Image, Url, Pdf
}

class Content {
  final int id;
  final String name;
  final String content;
  final ContentType contentType;

  Content({
    required this.id,
    required this.name,
    required this.content,
    required this.contentType
  });
}

class Section {
  final String name;
  final List<Content> contents;

  Section({
    required this.name,
    required this.contents,
  });
}

class Category {
  final String name;
  final List<Section> sections;

  Category({
    required this.name,
    required this.sections,
  });
}


  List<Content> lecciones = [
     Content(id: 1, name: 'Leccion 1 Rechazando el llamado para servir', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L01.pdf', contentType: ContentType.Pdf),
    Content(id: 2, name: 'Leccion 2 El turno de los profetas', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L02.pdf', contentType: ContentType.Pdf),
    Content(id: 3, name: 'Leccion 3 Milagros', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L03.pdf', contentType: ContentType.Pdf),
    Content(id: 4, name: 'Leccion 4 Las siete inmersiones', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L04.pdf', contentType: ContentType.Pdf),
    Content(id: 5, name: 'Leccion 5 Orgullo y preconcepto', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L05.pdf', contentType: ContentType.Pdf),
    Content(id: 6, name: 'Leccion 6 Corazón partido', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L06.pdf', contentType: ContentType.Pdf),
    Content(id: 7, name: 'Leccion 7 ¿Estás disponible? Isaías nos recuerda tres', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L07.pdf', contentType: ContentType.Pdf),
    Content(id: 8, name: 'Leccion 8 ¿Esperanza para el mundo?', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L08.pdf', contentType: ContentType.Pdf),
    Content(id: 9, name: 'Leccion 9 Peligro a la vista El miedo tiene el potencial de', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L09.pdf', contentType: ContentType.Pdf),
    Content(id: 10, name: 'Leccion 10 Receta para el reavivamiento', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L10.pdf', contentType: ContentType.Pdf),
    Content(id: 11, name: 'Leccion 11 Diferente de los otros', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L11.pdf', contentType: ContentType.Pdf),
    Content(id: 12, name: 'Leccion 12 Tres reyes diferentes', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L12.pdf', contentType: ContentType.Pdf),
    Content(id: 13, name: 'Leccion 13 Limpiando la casa', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_L13.pdf', contentType: ContentType.Pdf),];

  List<Content> material = [
    Content(id: 14, name: 'introduccion', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Juveniles/2do2024/A/_Intro.pdf', contentType: ContentType.Pdf),
  ];
  List<Content> multimedia = [];
  List<Content> extras = [];



