class ModelPembimbing {
  int? id_pembimbing;
  String? nama;
  String? username;
  String? pass;
  String? jk;
  int? id_ruang;
  String? th_ajaran;

    ModelPembimbing({
    this.id_pembimbing,
    this.nama,
    this.username,
    this.pass,
    this.jk,
    this.id_ruang,
    this.th_ajaran
    });

    factory ModelPembimbing.fromJson(Map<String, dynamic> json) {
      return ModelPembimbing(
        id_pembimbing: int.parse(json['id_pembimbing']),
        nama: json['nama'],
        username: json['username'],
        pass: json['pass'],
        jk: json['jk'],
        id_ruang: int.parse(json['id_ruang']),
        th_ajaran: json['th_ajaran']
      );
    }
}