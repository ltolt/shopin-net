package net.shopin.persistence.repository;


import java.util.List;
import java.util.UUID;

import net.shopin.persistence.domain.OrderStatus;

public interface OrderStatusRepository {

  OrderStatus save(OrderStatus orderStatus);

  void delete(UUID key);

  OrderStatus findLatestById(UUID key);

  List<OrderStatus> findAll();
}
