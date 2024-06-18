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

// class Multimedia {

//   final String title;
//   final String pathAudio;
//   final String pathVideo;
//   Multimedia({
//     required this.title,
//     required this.pathAudio,
//     required this.pathVideo,

//   });
// }

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