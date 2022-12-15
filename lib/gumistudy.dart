class GumiStudy{
  final int id;
  final String judul;
  final String img;
  final String prolog;
  final String subjudul1;
  final String materi1;
  final String subjudul2;
  final String materi2;
  final String subjudul3;
  final String materi3;
  final String subjudul4;
  final String materi4;
  final bool isSaved;

  GumiStudy(
    {
      required this.id,
      required this.judul,
      required this.img,
      required this.prolog,
      required this.subjudul1,
      required this.materi1,
      required this.subjudul2,
      required this.materi2,
      required this.subjudul3,
      required this.materi3,
      required this.subjudul4,
      required this.materi4,
      required this.isSaved,
    }
  );

  factory GumiStudy.fromJson(Map map) {
    return GumiStudy(
      id: map['id'],
      judul: map['judul'],
      img: map['img'], 
      prolog: map['prolog'], 
      subjudul1: map['subjudul1'],
      materi1: map['materi1'],
      subjudul2: map['subjudul2'], 
      materi2: map['materi2'],
      subjudul3: map['subjudul3'],
      materi3: map['materi3'],
      subjudul4: map['subjudul4'],
      materi4: map['materi4'],
      isSaved: map['isSave']
      );
  }
}