import 'package:field_flutter/actions/menu_action.dart';
import 'package:field_flutter/colors.dart';
import 'package:field_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskItem extends HookWidget {
  final String taskName;
  final String parentName;

  const TaskItem({Key? key, this.taskName = '', this.parentName = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dispatch = useDispatch<AppState>();
    return SizedBox(
        height: 60,
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(width: 1.0, color: AppColors.borderLight))),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskName,
                        style: const TextStyle(
                            color: AppColors.title,
                            fontWeight: FontWeight.w600),
                      ),
                      Visibility(
                          visible: parentName.isNotEmpty,
                          child: Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.codeBranch,
                                  color: AppColors.primary, size: 10),
                              const SizedBox(width: 4),
                              Text(
                                parentName,
                                style: const TextStyle(
                                    color: AppColors.label,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ],
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 46,
                          height: 46,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.lightGrey,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(12), // <-- Radius
                                )),
                            child: SvgPicture.asset('assets/svg/thumbs_up.svg',
                                width: 18, height: 18),
                            onPressed: () =>
                                dispatch(SwitchMyTaskTab(myTaskTab: 1)),
                          )),
                      const SizedBox(width: 8),
                      SizedBox(
                          width: 46,
                          height: 46,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: AppColors.lightGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12), // <-- Radius
                                  )),
                              child: SvgPicture.asset(
                                  'assets/svg/thumbs_down.svg',
                                  width: 18,
                                  height: 18),
                              onPressed: () =>
                                  dispatch(SwitchMyTaskTab(myTaskTab: 1))))
                    ],
                  )
                ],
              )),
        ));
  }
}
