import 'customermodels.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getCustomers();
  Future<Customer> getCustomerById(String id);
  Future<Customer> createCustomer(Customer customer);
  Future<Customer> updateCustomer(String id, Customer customer);
  Future<void> deleteCustomer(String id);
}
