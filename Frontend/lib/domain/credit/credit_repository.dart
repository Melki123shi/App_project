import 'creditmodels.dart';

abstract class CreditRepository {
  Future<List<Credit>> getCredits();
  Future<Credit> getCreditById(String id);
  Future<Credit> createCredit(Credit credit);
  Future<Credit> updateCredit(String id, Credit credit);
  Future<void> deleteCredit(String id);
}
