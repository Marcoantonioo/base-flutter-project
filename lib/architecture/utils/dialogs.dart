import 'package:cebras_app/architecture/utils/app_theme.dart';
import 'package:cebras_app/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showScoreDialod(Function() onTap) {
  Get.dialog(
    AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 2,
                  height: 60,
                  color: Colors.black,
                ),
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Seu Score foi:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '9 pontos',
                      style: TextStyle(
                          color: AppThemeData.lightColorScheme.secondary,
                          fontSize: 23,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: const [
                Icon(
                  Icons.face,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    'Seu estado de saúde: Bom',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Seu estado de saúde é bom. Mas pode melhorar com os hábitos e tratamentos adequados.',
              style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 34),
            ButtonWidget(
                title: 'CONTINUAR',
                onTap: () {
                  Get.back();
                  onTap.call();
                })
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}

void showTermsOfUseDialog(
  BuildContext context,
  RxBool isTermsAcepts,
  Function() onTap,
) {
  Get.dialog(
    AlertDialog(
      alignment: Alignment.center,
      title: Text(
        'Termos de uso',
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: const Color(0xff666666)),
      ),
      content: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Text(
          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: const Color(0xff666666)),
        ),
      ),
      actions: [
        Obx(
          () => Row(
            children: [
              Checkbox(
                activeColor: AppThemeData.lightColorScheme.primary,
                visualDensity: VisualDensity.compact,
                value: isTermsAcepts.value,
                onChanged: (newValue) {
                  isTermsAcepts.value = newValue ?? false;
                },
              ),
              Flexible(
                child: Text(
                  'Aceitar termo de uso e autorização dos dados ',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4
                      ?.copyWith(color: Colors.black, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Obx(
          () => Padding(
            padding: const EdgeInsets.all(6.0),
            child: ButtonWidget(
              isDisable: isTermsAcepts.isFalse,
              title: 'CONTINUAR',
              onTap: () => onTap.call(),
            ),
          ),
        ),
      ],
    ),
  );

  // defaultDialog(
  //   title: "Welcome to Flutter Dev'S",
  //   middleText:
  //       "FlutterDevs is a protruding flutter app development company with "
  //       "an extensive in-house team of 30+ seasoned professionals who know "
  //       "exactly what you need to strengthen your business across various dimensions",
  //   backgroundColor: Colors.white,
  //   titleStyle: Theme.of(context)
  //       .textTheme
  //       .headline4
  //       ?.copyWith(color: const Color(0xff666666)),
  //   middleTextStyle: Theme.of(context)
  //       .textTheme
  //       .headline5
  //       ?.copyWith(color: const Color(0xff666666)),
  //   radius: 30,
  // );
}
