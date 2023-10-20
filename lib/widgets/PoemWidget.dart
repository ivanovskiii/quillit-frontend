import 'package:flutter/cupertino.dart';
import 'package:quillit_frontend/model/poem.dart';

class PoemWidget extends StatelessWidget {
  final Poem poem;

  PoemWidget(this.poem);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 207, 179, 229),
      child: Column(
        children: [
          Text(poem.title),
          Text(poem.content),
          Text(poem.authorId),
          // Add any other information you want to display
        ],
      ),
    );
  }
}


// class PoemWidget extends StatefulWidget {
//   final List<Poem> poems;

//   PoemWidget(this.poems);

//   @override
//   _PoemWidgetState createState() => _PoemWidgetState();
// }

// class _PoemWidgetState extends State<PoemWidget> {
//   @override
//   Widget build(BuildContext context){
//     return ListView.builder(
//       itemCount: widget.poems.length,
//       itemBuilder: (context, index) {
//         final poem = widget.poems[index];
//         return Container(
//           color: Color.fromARGB(255, 207, 179, 229),
//           child: Row(
//             children: [
//               Expanded(flex: 1, child: Text(poem.title)),
//               SizedBox(width: 10),
//               Expanded(flex: 1, child: Text(poem.content)),
//               SizedBox(width: 10),
//               Expanded(flex: 1, child: Text(poem.authorId)),
//             ],
//           )
//         );
//       },
//     );
//   }
// }
