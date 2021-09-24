import 'dart:async';

class ControllBloc {
  //Temos uma total propriedade do tipo int (privada);
  int _total = 0;
  
  //Criamos um método get para acessá-la;
  int get total => _total;
  
  //Declaro a StreamController;
  final _blocController = StreamController<int>();
  
  //Cria um método get para acessar a stream da StreamController;
  Stream<int> get minhaStream => _blocController.stream;
  
//Cria o méotodo incrementar() para incrementar o valor de total e com o método add()
// da propriedade sink, adiciona o valor já incrementado na StreamController;
  void incrementar() {
    _total++;
    _blocController.sink.add(total);
  }

//Cria-se o méotodo fecharStream() para fechar o _blocController
  void fecharStream(){
    _blocController.close();
  }

  
  
}