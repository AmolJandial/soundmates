import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:soundmates/enums/dialog_status.dart';

typedef DialogState = ({DialogStatus status, String message, bool showDialog});

final infoDialogViewmodelProvider = AutoDisposeNotifierProvider<InfoDialogViewmodel, DialogState>(
  InfoDialogViewmodel.new,
);

class InfoDialogViewmodel extends AutoDisposeNotifier<DialogState> {
  @override
  DialogState build() {
    return (status: DialogStatus.loading, message: '', showDialog: false);
  }

  void copyWith({DialogStatus? status, String? message, bool? showDialog}) {
    state = (
      status: status ?? state.status,
      message: message ?? state.message,
      showDialog: showDialog ?? state.showDialog,
    );
  }
}
