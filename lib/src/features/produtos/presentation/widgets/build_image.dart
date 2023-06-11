import 'package:cep/src/core/presentation/widgets/sollaris_error_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildImage extends StatefulWidget {
  const BuildImage({super.key});

  @override
  State<BuildImage> createState() => _BuildImageState();
}

class _BuildImageState extends State<BuildImage> {
  final TextEditingController _imageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? urlImage;
  bool isEnable = true;

  bool isUrlValid(String url) {
    Uri? uri = Uri.tryParse(url);
    return uri!.hasScheme && uri.hasAuthority;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.all(16),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              onSaved: (valueSave) {
                setState(() {
                  urlImage = valueSave;
                  isEnable = true;
                });
              },
              controller: _imageController,
              validator: (value) {
                if (!isUrlValid(value!)) {
                  setState(() {
                    urlImage = null;
                    isEnable = false;
                  });
                  return 'Url de imagem inválida';
                }
                return null;
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 16,
                      color: Color.fromARGB(255, 189, 66, 201),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 189, 66, 201),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 189, 66, 201),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 189, 66, 201)),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(urlImage != null
                      ? urlImage!
                      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJzRGkvN9WVysP2_3AbXtdgTegy9mEELt2yFirxQymBg&s'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isEnable
                    ?  Color.fromARGB(255, 189, 66, 201)
                    : const Color.fromARGB(69, 244, 67, 54),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                isEnable ? Navigator.of(context).pop(urlImage) : null;
              },
              child: const Text(
                'Escolher',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
