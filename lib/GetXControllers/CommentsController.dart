import 'package:get/get.dart';
import 'package:tailorcraft/Classes/Comments.dart';

class CommentController extends GetxController {
  var comments = <Comment>[
    Comment(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s',
      customerName: 'John Doe',
      rating: 5,
      commentDate: '2022-05-15',
      comment: 'Great product!',
    ),
    Comment(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s',
      customerName: 'John Doe',
      rating: 3,
      commentDate: '2022-05-15',
      comment: 'Great product!',
    ),
    Comment(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s',
      customerName: 'John Doe',
      rating: 4,
      commentDate: '2022-05-15',
      comment: 'Great product!',
    ),
    Comment(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s',
      customerName: 'John Doe',
      rating: 2,
      commentDate: '2022-05-15',
      comment: 'Great product!',
    ),
    Comment(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s',
      customerName: 'John Doe',
      rating: 5,
      commentDate: '2022-05-15',
      comment: 'Great product!',
    ),
    Comment(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s',
      customerName: 'John Doe',
      rating: 1,
      commentDate: '2022-05-15',
      comment: 'Great product!',
    ),
    Comment(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyXXkiqJLhMZE69a4dTnH4Qd6GyzyFmqcmHu8EAhx8DQ&s',
      customerName: 'John Doe',
      rating: 3,
      commentDate: '2022-05-15',
      comment: 'Great product!',
    ),
    // Add more comments here as needed
  ].obs;
}
