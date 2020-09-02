class Users {
  String uid;
  String photo;
  String email;
  String nome;

  Users({this.uid, this.email, this.nome, this.photo});

  Map toMap(Users user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['nome'] = user.nome;
    data['photo'] = user.photo;
    return data;
  }

  Users.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.nome = mapData['nome'];
    this.email = mapData['email'];
    this.photo = mapData['telefone'];
  }
}
