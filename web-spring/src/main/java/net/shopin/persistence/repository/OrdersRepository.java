package net.shopin.persistence.repository;


import java.util.UUID;

import net.shopin.persistence.domain.Order;

public interface OrdersRepository {

  Order save(Order order);

  void delete(UUID key);

  Order findById(UUID key);

  Iterable<Order> findAll();
}
