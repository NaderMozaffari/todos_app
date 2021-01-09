import 'package:dio/dio.dart';
import 'package:todos_2/models/task.dart';

class Api {
  Response response;
  String url = 'https://5fd0e758b485ea0016eeda16.mockapi.io/api/v1/todos';
  Dio dio = Dio();


  //GET
  getFromServer() async {
    try {
      response = await dio.get(url);
      print("getFromServer: >>>>>>>> \n${response.data}");
      return response.data;
    } catch (e) {
      print(e);
    }
  }
  //FromJson to List
  Future<List<Task>> getTask() async {
    var data = await getFromServer();
    print("getTask: >>>>>>>> \n$data");
    return List<Task>.from(data.map((p) => Task.fromJson(p)));
  }



  //DELETE
  deleteFromServer(String id) async {
    try {
      response = await dio.delete("$url/$id");
      return response.data;
    } catch (e) {
      print('Error ========>>>>> $e');
    }
  }


  //POST
  Future<Task> addToServer(Task task)async{
    try{
      response=await dio.post(url,data: task.toJson());
      return Task.fromJson(response.data);

    }catch(e){
      print('Post +++++++>>>> $e');
    }
  }


  //PUT
  putServer(Task task,String id )async{
    try{
      if(task.completed==true){

      response=await dio.put('$url/$id',data: {'completed':false,'title':task.title});
      }else{
      response=await dio.put('$url/$id',data: {'completed':true,'title':task.title});

      }
      // return Task.fromJson(response.data);
    }catch(e){
      print('Put *******>>>> $e');
    }

  }
}
