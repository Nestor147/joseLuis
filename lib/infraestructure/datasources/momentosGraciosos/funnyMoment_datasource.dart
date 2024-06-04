// import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// final FirebaseStorage storage =FirebaseStorage.instance;
// class FunnyMoments{
//    Future<List<ImageFunnyMoment>> getAllImagesWithMetadata() async {
//     final ListResult images = await storage.ref().child("momentosGraciosos").listAll();    
//     final List<ImageFunnyMoment> imageMetadatas =[];

//     var response= images.items;
//    final responseData = response.map((imageUser) async {
//       final FullMetadata metadata = await imageUser.getMetadata();
//       return ImageFunnyMoment (
//         title: metadata.customMetadata?['title'] ?? "No hay titulo",
//         imageUrl: await imageUser.getDownloadURL(),
//         description: metadata.customMetadata?['description'] ?? "No hay descripcion", 
//         userId: metadata.customMetadata?['userId'] ?? "No hay Id",  
//       );
//     }).toList() ;
//     final imageMetadataResolved=await responseData;
//     print(imageMetadatas);
//     return imageMetadatas;
//   }
// }


import 'package:cuteapp/domain/datasource/momentosGraciosos/funnyMoment_datasource.dart';
import 'package:cuteapp/domain/entities/momentosGraciosos/imageFunnyMoment.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage =FirebaseStorage.instance;
class FunnyMomentDataSourceImpl extends FunnyMomentDatasource{
   Future<List<ImageFunnyMoment>> getFunnyImage() async {
    final ListResult images = await storage.ref().child("momentosGraciosos").listAll();    
    print(images);
    final List<ImageFunnyMoment> imageMetadatas =[];


   for (final image in images.items) {
     // print("esta es la url ${await image.getDownloadURL()}");
     final FullMetadata metadata = await image.getMetadata();
          final ImageFunnyMoment imageMetadata = ImageFunnyMoment(
       // image: image,
       title: metadata.customMetadata?['title'] ?? "no hay titulo",
       imageUrl:await image.getDownloadURL(),
       description: metadata.customMetadata?['description'] ?? "No hay descricion",
       userId: metadata.customMetadata?['userId'] ?? "NO ah¿¿hay Id",
     );
     imageMetadatas.add(imageMetadata);
   }

    print(imageMetadatas);
    return imageMetadatas;
  }
  
 
}