class User{
  String? email;
  String? name;
  String? password;

  User({this.email,this.name,this.password});

  User.fromMap(Map<String,dynamic> res){
    email =res['email'];
    name =res['name'];
    password =res['password'];
  }
  Map<String,dynamic> toMap(){
    return {
      'email':this.email,
      'name':this.name,
      'password':this.password
    };
  }
}
class Note{
  int? id;
  String? note;
  String? email;
  Note({this.id,this.note,this.email});
  Note.fromMap(Map<String,dynamic> res){
    id =res['id'];
    note =res['note'];
    email =res['email'];
  }
  Map<String,dynamic> toMap(){
    return {
      'id':this.id,
      'note':this.note,
      'email':this.email};}
}