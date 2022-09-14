import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Explaining Clean Architecture

// Clean Architecture Uncle Bob --> 3 Layers

// 1. Presentation Layer --> Contain UI [Thing user see it], State Management That I work it
// 2. Domain Layer --> Is Intermediate Layer Between Presentation Layer And Data Layer Contain Following :-
// 1. Use Cases --> Feature's Services
// 2. Entities  --> model miniature to model [with fromJson and toJson]
// 3. Repositories --> relate between domain layer and data layer

// 3. Data Layer --> Contain following :-
// 1. Remote Data Sources --> Write code that indicate api or server
// 2. Local Data Sources --> Local Data Sources [SQflite]

// Steps How it [Clean Architecture] Work
// User turn app --> see UI --> UI event Bloc --> Bloc event UseCases --> UseCases talk repositories
// repositories check Is there internet ?

// IF YES --> remote data source and request To API, API Will reply with json response AND convert json to dart and Do model then return this model to repositories
// divide model either list or not to entities then entities return to UseCases then return to Bloc Then Bloc to UI

// IF NO --> local data source and will return failure and this failure will come back to repositories
// then repositories will return to Use Cases then Use Cases will return to Bloc Then Bloc To UI

// Steps [How I will Write Code]
// 1. Start With Entities, Repositories (Domain Layer), Use Cases [Domain Layer is done]
// 2. Second with Data Layers Models, Implement to repositories (Data Layer) , Data Sources we have
// 3. Third Presentation Layer Bloc, UI [Design App]
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
