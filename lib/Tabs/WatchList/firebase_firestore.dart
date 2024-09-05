import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/ResponseMovie.dart';


class FireStoreFireBase {
static final CollectionReference<Movie> CollectionMovies =
FirebaseFirestore.instance.collection('MoviesFavorites').withConverter(
fromFirestore: (snapshot, options) => Movie.fromMap(snapshot.data()!),
toFirestore: (movie, options) => movie.toMap());


/// Fetch all favorite movies from Firestore
Future<List<Movie>> fetchFavorites() async {
try{
QuerySnapshot<Movie> snapshot = await CollectionMovies.get();
print('${ snapshot.docs.map((doc) => doc.data()).toList()}');
return snapshot.docs.map((doc) => doc.data()).toList();
}catch(e){
print('Error Fetching Favorites: $e');
return[];
}
}


/// Add a movie to the favorites collection in Firestore
Future<void> addFavorite(Movie movie) async {
try {
await CollectionMovies.doc(movie.id.toString()).set(movie,SetOptions(merge: true));
}catch (e){
print('Error adding favorite : $e');
}
}


/// Remove a movie from the favorites collection in Firestore
Future<void> removeFromFavorites(String movieId) async {
try{
await CollectionMovies.doc(movieId).delete();
}catch(e){
print('Error removing favorite : $e');
}
}
}