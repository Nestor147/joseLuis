import 'package:flutter/material.dart';

class ExtrasScreen extends StatefulWidget {
  const ExtrasScreen({super.key});

  @override
  State<ExtrasScreen> createState() => _ExtrasScreenState();
}

class _ExtrasScreenState extends State<ExtrasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RECUERDA",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: const Color.fromARGB(255, 11, 35, 86),),
      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.fromLTRB(15, 5, 15, 3),
        child: Column(children: [
        Text("Campo Misionero",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
        Text("El maestro tiene en su unidad un excelente campo misionero para conducirá las almas al reino de Dios. Por eso es necesario elegirlos bien y prepararlos convenientemente para su sagrada función.",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
        Text("El Don de la enseñanza",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
        Text("Algunos ya nacen con mayor talento para la enseñanza que otros, sin embargo, son minoría. La mayor parte de los maestros de éxito se formaron a través de perseverante esfuerzo, disciplina y estudio. Cualquier Individuo puede ser un buen maestro, siempre y cuando este dispuesto a pagar el precio.",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
         Text("Como preparar la lección",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
         Text("La preparación de la lección debe comenzar el sábado por la tarde, con una vista general de su contenido y una recapitulación diaria durante la semana. Esa preparación debe Incluir no sólo el estudio de la lección en si, con la consecuente Investigación de las respuestas en la Biblia, sino también las fuentes adicionales, como libros del Espíritu de Profecía, diccionarios, concordancias y comentarlo bíblico.",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
           Text("Establecer el objetivo",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
          Text("Después que el maestro consiga una comprensión clara del lema de la lección, deberla preguntarse: «¿Para que fue escrita esta lección? ¿Que se puede conseguir con ella? ¿Que resultado espiritual podría ser alcanzado en la vida de los alumnos?»",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
          Text("Conocer a los alumnos",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
           Text("Para que la lección pueda ser aplicada adecuadamente a las necesidades de los alumnos, es importante que el maestro conozca bien cuáles son sus necesidades espirituales.",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
           Text("Presentacion de la leccion",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
            Text("Anunciar el título del estudio, hacer una breve introducción y pasar directamente a los principales puntos. Preguntar a varios alumnos cuál fue el punto que más les llamó la atención en la lección, y asi involucrar a todos para que el estudio sea dinámico y participativo.",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
            Text("El uso de preguntas",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
             Text("Las preguntas fuerzan a los alumnos a pensar, muestran lo que ellos saben, captan la atención y estimulan la participación. De allí lo importancia de saber formularlos. Las preguntas pueden ser de varios tipos, pero las mejores para el momento del estudio son los que llevan al alumno a pensar sin dejarlos en aprietos o constreñidos. Ejemplos: – ¿Qué significa la Biblia para usted? – ¿Cuál es su opinión?",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
            Text("El uso de ilustraciones",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
            Text("Utilice pocas y buenas Ilustraciones, que sean simples y comprensibles al alumno. Un maestro dinámico sabe elegir ilustraciones apropiadas para volver clara una verdad. Jesús extraía sus Ilustraciones de la Palabra de Dios, de la naturaleza y de la vida. Estas son las mejores.",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
        SizedBox(height: 15,),
            Text("Conclusión de la lección",style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 11, 35, 86),fontSize: 20),),
        SizedBox(height: 10,),
            Text("Termine siempre la lección de manera positiva, con un llamado para la aplicación práctica del tema estudiado y expresando su confianza en la dirección de Dios.",style: TextStyle(color: Color.fromARGB(255, 11, 35, 86)),),
      ],),
        )
      )
    );
  }
}