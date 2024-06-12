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
  Content(
    id: 4,
    name: 'Lección 1. El método “tú primero” (06 de abril)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L01.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 5,
    name: 'Lección 2. Una gran tempestad (13 de abril)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L02.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 6,
    name: 'Lección 3. La mujer junto al pozo (20 de abril)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L03.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 7,
    name: 'Lección 4. El desayuno con Jesús (27 de abril)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L04.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 8,
    name: 'Lección 5. En cualquier momento (04 de mayo)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L05.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 9,
    name: 'Lección 6. Jesús lee en la iglesia (11 de mayo)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L06.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 10,
    name: 'Lección 7. ¡Al fin sanada! (18 de mayo)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L07.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 11,
    name: 'Lección 8. Uno dijo “gracias” (25 de junio)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L08.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 12,
    name: 'Lección 9. La ofrenda de la viuda pobre (01 de junio)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L09.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 13,
    name: 'Lección 10. Jesús asiste a una fiesta (08 de junio)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L10.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 14,
    name: 'Lección 11. Sígueme (15 de junio)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L11.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 15,
    name: 'Lección 12. Amigos especiales (22 de junio)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L12.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 16,
    name: 'Lección 13. Un niñito comparte (29 de junio)-alumnos',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L13-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 4,
    name: 'Lección 1. El método “tú primero” (06 de abril)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L01-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 5,
    name: 'Lección 2. Una gran tempestad (13 de abril)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L02-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 6,
    name: 'Lección 3. La mujer junto al pozo (20 de abril)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L03.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 7,
    name: 'Lección 4. El desayuno con Jesús (27 de abril)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L04-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 8,
    name: 'Lección 5. En cualquier momento (04 de mayo)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L05-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 9,
    name: 'Lección 6. Jesús lee en la iglesia (11 de mayo)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L06-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 10,
    name: 'Lección 7. ¡Al fin sanada! (18 de mayo)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L07-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 11,
    name: 'Lección 8. Uno dijo “gracias” (25 de junio)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L08-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 12,
    name: 'Lección 9. La ofrenda de la viuda pobre (01 de junio)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L09-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 13,
    name: 'Lección 10. Jesús asiste a una fiesta (08 de junio)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L10-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 14,
    name: 'Lección 11. Sígueme (15 de junio)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L11-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 15,
    name: 'Lección 12. Amigos especiales (22 de junio)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L12-T.pdf',
    contentType: ContentType.Pdf
  ),
  Content(
    id: 16,
    name: 'Lección 13. Un niñito comparte (29 de junio)-maestros',
    content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L13-T.pdf',
    contentType: ContentType.Pdf
  )
];


  List<Content> materiales = [
    Content(
      id: 1,
      name: 'Introducción-alumno',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-L00.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 2,
      name: 'Actividades-alumno',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-Activities.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 3,
      name: 'Versículos-alumno',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Alumno/K-20-Q2-S-MemoryVerse.pdf',
      contentType: ContentType.Pdf
    ), Content(
      
      id: 17,
      name: 'Introducción-maestros',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-L00-T.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 18,
      name: 'Actividades-maestros',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-Activity-T.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 19,
      name: 'Versículos-maestros',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Maestro/K-20-Q2-S-MemoryVerse-T.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 20,
      name: 'Mapa misionero 2do 2024',
      content: 'https://drive.google.com/file/d/1daTnh2NXWeZetYKVyZYgOrOAIizIua9d/view',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 21,
      name: 'Cuaderno de actividades - PDF2',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/Actividades%20Infantes%202T%20A.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 22,
      name: 'Cuaderno de actividades - Colorear',
      content: 'https://s3.us-east-2.wasabisys.com/rebiblicos/Escuela%20Sabatica/InfantilesyJuveniles/Infantes/2do%202020/cuaderno_para_colorear.pdf',
      contentType: ContentType.Pdf
    ),
    Content(
      id: 23,
      name: 'Album de versículos',
      content: 'https://drive.google.com/file/d/1kul5FojY688oh-arE7bHYEFbGPQCjgLf/view',
      contentType: ContentType.Pdf
    )
  ];
  List<Content> multimedia = [
  Content(
    id: 24,
    name: 'i02 amigos por jesus',
    content: 'i02_amigos_por_jesus.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 25,
    name: 'i03 yo voy a la iglesia',
    content: 'i03_yo_voy_a_la_iglesia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 26,
    name: 'i04 en este sabado feliz',
    content: 'i04_en_este_sabado_feliz.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 27,
    name: 'i05 muy feliz cumpleanos',
    content: 'i05_muy_feliz_cumpleanos.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 28,
    name: 'i06 yo traigo mi ofrenda',
    content: 'i06_yo_traigo_mi_ofrenda.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 29,
    name: 'i07 OH bendice las ofrendas',
    content: 'i07_OH_bendice_las_ofrendas.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 30,
    name: 'i08 todos de rodillas',
    content: 'i08_todos_de_rodillas.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 31,
    name: 'i09 querido jesus gracias por tu amor',
    content: 'i09_querido_jesus_gracias_por_tu_amor.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 32,
    name: 'i10 te digo adios',
    content: 'i10_te_digo_adios.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 33,
    name: 'i11 yo comparto tu compartes',
    content: 'i11_yo_comparto_tu_compartes.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 34,
    name: 'i12 si tengo una fruta',
    content: 'i12_si_tengo_una_fruta.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 35,
    name: 'i13 primero tu y luego yo',
    content: 'i13_primero_tu_y_luego_yo.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 36,
    name: 'i14 boga botecito',
    content: 'i14_boga_botecito.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 37,
    name: 'i15 la lluvia cae se agita el mar',
    content: 'i15_la_lluvia_cae_se_agita_el_mar.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 38,
    name: 'i16 Dios cuida de ti',
    content: 'i16_Dios_cuida_de_ti.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 39,
    name: 'i17 si cristo me ama',
    content: 'i17_si_cristo_me_ama.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 40,
    name: 'i18 De su trono mi Jesus',
    content: 'i18_De_su_trono_mi_Jesus.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 41,
    name: 'i19 habla a tu Dios de manana',
    content: 'i19_habla_a_tu_Dios_de_manana.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 42,
    name: 'i20 Cristo quiere que yo brille',
    content: 'i20_Cristo_quiere_que_yo_brille.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 43,
    name: 'i21 somos ayudantes',
    content: 'i21_somos_ayudantes.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 44,
    name: 'i22 orare a Jesus dia a dia copia',
    content: 'i22_orare_a_Jesus_dia_a_dia_copia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 45,
    name: 'i23 si hablamos con jesus',
    content: 'i23_si_hablamos_con_jesus.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 46,
    name: 'i24 yo vengo a la iglesia',
    content: 'i24_yo_vengo_a_la_iglesia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 47,
    name: 'i25 habla a tu Dios de manana copy',
    content: 'i25_habla_a_tu_Dios_de_manana_copy.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 48,
    name: 'i26 el taller yo limpio',
    content: 'i26_el_taller_yo_limpio.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 49,
    name: 'i27 es hora de cenar',
    content: 'i27_es_hora_de_cenar.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 50,
    name: 'i28 mi carita lavo asi',
    content: 'i28_mi_carita_lavo_asi.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 51,
    name: 'i29 mis dientes yo cepillo',
    content: 'i29_mis_dientes_yo_cepillo.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 52,
    name: 'i30 a la iglesia vengo asi',
    content: 'i30_a_la_iglesia_vengo_asi.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 53,
    name: 'i31 ALABEMOS AL SENOR',
    content: 'i31_ALABEMOS_AL_SENOR.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 54,
    name: 'i32 Dios cuida de ti copy',
    content: 'i32_Dios_cuida_de_ti_copy.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 55,
    name: 'i33 orare a Jesus dia a dia',
    content: 'i33_orare_a_Jesus_dia_a_dia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 56,
    name: 'i34 boga botecito copia',
    content: 'i34_boga_botecito_copia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 57,
    name: 'i35 con trompeta y arpa',
    content: 'i35_con_trompeta_y_arpa.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 58,
    name: 'i36 De su trono mi Jesus pista',
    content: 'i36_De_su_trono_mi_Jesus_pista.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 59,
    name: 'i37 Dios cuida de ti copy 1',
    content: 'i37_Dios_cuida_de_ti_copy_1.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 60,
    name: 'i38 dia y noche con gozo alabemos copy copia',
    content: 'i38_dia_y_noche_con_gozo_alabemos_copy_copia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 61,
    name: 'i39 mi jesus gracias',
    content: 'i39_mi_jesus_gracias.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 62,
    name: 'i40 Dios mi Dios yo te alabare',
    content: 'i40_Dios_mi_Dios__yo_te_alabare.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 63,
    name: 'i41 dios ama al dador feliz',
    content: 'i41_dios_ama_al_dador_feliz.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 64,
    name: 'i42 que felicidad con jesus en la familia',
    content: 'i42_que_felicidad_con_jesus_en_la_familia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 65,
    name: 'i43 amigo tengo que me ama',
    content: 'i43_amigo_tengo_que_me_ama.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 66,
    name: 'i44 quien es jesus es el hijo de dios',
    content: 'i44_quien_es_jesus_es_el__hijo_de_dios.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 67,
    name: 'i45 se bueno se fiel se amable y leal copy copia',
    content: 'i45_se_bueno_se_fiel_se_amable_y_leal_copy_copia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 68,
    name: 'i46 me gusta hacer por otros algo bueno copia',
    content: 'i46_me_gusta_hacer_por_otros_algo_bueno_copia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 69,
    name: 'i47 se bueno se fiel se amable y leal copy copia',
    content: 'i47_se_bueno_se_fiel_se_amable_y_leal_copy_copia.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 70,
    name: 'i48 ayudo a mi mamita',
    content: 'i48_ayudo_a_mi_mamita.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 71,
    name: 'i49 amigo tengo que me cuida',
    content: 'i49_amigo_tengo_que_me_cuida.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 72,
    name: 'i50 yo comparto tu compartes copy',
    content: 'i50_yo_comparto_tu_compartes_copy.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 73,
    name: 'i51 me gusta hacer por otros algo bueno',
    content: 'i51_me_gusta_hacer_por_otros_algo_bueno.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 74,
    name: 'i52 se bueno se fiel se amable y leal copy',
    content: 'i52_se_bueno_se_fiel_se_amable_y_leal_copy.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 75,
    name: 'i53 amigo tengo que me ama copy',
    content: 'i53_amigo_tengo_que_me_ama_copy.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 76,
    name: 'i54 uno dos y tres leprosos',
    content: 'i54_uno_dos_y_tres_leprosos.mp3',
    contentType: ContentType.Audio
  ),
  Content(
    id: 77,
    name: 'i55 uno dos y tres leprosos pista',
    content: 'i55_uno_dos_y_tres_leprosos_pista.mp3',
    contentType: ContentType.Audio
  ),
];


  List<Content> extras = [
    Content(
      id: 53,
      name: 'Décimo Tercer Sábado',
      content: 'https://drive.google.com/file/d/16uf7UGstnyYTPUhZTQWhYs5DNjZa2VoA/edit',
      contentType: ContentType.Pdf
    )
  ];

