part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}
final class Loading extends NewsState {}
final class Success extends NewsState {}
final class Error extends NewsState {}

final class GetGeneralNewsLoading extends NewsState {}
final class GetGeneralNewsSuccess extends NewsState {}
final class GetGeneralNewsError extends NewsState {}

final class GetBusinessNewsLoading extends NewsState {}
final class GetBusinessNewsSuccess extends NewsState {}
final class GetBusinessNewsError extends NewsState {}

final class GetTechnologyNewsLoading extends NewsState {}
final class GetTechnologyNewsSuccess extends NewsState {}
final class GetTechnologyNewsError extends NewsState {}


