import '../repositories/mybooking_repository.dart';

class MyBookingUseCase{
  MyBookingRepository myBookingRepository;

  MyBookingUseCase({required this.myBookingRepository});

  Future<List> call() async{
    return await myBookingRepository.myBookingData();
  }
}