import 'package:flutter/material.dart';
import 'package:library_book/bloc/create_shelf_page_bloc.dart';
import 'package:library_book/bloc/shelf_books_page_bloc.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao_impl.dart';
import 'package:library_book/utils/bloc_extensions.dart';
import 'package:library_book/widgets/easy_image_widget.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:provider/provider.dart';

import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../data/vos/home_page_vo/shelf_vo/shelf_vo.dart';

class ShelfBooksPage extends StatefulWidget {
  const ShelfBooksPage({Key? key, required this.shelfName}) : super(key: key);

  final String shelfName;

  @override
  State<ShelfBooksPage> createState() => _ShelfBooksPageState();
}

class _ShelfBooksPageState extends State<ShelfBooksPage> {
  final ShelfDao _shelfDAO = ShelfDaoImpl();
  ShelfVO? shelfVO;
  List<BooksVO>? bookLists;

  @override
  void initState() {
    shelfVO = _shelfDAO.getShelfName(widget.shelfName);
    bookLists = shelfVO?.bookList;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.navigateBack(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: kBlackColor,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: kBlackColor,
          ),
          SizedBox(
            width: kSP10x,
          ),
          Icon(
            Icons.more_vert,
            color: kBlackColor,
          ),
          SizedBox(
            width: kSP10x,
          )
        ],
        title: const EasyTextWidget(
          text: 'Shelf Books',
          fontSize: 18,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSP10x),
        child: bookLists!.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: kSP20x,
                  ),
                  EasyTextWidget(
                    text: shelfVO?.shelfName ?? '',
                    fontSize: 18,
                  ),
                  EasyTextWidget(
                    text: '${bookLists?.length ?? 0} books',
                    fontSize: 18,
                  ),
                  const SizedBox(
                    height: kSP20x,
                  ),
                  Expanded(
                      child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                    ),
                    itemCount: bookLists?.length ?? 0,
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kSP15x),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(kSP15x),
                                child: EasyImageWidget(
                                    imageUrl: bookLists?[index].bookImage ?? '',
                                    height: 205))),
                        const SizedBox(
                          height: kSP10x,
                        ),
                        EasyTextWidget(
                          text: bookLists?[index].title ?? '',
                        )
                      ],
                    ),
                  )),
                ],
              )
            : const Center(
                child: EasyTextWidget(
                  text: 'Currently There is no book',
                  fontSize: 18,
                ),
              ),
      ),
    );
  }
}

// class ShelfBookPage extends StatelessWidget {
//   const ShelfBookPage({
//     super.key,
//     required this.shelfName,
//     this.shelfVO, required this.booksVO,
//   });
//
//   final String shelfName;
//   final ShelfVO? shelfVO;
//   final BooksVO booksVO;
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (_) => ShelfBooksPageBloc(booksVO),
//         child: Consumer<ShelfBooksPageBloc>(
//           builder: (_, bloc, __) => Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               leading: IconButton(
//                 onPressed: () {
//                   context.navigateBack(context);
//                 },
//                 icon: const Icon(
//                   Icons.chevron_left,
//                   color: kBlackColor,
//                 ),
//               ),
//               actions: const [
//                 Icon(
//                   Icons.search,
//                   color: kBlackColor,
//                 ),
//                 SizedBox(
//                   width: kSP10x,
//                 ),
//                 Icon(
//                   Icons.more_vert,
//                   color: kBlackColor,
//                 ),
//                 SizedBox(
//                   width: kSP10x,
//                 )
//               ],
//               title: const EasyTextWidget(
//                 text: 'Shelf Books',
//                 fontSize: 18,
//               ),
//               centerTitle: false,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kSP10x),
//               child: bloc.getBookList!.isNotEmpty
//                   ? Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: kSP20x,
//                         ),
//                         EasyTextWidget(
//                           text: shelfVO?.shelfName ?? '',
//                           fontSize: 18,
//                         ),
//                         EasyTextWidget(
//                           text: '${bloc.getBookList?.length ?? 0} books',
//                           fontSize: 18,
//                         ),
//                         const SizedBox(
//                           height: kSP20x,
//                         ),
//                         Expanded(
//                             child: GridView.builder(
//                           gridDelegate:
//                               const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisExtent: 300,
//                           ),
//                           itemCount: bloc.getBookList?.length ?? 0,
//                           itemBuilder: (context, index) => Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(kSP15x),
//                                   ),
//                                   child: ClipRRect(
//                                       borderRadius:
//                                           BorderRadius.circular(kSP15x),
//                                       child: EasyImageWidget(
//                                           imageUrl: bloc.getBookList?[index]
//                                                   .bookImage ??
//                                               '',
//                                           height: 205))),
//                               const SizedBox(
//                                 height: kSP10x,
//                               ),
//                               EasyTextWidget(
//                                 text: bloc.getBookList?[index].title ?? '',
//                               )
//                             ],
//                           ),
//                         )),
//                       ],
//                     )
//                   : const EasyTextWidget(
//                       text: 'Currently There is no book',
//                       fontSize: 18,
//                     ),
//             ),
//           ),
//         ));
//   }
// }
