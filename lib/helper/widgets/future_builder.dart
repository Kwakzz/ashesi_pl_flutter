import 'package:flutter/material.dart';
import 'form.dart';
import 'text.dart';


/// Creates a widget that builds itself based on the latest snapshot of interaction with a [Future].
class AppFutureBuilder extends StatelessWidget {

  /// Creates a widget that builds itself based on the latest snapshot of interaction with a [Future].
  const AppFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
    required this.reloadPageFunction,
    required this.errorText,
    this.errorTextColor = Colors.black,
    this.circularProgressIndicatorColor = const Color.fromARGB(255, 197, 50, 50),
  });

  final Future future;
  final Function builder;
  final Function reloadPageFunction;
  final String errorText;
  final Color errorTextColor;
  final Color circularProgressIndicatorColor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return Center(
                child: RegularText(
                  text: "No $errorText found.",
                  color: Colors.black,
                ),
              );
            }
            return builder(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RegularText(
                    text: "Could not load $errorText. Please try again later.",
                    color: errorTextColor,
                  ),
                  const SizedBox(height: 10),
                  SubmitFormButton(
                    onPressed: () {
                      // Retry the operation
                      reloadPageFunction();
                    },
                    text: "Retry",
                  ),
                ],
              ),
            );
          }
        }

        return Center(
          child: CircularProgressIndicator(
            color: circularProgressIndicatorColor,
          ),
        );
      },
    );
  }
}
