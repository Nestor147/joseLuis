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

class Multimedia {

  final String title;
  final String pathAudio;
  final String pathVideo;
  Multimedia({
    required this.title,
    required this.pathAudio,
    required this.pathVideo,

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




  List<Content> leccionesAlumnos = [
    Content(
      id: 1,
      name: 'Desayuno a la orilla del mar',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Alumno/B-22-Q2-S-L01.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 2,
      name: 'Jesús va a la iglesia',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Alumno/B-22-Q2-S-L02.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 3,
      name: 'Panes y peces',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Alumno/B-22-Q2-S-L03.pdf',
      contentType: ContentType.Pdf
    )
  ];

  List<Content> leccionesMaestros = [
    Content(
      id: 4,
      name: 'Desayuno a la orilla del mar',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Maestro/B-22-Q2-S-L01-T.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 5,
      name: 'Jesús va a la iglesia',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Maestro/B-22-Q2-S-L02-T.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 6,
      name: 'Panes y peces',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Maestro/B-22-Q2-S-L03-T.pdf',
      contentType: ContentType.Pdf
    )
  ];

  List<Content> materiales = [
    Content(
      id: 7,
      name: 'Actividades-Alumnos',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Alumno/B-22-Q2-S-Activities.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 8,
      name: 'Introducción-Alumnos',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Alumno/B-22-Q2-S-L00.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 9,
      name: 'Alumno-completo',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Alumno/CunaAlumno_2do2022.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 10,
      name: 'Actividades-Maestro',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Maestro/B-22-Q2-S-Activities-T.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 11,
      name: 'Introducción-Maestro',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Maestro/B-22-Q2-S-L00-T.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 12,
      name: 'Maestro-completo',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Maestro/CunaMaestro_2do2022.pdf',
      contentType: ContentType.Pdf
    ),
    // Content(
    //   id: 13,
    //   name: 'Mapa-Misionero-2T',
    //   content: 'https://drive.google.com/file/d/1daTnh2NXWeZetYKVyZYgOrOAIizIua9d/view',
    //   contentType: ContentType.Pdf
    // ),
    Content(
      id: 14,
      name: 'Cuaderno-Actividades',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Cuna/2do2022/Actividades%20Cuna%202T%20A.pdf',
      contentType: ContentType.Pdf
    )
  ];

  List<Content> multimediaAudios = [
    Content(
      id: 15,
      name: 'Las clases terminaron',
      content: '1_las_clases_terminaron.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 16,
      name: 'Hagamos bien a todos',
      content: '2_hagamos_bien_a_todos.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 17,
      name: 'Compartimos los juguetes',
      content: '3_compartimos_los_juguetes.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 18,
      name: 'Un pescadito 2 pescaditos',
      content: '4_un_pescadito_2_pescaditos.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 19,
      name: 'Compartimos la comida',
      content: '5_compartimos_la_comida.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 20,
      name: 'Hagamos bien a todos',
      content: '6_hagamos_bien_a_todos.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 21,
      name: 'Compartimos la comida',
      content: '7_compartimos_la_comida.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 22,
      name: 'Jesus es amor',
      content: '8_jesus_es_amor.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 23,
      name: 'La brisa sopla suave',
      content: '9_la_brisa_sopla_suave.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 24,
      name: 'Pasear vamos a pasear',
      content: '10_pasear_vamos_a_pasear.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 25,
      name: 'Un pescaditos 2 pescaditos',
      content: '11_un_pescaditos_2_pescaditos.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 26,
      name: 'Hagamos bien a todos',
      content: '12_hagamos_bien_a_todos.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 27,
      name: 'Tema 3',
      content: '13_tema3.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 28,
      name: 'Las clases terminaron',
      content: '14_las_clases_terminaron_copia.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 29,
      name: 'Vamos a la casa del señor',
      content: '15_vamos_a_la_casa_del_senor.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 30,
      name: 'Me gusta ir a la iglesia',
      content: '16_me_gusta_ir_a_la_iglesia.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 31,
      name: 'Canto 17',
      content: '17_contento_estoy_que_vine_hoy.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 32,
      name: 'Si cristo me ama',
      content: '18_si_cristo_me_ama.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 33,
      name: 'Quietito escucho el sermon',
      content: '19_quietito_escucho_el_sermon.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 34,
      name: 'Biblia biblia',
      content: '20_biblia_biblia.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 35,
      name: 'Me arrodillo para orar a jesus',
      content: '21_me_arrodillo_para_orar_a_jesus.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 36,
      name: 'Oh cuanto amo a cristo',
      content: '22_oh_cuanto_amo_a_cristo.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 37,
      name: 'El reloj nos dice tic tac',
      content: '23_el_reloj_nos_dice_tic_tac.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 38,
      name: 'Es la casa de jesus',
      content: '24_es_es_la_casa_de_jesus.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 39,
      name: 'A la iglesia quiero ir',
      content: '25_a_la_iglesia_quiero_ir.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 40,
      name: 'Mi ropa linda traigo hoy',
      content: '26_mi_ropa_linda_traigo_hoy.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 41,
      name: 'Es el dia mas feliz',
      content: '27_es_el_dia_mas_feliz.mp3',
      contentType: ContentType.Audio
    ),
    Content(
      id: 42,
      name: 'Vamos a la casa del señor',
      content: '28_vamos_a_la_casa_del_senor.mp3',
      contentType: ContentType.Audio
    ),
   
  ];

  List<Content>multimediaVideos=[
 Content(
      id: 43,
      name: 'Culto familiar con bebes',
      content: 'https://www.youtube.com/watch?v=v_PpzoLfAsg',
      contentType: ContentType.Video
    )
  ];

 

    List<Content> misionero = [
    Content(
      id: 45,
      name: 'Eres especial',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_1%20Rusia%2C%206%20de%20abril%20Sasha.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 46,
      name: 'La oración resuelve problemas',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_2%20Rusia%20%2C%2013%20de%20abril%20.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 47,
      name: 'Protégenos en el camino”',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_3%20Rusia%2C%2020%20de%20abril%20Daniil%20.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 48,
      name: 'Fuera de este mundo',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_4%20Rusia%2C%2027%20de%20abril%20Iv%C3%A1n.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 49,
      name: '¿Santa Claus o Jesús?',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_5%20Rusia%2C%204%20de%20mayo%20Kamila.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 50,
      name: 'Dos oídos para oír',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_6%20Bielorrusia%2C%2011%20de%20mayo%20Ales.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 51,
      name: 'Hacer amigos',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_7%20Uzbekist%C3%A1n%2C%2018%20de%20mayo%20Dasha.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 52,
      name: 'Con un agujero en el corazón',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_8%20Uzbekist%C3%A1n%2C%2025%20de%20mayo%20.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 53,
      name: 'En las manos de Dios',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_9%20Georgia%2C%201.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 54,
      name: 'Un regalo de Dios',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_10%20Georgia%2C%208%20de%20junio%20Alex.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 55,
      name: '¿Quién conoce el futuro?',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_11%20Armenia%2C%2015%20de%20junio%20Yakov.pdf',
      contentType: ContentType.Pdf
    ),
     Content(
      id: 55,
      name: 'El concurso de talentos',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/MisioneroNi%C3%B1os/2DO2024/_12%20Armenia%2C%2022%20de%20junio%20Syuzanna.pdf',
      contentType: ContentType.Pdf
    ),
  ];

   List<Content> extras = [
    Content(
      id: 44,
      name: 'El Maestro y la Presentación de la Lección de Escuela Sabática – pptx',
      content: 'https://www.recursos-biblicos.com/2014/04/el-maestro-y-la-presentacion-de-la-leccion-escuela-sabatica.html',
      contentType: ContentType.Pdf
    )
  ];

