import 'package:flutter/material.dart';
import 'package:library_book/bloc/create_shelf.dart';
import 'package:library_book/bloc/shelf_books_page_bloc.dart';
import 'package:library_book/constant/colors.dart';
import 'package:library_book/constant/dimens.dart';
import 'package:library_book/pages/shelf_books_page.dart';
import 'package:library_book/utils/extensions.dart';
import 'package:library_book/view_items/library_page_view_items/create_shelf_view_items/cancel_and_ok_button_view.dart';
import 'package:library_book/view_items/library_page_view_items/create_shelf_view_items/show_dialog_view.dart';
import 'package:library_book/widgets/easy_image_widget.dart';
import 'package:library_book/widgets/easy_text_widget.dart';
import 'package:provider/provider.dart';

import '../constant/api_constant.dart';
import '../constant/strings.dart';
import '../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import '../widgets/easy_button_widget.dart';
import 'create_shelf_page.dart';

class ShelfPage extends StatelessWidget {
  const ShelfPage(
      {Key? key,
      this.isChecked = false,
      required this.text,
      required this.bookVO})
      : super(key: key);

  final BooksVO bookVO;
  final String text;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelfPageBloc>(
      create: (_) => ShelfPageBloc(isChecked ? bookVO : BooksVO(order: 0)),
      child: Consumer<ShelfPageBloc>(
        builder: (context, bloc, child) => Scaffold(
          appBar: isChecked
              ? null
              : AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      context.navigateBack(context);
                    },
                    icon: const Icon(Icons.chevron_left),
                    color: kPrimaryTextColor,
                  ),
                  title: const EasyTextWidget(
                    text: 'Add to shelf',
                  ),
                ),
          body: Selector<ShelfPageBloc, List<ShelfVO>?>(
            selector: (_, selector) => selector.getShelfList,
            builder: (context, value, child) {
              if (value == null) {
                return const EmptyShelfView();
              }
              if (value.isEmpty) {
                return const EmptyShelfView();
              }
              return ListView.separated(
                  itemBuilder: (context, index) => ShelfView(
                      shelfVO: value[index],
                      bookVO: bookVO,
                      isChecked: isChecked),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: kSP10x,
                      ),
                  itemCount: value.length);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton:  FloatingActonView(
            text: text,
          ),
        ),
      ),
    );
  }
}

class ShelfView extends StatelessWidget {
  const ShelfView({
    Key? key,
    required this.shelfVO,
    required this.bookVO,
    required this.isChecked,
  }) : super(key: key);
  final ShelfVO shelfVO;
  final BooksVO bookVO;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: isChecked
          ? () {}
          : () {
              context.getShelfPageBloc().addBooksToShelf(shelfVO, bookVO);
              context.navigateBack(context);
            },
      leading: (shelfVO.bookList.isEmpty)
          ? const EasyImageWidget(
              imageUrl:
                  'https://mocra.org/wp-content/uploads/2016/07/default.jpg',
              height: kSP50x,
              width: kSP50x,
            )
          : EasyImageWidget(
              imageUrl: shelfVO.bookList.first.bookImage ?? '',
              height: kSP50x,
              width: kSP50x,
            ),
      title: EasyTextWidget(
        text: shelfVO.shelfName ?? '',
      ),
      subtitle: EasyTextWidget(text: '${shelfVO.bookList.length} books'),
      trailing: IconButton(
        onPressed: () {
          context.navigateToNextScreen(
              context,
              BookShelfPage(
                shelfName: shelfVO.shelfName ?? '',
              ));
        },
        icon: const Icon(Icons.chevron_right),
      ),
    ));
  }
}

class FloatingActonView extends StatelessWidget {
  const FloatingActonView({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  height: 260,
                  width: 360,
                  decoration: const BoxDecoration(
                      color: kSecondaryTextColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  child: ChangeNotifierProvider<CreateShelfPageBloc>(
                      create: (_) => CreateShelfPageBloc(),
                      child: const CreateShelfView()),
                ),
              ),
            ),
          );
        },
        label: Row(
          children: [
            const Icon(Icons.edit),
            EasyTextWidget(
              text: text,
              color: kSecondaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ],
        ));
  }
}

class CreateShelfView extends StatelessWidget {
  const CreateShelfView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CreateShelfViewItem(
      globalKey: context.getCreateShelfPageBloc().getGlobalKey,
    );
  }
}

class CreateShelfViewItem extends StatelessWidget {
  const CreateShelfViewItem({
    Key? key,
    required this.globalKey,
  }) : super(key: key);
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: kSP30x,
          ),
          const EasyTextWidget(
            text: 'Enter shelf name',
            color: kGreyColor,
            fontSize: 18,
          ),
          const SizedBox(
            height: kSP10x,
          ),
          CreateShelfTextFieldView(
            validator: (value) {
              if (value?.isEmpty ?? false) {
                return 'Shelf name is Empty';
              }
              return null;
            },
            controller:
                context.getCreateShelfPageBloc().getTextEditingController,
          ),
          const SizedBox(
            height: kSP30x,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EasyButton(
                color: kTealColor,
                text: kCancelText,
                height: kSP40x,
                textColor: kSecondaryTextColor,
                onPressed: () {
                  context.navigateBack(context);
                },
              ),
              EasyButton(
                color: kTealColor,
                text: 'Ok',
                height: kSP40x,
                textColor: kPrimaryTextColor,
                onPressed: () {
                  if (context
                          .getCreateShelfPageBloc()
                          .getGlobalKey
                          .currentState
                          ?.validate() ??
                      false) {
                    context.getCreateShelfPageBloc().createShelfText();
                    context.navigateBack(context);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CreateShelfTextFieldView extends StatelessWidget {
  const CreateShelfTextFieldView({
    Key? key,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  final Function(String?) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validator(value ?? ''),
      decoration: const InputDecoration(fillColor: kGreyColor),
      controller: controller,
    );
  }
}
