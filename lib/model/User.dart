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