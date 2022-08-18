
import 'package:validators/validators.dart';

Function userid_validate(){
   return (String? value){
    print("userid_validate :"+value!); // 이런식으로 로그 찍어볼 수 있음.
    if(value.isEmpty){
      return "아이디를 입력해주세요.";
    }else if(value.length >= 12){
      return "아이디를 12자를 넘을 수 없습니다.";
    }else if(value.length < 4){
      return "아이디는 4글자를 넘어야 합니다.";
    }else if(!isAlphanumeric(value)){
      return "아이디는 한글이나 특수문자가 들어갈 수 없습니다.";
    }else{
      return null;
    }
  };
}

Function usernick_validate(){
  return (String? value){
    print("usernick_validate :"+value!);
    if(value.isEmpty){
      return "닉네임을 입력해주세요.";
    }else if(value.length >= 12){
      return "닉네임은 12자를 넘을 수 없습니다.";
    }else if(value.length < 4){
      return "닉네임은 4글자를 넘어야합니다.";
    }else{
      return null;
    }
  };
}
