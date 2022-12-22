// ignore_for_file: prefer_initializing_formals

void main(){
  
  Student student = Student('aswin',23,10);
  
  student.printStudentDetails();
}

class Student {
  String? name;
  int? age;
 int? classs;
  
  Student(String name,int age, int classs){
    this.name=name;
    this.age=age;
    this.classs=classs;
  }
  
  
  printStudentDetails(){
    print('Name : $name');
    print('Age : $age');
    print('Class : $classs');
  }
  
  
}