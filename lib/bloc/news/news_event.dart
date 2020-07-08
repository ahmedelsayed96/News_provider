







import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{

  @override
  List<Object> get props =>[];
}

 class InitializeNews extends NewsEvent{}
 class LoadNews extends NewsEvent{}
 class RefreshNews extends NewsEvent{}

