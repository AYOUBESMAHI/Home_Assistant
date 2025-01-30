import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartSpeaker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../Providers/RoomsProvider.dart';
import '../../../../Utils/Constants.dart';

class SpeackerBottomSheetWidget extends StatefulWidget {
  const SpeackerBottomSheetWidget({super.key});

  @override
  State<SpeackerBottomSheetWidget> createState() =>
      _SpeackerBottomSheetWidgetState();
}

class _SpeackerBottomSheetWidgetState extends State<SpeackerBottomSheetWidget>
    with SingleTickerProviderStateMixin {
  late SmartSpeaker speaker;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    speaker = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartSpeaker;

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    _animation = Tween<Offset>(
      begin: const Offset(-1, 0.0),
      end: const Offset(1.4, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.repeat();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false).setSmartDevice(speaker);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      speaker.isOn = !speaker.isOn;
                      speaker.isPlaying = false;
                    });
                  },
                  child: Image.asset(
                    "Assets/Images/power-on.png",
                    scale: 8,
                    color: speaker.isOn ? Colors.green : Colors.red,
                  ),
                ),
                if (speaker.isOn)
                  Expanded(
                    child: Slider(
                      value: speaker.volume,
                      onChanged: (val) {
                        setState(() => speaker..volume = val);
                      },
                      label: speaker.volume.round().toString(),
                      max: 100,
                      divisions: 10,
                    ),
                  )
              ],
            ),
            if (speaker.isOn)
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 30,
                child: Stack(children: [
                  Lottie.network(
                    'https://lottie.host/54aba019-9640-4067-8432-29d569c315ce/nssOOsANHw.json',
                    height: 250,
                    width: MediaQuery.of(context).size.width - 30,
                  ),
                  Positioned(
                    bottom: 22,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 30,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return FractionalTranslation(
                            translation: speaker.isPlaying
                                ? _animation.value
                                : const Offset(0, 0),
                            child: child,
                          );
                        },
                        child: Text(speaker.playlist[speaker.indexCurrentSong],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Constants.accentColor)),
                      ),
                    ),
                  ),
                ]),
              ),
            if (speaker.isOn)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (speaker.indexCurrentSong == 0) {
                            speaker.indexCurrentSong =
                                speaker.playlist.length - 1;
                          } else {
                            speaker.indexCurrentSong--;
                          }
                        });
                      },
                      child: Image.asset(
                        "Assets/Icons/back.png",
                        scale: 10,
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          speaker.isPlaying = !speaker.isPlaying;
                          if (!speaker.isPlaying) {
                            _controller.stop();
                          } else {
                            _animation = Tween<Offset>(
                              begin: const Offset(-1, 0.0),
                              end: const Offset(1.4, 0.0),
                            ).animate(
                              CurvedAnimation(
                                  parent: _controller, curve: Curves.linear),
                            );

                            _controller.repeat();
                          }
                        });
                      },
                      child: Image.asset(
                        !speaker.isPlaying
                            ? "Assets/Icons/pause.png"
                            : "Assets/Icons/play-button.png",
                        scale: 10,
                      )),
                  const SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        setState(() {
                          if (speaker.indexCurrentSong ==
                              speaker.playlist.length - 1) {
                            speaker.indexCurrentSong = 0;
                          } else {
                            speaker.indexCurrentSong++;
                          }
                        });
                      },
                      child: Image.asset(
                        "Assets/Icons/next.png",
                        scale: 10,
                      )),
                ],
              )
          ],
        ),
      ),
    );
  }
}
