import 'dart:io';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hcslzapp/common/labels.and.hints.dart';
import 'package:hcslzapp/common/messages.dart';
import 'package:hcslzapp/common/photo.image.provider.dart';
import 'package:hcslzapp/components/button.dart';
import 'package:hcslzapp/components/my.text.form.field.dart';
import 'package:hcslzapp/models/product.dart';
import '../../components/my.appbar.dart';
import '../../components/my.bottom.appbar.dart';
import '../../controllers/product.add.controller.dart';

const String _pathNoImage = 'assets/imgs/noImage.png';
const String _title = 'Produto';

class ProductAddPage extends StatefulWidget {
  final Product? _product;

  ProductAddPage(
    this._product,
  );

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final ProductAddController _controller = ProductAddController();

  @override
  void initState() {
    // _controller.event = widget._product ?? _controller.event;
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: MyAppBar(_title),
      bottomNavigationBar: MyBottomAppBar(),
      body: _widgets(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Button(
        icon: Icons.save,
        onClick: () => widget._product == null ? _save() : _update(),
      ));

  _widgets() => ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          _photo(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.add_photo_alternate,
                  size: 28.0,
                ),
                onPressed: _controller.getImageFromGallery,
              ),
              IconButton(
                icon: Icon(
                  Icons.add_a_photo,
                  size: 25.0,
                ),
                onPressed: _controller.getImageFromCamera,
              ),
            ],
          ),
          Observer(
            builder: (_) {
              return MyTextFormField(
                textEditingController: _controller.nameCtrl,
                label: labelNameProduct,
                hint: hintNameProduct,
                icon: Icons.title,
                inputType: TextInputType.text,
                onChanged: _controller.formController.changeName,
                errorText: _controller.validateName(),
              );
            },
          ),
          Observer(builder: (_) {
            return MyTextFormField(
              textEditingController: _controller.descriptionCtrl,
              label: labelDescriptionProduct,
              hint: hintDescriptionProduct,
              icon: Icons.description,
              inputType: TextInputType.text,
              nLines: 3,
              onChanged: _controller.formController.changeDescription,
              errorText: _controller.validateDescription(),
            );
          }),
          Row(
            children: [
              Expanded(
                child: Observer(
                  builder: (_) {
                    return MyTextFormField(
                      textEditingController: _controller.categoryCtrl,
                      label: labelCategoryProduct,
                      hint: hintCategoryProduct,
                      icon: Icons.category,
                      inputType: TextInputType.text,
                      onChanged: _controller.formController.changeName,
                      errorText: _controller.validateName(),
                    );
                  },
                ),
              ),
              Expanded(
                child: Observer(builder: (_) {
                  return MyTextFormField(
                    textEditingController: _controller.colorCtrl,
                    label: labelColorProduct,
                    hint: hintColorProduct,
                    icon: Icons.color_lens,
                    inputType: TextInputType.text,
                    onChanged: _controller.formController.changeName,
                    errorText: _controller.validateName(),
                  );
                }),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          )
        ],
      );

  _photo(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Observer(
            builder: (_) => Container(
              decoration: BoxDecoration(
                image: _loadPhoto(),
              ),
            ),
          ),
        ),
      );

  DecorationImage _loadPhoto() => DecorationImage(
      image: _controller.changedPhoto
          ? PhotoImageProvider().getImageProvider(
              File(_controller.photoPath),
            ) as ImageProvider
          : _controller.photoUrl != ""
              ? NetworkImage(_controller.photoUrl)
              : PhotoImageProvider().getImageProvider(
                  File(_pathNoImage),
                ) as ImageProvider,
      fit: BoxFit.fill);

  _save() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        AsukaSnackbar.message(WAIT).show();
        final value = await _controller.save();
        AsukaSnackbar.success(SUCCESS).show();
        Navigator.pop(context, value);
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }

  _update() async {
    if (_controller.hasErrors) {
      AsukaSnackbar.alert(REQUIRED).show();
    } else {
      try {
        AsukaSnackbar.message(WAIT).show();
        final value = await _controller.update();
        AsukaSnackbar.success(SUCCESS).show();
        Navigator.pop(context, value);
      } on HttpException catch (e) {
        AsukaSnackbar.alert(e.message.toString()).show();
      } catch (e) {
        AsukaSnackbar.alert(e.toString()).show();
      } finally {}
    }
  }
}
