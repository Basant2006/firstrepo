class SignUp_Model
{
  bool status;
  SignUp_Model({required this.status});
  factory SignUp_Model.fromjson(Map<String , dynamic> json)
  {
    return SignUp_Model(status: json['status']);
  }
}