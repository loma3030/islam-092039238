import 'package:tks/core/class/StatusRequest.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Loading...'),
                ],
                isRepeatingAnimation: true,
              ),
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 111, 5, 153),
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('No internet connection....'),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText('We are currently out of business'),
                        ],
                        isRepeatingAnimation: true,
                      ),
                    ),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 179, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText('No data....'),
                            ],
                            isRepeatingAnimation: true,
                          ),
                        ),
                      )
                    : widget;
  }
}
