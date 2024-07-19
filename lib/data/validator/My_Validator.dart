class MyValidator{
 static String? checkValidator(String? value){
    if(value!.isEmpty){
      return 'Last name cannot be empty';
    }
    else if(value.length<2){
      return 'Last name should be at least more than 2 characters';
    }
    else if(value.length >=10){
      return 'Last name should less than 10 characters';
    }
    return null;
  }
  }
}