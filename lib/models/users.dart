class Users {
   String uid;
   String nome;
   String endereco;
   String companhia;
   String token;
   String telefone;

  Users({
    this.endereco,
    this.companhia,
    this.nome,
    this.uid,
    this.token,
    this.telefone
  });

   Map toMap(Users user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['nome'] = user.nome;
    data['endereco'] = user.endereco;
    data['companhia'] = user.companhia;
    data['token'] = user.token;
    data['telefone'] = user.telefone;
    return data;
  }

  Users.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.nome = mapData['nome'];
    this.endereco = mapData['endereco'];
    this.companhia = mapData['companhia'];
    this.token = mapData['token'];
    this.telefone = mapData['telefone'];
  }
}