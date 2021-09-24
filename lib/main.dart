import 'package:app_bloc/controllers/bloc_controller.dart';
import 'package:flutter/material.dart';


void main() => runApp(BlocApp());

class BlocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = ControllBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('voce ja apertou tantas vezes: ',
             style: TextStyle(
               fontSize: 32,
               color: Colors.purple,
             ),
             textAlign: TextAlign.center,),
            
           
          // A StreamBuilder Este widget fica "ouvindo" uma stream e sempre que há um novo evento,
          // ele é reconstruído (o método builder é executado novamente).
            StreamBuilder<int>(
              // Na propriedade stream, indicamos qual stream queremos "ouvir";
                stream: bloc.minhaStream,
                builder: (_, __) {
                return Text('${bloc.total}',
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.green,
                  
                ),);
                }),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: bloc.incrementar,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  //Para que nosso _blocController seja encerrado de maneira correta,
  // precisamos sobrescrever o método dispose (_HomePageState);
  @override
  void dispose() {
    bloc.fecharStream();
    super.dispose();
  }
}
