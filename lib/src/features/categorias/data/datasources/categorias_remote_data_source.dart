// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cep/src/core/error/exceptions.dart';
// import 'package:http/http.dart' as http;

// import 'package:cep/src/features/categorias/data/models/categoria_model.dart';
// import 'package:cep/src/features/categorias/data/models/sub_categoria_model.dart';

// abstract class ICategoriaRemoteDataSource {
//   Future<List<CategoriaModel>> getAllCategorias();
//   Future<List<SubCategoriaModel>> getAllSubCategorias();
//   // Future<CategoriaModel> getCategoria({required String id});
//   // Future<List<SubCategoriaModel>> getSubCategorias({required id});
// }

// class CategoriaRemoteDataSourceImpl implements ICategoriaRemoteDataSource {
//   final http.Client client;

//   CategoriaRemoteDataSourceImpl({
//     required this.client,
//   });

//   @override
//   Future<List<CategoriaModel>> getAllCategorias() async {
//     var url = 'http://localhost:8100/api/categories';
//     final response = await client.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final List<CategoriaModel> list = [];
//       list.addAll((response.body as List).map((categoria) => CategoriaModel.fromJson(categoria)).toList());

//       return Future.value(list);
//     } else {
//       throw ServerException();
//     }
//   }

//   @override
//   Future<List<SubCategoriaModel>> getAllSubCategorias() {}

//   // @override
//   // Future<CategoriaModel> getCategoria({required String id}) {
//   //   // TODO: implement getCategoria
//   //   throw UnimplementedError();
//   // }

//   // @override
//   // Future<List<SubCategoriaModel>> getSubCategorias({required id}) {
//   //   // TODO: implement getSubCategorias
//   //   throw UnimplementedError();
//   // }
// }
