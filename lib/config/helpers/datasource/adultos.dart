

  import 'package:cuteapp/config/helpers/models/document.dart';

List<Content> leccionesAdultos = [
    Content(id: 1, name: 'Lección 1. La guerra detrás de todas las guerras  6 de abril', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2001%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 2, name: 'Lección 2. ¿Amor o egoísmo? Esa es la cuestión  13 de abril', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2002%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 3, name: 'Lección 3. La luz brilla en la oscuridad  20 de abril', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2003%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 4, name: 'Lección 4. Defendamos la verdad  27 de abril', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2004%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 5, name: 'Lección 5. Fe contra todo pronóstico  4 de mayo', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2005%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 6, name: 'Lección 6. Los dos testigos  11 de mayo', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2006%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 7, name: 'Lección 7. Motivados por la esperanza  18 de mayo', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2007%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 8, name: 'Lección 8. Luz desde el Santuario.  25 de mayo', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2008%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 9, name: 'Lección 9. El fundamento del gobierno de Dios  1° de junio', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2009%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 10, name: 'Lección 10. El espiritismo desenmascarado  8 de junio', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2010%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 11, name: 'Lección 11. El conflicto inminente.  15 de junio', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2011%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 12, name: 'Lección 12. Los acontecimientos finales de la Tierra  22 de junio', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2012%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
    Content(id: 13, name: 'Lección 13. El triunfo del amor de Dios  29 de junio', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/_Leccion%2013%20Segundo%20Trimestre%202024.pdf', contentType: ContentType.Pdf),
  ];

  List<Content> materialAdulto = [];

  List<Content> extras = [
      Content(id: 22, name: ' Leccion-completa-PDF-Segundo-Trimestre-2024', content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/Leccion/2do%202024/Leccion-completa-PDF-Segundo-Trimestre-2024.pdf', contentType: ContentType.Pdf),

   
  ];
 List<Content>multimediaAudiosAdultos=[

  ];
  List<Content>multimediaVideosAdultos=[
 Content(
      id: 25,
      name: ' El Conflicto Inminente',
      content: 'https://www.youtube.com/watch?v=MbgUNfH_t8I',
      contentType: ContentType.Video
    ),
   
  ];


  Section leccionesSection = Section(name: 'Lecciones', contents: leccionesAdultos);
  Section materialSection = Section(name: 'Material', contents: materialAdulto);
  Section extrasSection = Section(name: 'Extras', contents: extras);

  Category leccionAdultosCategory = Category(
    name: 'Lección Adultos SEGUNDO Trimestre 2024',
    sections: [leccionesSection, materialSection, extrasSection],
  );



