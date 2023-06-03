import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}
class ProfileInitial extends ProfileState {}
class ProfileNavigated extends ProfileState {}