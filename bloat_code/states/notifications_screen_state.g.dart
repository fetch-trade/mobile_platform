// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_screen_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationsScreenState on _NotificationsScreenState, Store {
  final _$messagesAtom = Atom(name: '_NotificationsScreenState.messages');

  @override
  Map<String, dynamic> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(Map<String, dynamic> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$_NotificationsScreenStateActionController = ActionController(name: '_NotificationsScreenState');

  @override
  void refreshChatRoomsForCurrentUser() {
    final $actionInfo = _$_NotificationsScreenStateActionController.startAction(
        name: '_NotificationsScreenState.refreshChatsForCurrentUser');
    try {
      return super.refreshChatRoomsForCurrentUser();
    } finally {
      _$_NotificationsScreenStateActionController.endAction($actionInfo);
    }
  }

  @override
  String toString() {
    return '''
    messages: ${messages}
    ''';
  }
}