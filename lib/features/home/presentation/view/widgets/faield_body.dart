import 'package:flutter/material.dart';

import '../../../../searsh/search_view.dart';

class faieldBody extends StatelessWidget {
  const faieldBody({super.key, required this.errorMessage});

  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchView()),
                  );
                },
                child: Container(
                  height: 45,
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xff00007C),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'back',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      //Icon(FontAwesomeIcons.gamepad),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
