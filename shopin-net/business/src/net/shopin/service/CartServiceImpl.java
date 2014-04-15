/**
 * @Probject Name: business
 * @Path: net.shopin.service.CartServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-8-1 下午3:48:04
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;

import net.rubyeye.xmemcached.Counter;
import net.rubyeye.xmemcached.MemcachedClient;
import net.rubyeye.xmemcached.exception.MemcachedException;
import net.shopin.api.ICartService;
import net.shopin.util.Constants;
import net.shopin.util.JsonUtil;
import net.shopin.view.Cart;
import net.shopin.view.CartItem;
import net.shopin.view.MemberAddressVO;
import net.shopin.view.OrderVO;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.utils.Codec;

/**
 * @Class Name CartServiceImpl
 * @Author jingpeng
 * @Create In 2013-8-1
 */
@Transactional(readOnly = true)
@Component("cartService")
@Scope("prototype")
public class CartServiceImpl implements ICartService {

	@Resource(name = "cartCacheClient")
	MemcachedClient cartCache;

	/**
	 * 获取普通购物车
	 */
	@Override
	public Cart getCart(String cartId) {
		Cart cart = null;
		try {
			Object obj = this.cartCache.get(Codec.encodeMd5(cartId + CartServiceImpl.class.getName()));
			if (obj == null) {
				cart = new Cart();
				this.cartCache.add(Codec.encodeMd5(cartId  + CartServiceImpl.class.getName()), 864000, cart);
			} else {
				cart = (Cart) obj;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cart;
	}
	
	/**
	 * 获取普通购物车指定pid商品条目
	 */
	@Override
	public CartItem getCartItem(String cartId, String pid) {
		Cart cart = getCart(cartId);
		CartItem cartItem= null;
		if (cart != null && !cart.getItemList().isEmpty()) {
			for (CartItem item : cart.getItemList()) {
				if (item.getSid() !=null 
						&& pid !=null 
						&& !"".equals(item.getSid()) 
						&& !"".equals(pid) 
						&& item.getSid().equals(pid)) {
					cartItem = item;
					break;
				}
			}
		} 
		return cartItem;
	}

	/**
	 * 增加普通购物车商品条目
	 * 如果该商品条目已经存在 则更新其数量和购物车所有商品数量
	 * 不存在则将该商品条目加入购物车并更新购物车所有商品数量
	 */
	@Override
	public void addCartPro(String cartId, CartItem cartItem) {
//		addCartItem(cartId, cartItem);
	}

	@Override
	public void addCartItem(String cartId, CartItem target) {
		Cart cart = getCart(cartId);
		List<CartItem> list = cart.getItemList();
		boolean exist = false;
		for (CartItem item : cart.getItemList()) {
			if (item.getSid().equals(target.getSid())) {
				int oldQty = item.getQty() == null ? 0 : item.getQty()
						.intValue();
				item.setQty(target.getQty());
				item.setPositionId(target.getPositionId());
				addProCount(item.getSid(), target.getQty().intValue() - oldQty);
				exist = true;
				break;
			}
		}
		if (!exist) {
			addProCount(target.getSid(), target.getQty().intValue());
			list.add(target);
		}
		cart.setItemList(list);
		setCart(cartId, cart);
	}

	/**
	 * 增加缓存中的商品正在抢购数量
	 * 
	 * @param pid
	 *            商品sid
	 */
	public void addProCount(String pid, long num) {
		getProCount(pid);
		Counter counter = cartCache.getCounter(pid, 0);
		try {
			counter.addAndGet(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 得到缓存中,正在抢购商品的人数
	 * 
	 * @param pid
	 *            商品sid
	 * @return
	 */
	public long getProCount(String pid) {
		Counter counter = cartCache.getCounter(pid, 0);
		try {
			return counter.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void setCart(String cartId, Cart cart) {
		try {
			this.cartCache.set(Codec.encodeMd5(cartId  + CartServiceImpl.class.getName()), 864000, cart);
		} catch (Exception e) {
		}
	}

	/**
	 * 获取商品条目详细信息
	 */
	@Override
	public CartItem getCartItemByDetail(String proDetailSid,
			String promotionPrice) {
		CartItem cartItem = JsonUtil.getCartItemByDetail(proDetailSid,
				promotionPrice);
		return cartItem;
	}

	/**
	 * 获取普通购物车所有商品条目
	 */
	@Override
	public List<CartItem> getCartProList(String cartId) {
		List<CartItem> list = new ArrayList<CartItem>();
		try {
			Cart cart = this.cartCache.get(Codec.encodeMd5(cartId  + CartServiceImpl.class.getName()));
			if (cart != null && !cart.getItemList().isEmpty()) {
				list = cart.getItemList();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 获取闪购购物车中指定proDetailSid商品条目
	 */
	@Override
	public CartItem getVipCartItem(String uid, String proDetailSid) {
		Cart cart = getVipCart(uid, Integer.parseInt(Constants.VIP_CART_INVALID));
		if (cart != null && !cart.getItemList().isEmpty()) {
			for (CartItem item : cart.getItemList()) {
				if (item.getSid().equals(proDetailSid)) {
					return item;
				}
			}
		}
		return null;
	}
	
	/**
	 * 获取闪购购物车
	 */
	@Override
	public Cart getVipCart(String uid, int validTime) {
		Cart cart = null;
		try {
			Object obj = this.cartCache.get(Codec.encodeMd5(uid  + CartServiceImpl.class.getName()));
			if (obj == null) {
				cart = new Cart();
				this.cartCache.add(Codec.encodeMd5(uid  + CartServiceImpl.class.getName()), validTime, cart);
			} else {
				cart = (Cart) obj;
			}
		} catch (Exception e) {
		}
		return cart;
	}

	/**
	 * 添加闪购物品到闪购购物车，
	 * 若物品已存在 则更新闪购购物车商品数量，
	 * 不存在则将物品加入闪购购物车并更新商品数量
	 */
	@Override
	public void addVipCartPro(String uid, CartItem cartitem) {
		Cart cart = getVipCart(uid, Integer.parseInt(Constants.VIP_CART_INVALID));
		List<CartItem> list = cart.getItemList();
		boolean exist = false;
		for (CartItem item : cart.getItemList()) {
			if (item.getSid().equals(cartitem.getSid())) {
				int oldQty = item.getQty() == null ? 0 : item.getQty()
						.intValue();
				item.setQty(cartitem.getQty());
				item.setPositionId(cartitem.getPositionId());
				addProCount(item.getSid(), cartitem.getQty().intValue() - oldQty);
				//获取闪购购物车剩余时间
				long remainTime = this.getVipCartReaminTime(uid);
				setVipCart(uid, cart, (int)remainTime);
				exist = true;
				break;
			}
		}
		if (!exist) {
			addProCount(cartitem.getSid(), cartitem.getQty().intValue());
			//增加闪购商品标志位
			cartitem.setActivityFlg(Constants.ACTIVE_FLAG);
			list.add(cartitem);
			//获取当前时间+VIP_CART_INVALID秒之后的时间
			long cur = new Date().getTime();
			cart.setVipCartTime(cur+Integer.parseInt(Constants.VIP_CART_INVALID)*1000);
			cart.setItemList(list);
			setVipCart(uid, cart, Integer.parseInt(Constants.VIP_CART_INVALID));
		}
	}
	/**
	 * 获取闪购购物车剩余存在时间
	 * 返回时间单位为秒
	 */
	public long getVipCartReaminTime(String uid) {
		long remain = 0;
		Cart cart = this.getVipCart(uid, Integer.parseInt(Constants.VIP_CART_INVALID));
		if(cart != null && cart.getVipCartTime() != 0) {
			remain = cart.getVipCartTime() - new Date().getTime();//毫秒
			remain = remain/1000;//秒
			if(remain <= 0) {
				remain = 0;
			}
		}
		
		return remain;
	}
	public void setVipCart(String uid, Cart cart, int validTime) {
		try {
			this.cartCache.set(Codec.encodeMd5(uid  + CartServiceImpl.class.getName()), validTime, cart);
		} catch (TimeoutException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (MemcachedException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 更新购物车中商品数量
	 */
	@Override
	public void updateCartProQty(String uid, String pid, int qty, int cartType) {
		CartItem cartItem = null;
		if(Constants.VIP_CART.equals(String.valueOf(cartType))) {
			//更新闪购购物车条目商品数量
			cartItem = this.getVipCartItem(uid, pid);
			if(cartItem != null) {
				cartItem.setQty(qty);
				this.addVipCartPro(uid, cartItem);
			}
			
		} else {
			//更新普通购物车条目商品数量
			cartItem = this.getCartItem(uid, pid);
			if(cartItem !=null) {
				cartItem.setQty(qty);
				this.addCartItem(uid, cartItem);
			}
		}
	}

	/**
	 * 删除购物车指定条目
	 */
	@Override
	public void delCartPro(String cartId, String proDetailSid, int cartType) {
		Cart cart = null;
		CartItem cartItem = null;
		if(Constants.VIP_CART.equals(String.valueOf(cartType))) {
			//删除闪购购物车条目
			cart = this.getVipCart(cartId, Integer.parseInt(Constants.VIP_CART_INVALID));
			cartItem = this.getVipCartItem(cartId, proDetailSid);
			if(cart != null && cartItem !=null) {
				for(CartItem item : cart.getItemList()) {
					if(cartItem.getSid().equals(item.getSid())) {
						cart.getItemList().remove(item);
						break;
					}
				}
				this.setVipCart(cartId, cart, Integer.parseInt(Constants.VIP_CART_INVALID));
			}
		} else {
			//删除普通购物车条目
			cart = this.getCart(cartId);
			cartItem = this.getCartItem(cartId, proDetailSid);
			if(cart != null && cartItem !=null) {
				for(CartItem item : cart.getItemList()) {
					if(cartItem.getSid().equals(item.getSid())) {
						cart.getItemList().remove(item);
						break;
					}
				}
				
				this.setCart(cartId, cart);
			}
		}
	}

	/**
	 * 清空购物车
	 */
	@Override
	public void clearCartPro(String cartId, String uid) {
		//清空普通购物车
	    Cart cart = getCart(cartId);
	    List<CartItem> list = cart.getItemList();
	    for (CartItem item : list) {
	      updateProCount(item.getSid(), item.getQty().intValue(), 0L);
	    }
	    list.clear();
	    cart.setItemList(list);
	    this.setCart(cartId, cart);
	    
	    //清空闪购购物车
	    Cart cartUid = this.getVipCart(uid, Integer.parseInt(Constants.VIP_CART_INVALID));
	    List<CartItem> listUid = cartUid.getItemList();
	    for (CartItem item : listUid) {
		      updateProCount(item.getSid(), item.getQty().intValue(), 0L);
		}
	    listUid.clear();
	    cartUid.setItemList(listUid);
	    this.setVipCart(uid, cartUid, Integer.parseInt(Constants.VIP_CART_INVALID));

	}
	
	/**
	 * 说明：
	 * 		更新
	 * @Create In 2013-8-20 By jingpeng
	 * @param pid
	 * @param oldQty
	 * @param newQty void
	 */
	public void updateProCount(String pid, long oldQty, long newQty) {
		Counter counter = this.cartCache.getCounter(pid, 0L);
		try {
			counter.addAndGet(newQty - oldQty);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 返回所有购物车条目
	 */
	@Override
	public List<CartItem> getCartItemList(String cartId, String uid) {
		List<CartItem> list = new ArrayList<CartItem>();
		if(cartId != null && !"".equals(cartId)) {
			//返回普通购物车所有条目
			Cart cart = this.getCart(cartId);
			if(cart.getItemList() != null && !cart.getItemList().isEmpty()) {
				list.addAll(cart.getItemList());
			}
			
		}
		if(uid != null && !"".equals(uid)) {
			//返回闪购购物车所有条目
			Cart cartVip = this.getVipCart(uid, Integer.parseInt(Constants.VIP_CART_INVALID));
			if(cartVip.getItemList() != null && !cartVip.getItemList().isEmpty()) {
				list.addAll(cartVip.getItemList());
			}
			
		}
		return list;
	}
	/**
	 * map方式返回所有购物车条目
	 */
	public Map<String, List<CartItem>> getCartItemsMap(String cartId, String uid) {
		Map<String, List<CartItem>> cartMap = new HashMap<String, List<CartItem>>();
		if(cartId != null && !"".equals(cartId)) {
			//返回普通购物车所有条目
			Cart cart = this.getCart(cartId);
			if(cart.getItemList() != null && !cart.getItemList().isEmpty()) {
				cartMap.put("0", cart.getItemList());
			}
			
		}
		if(uid != null && !"".equals(uid)) {
			//返回闪购购物车所有条目
			Cart cartVip = this.getVipCart(uid, Integer.parseInt(Constants.VIP_CART_INVALID));
			if(cartVip.getItemList() != null && cartVip.getItemList().size() > 0) {
				cartMap.put("1", cartVip.getItemList());
			}
			
		}
		return cartMap;
	}

	/**
	 * 计算出正常购物车和闪购购物车的总金额
	 */
	@Override
	public double getCartAmount(String cartId, String uid) {
		List<CartItem> items = this.getCartItemList(cartId, uid);
		if(items == null || items.isEmpty()) {
			return 0;
		} else {
			double amount = 0;
			for(CartItem item : items) {
				if(item.getQty()!=null 
						&& item.getPromotionPrice() != null 
						&& !"".equals(item.getPromotionPrice()) 
						&& item.getQty() >= 0) {
					amount += item.getQty()*Double.parseDouble(item.getPromotionPrice());
				}
			}
			return amount;
		}
	}
	/**
	 * 获取购物车所有商品数量
	 */
	public int getCartItemQty(String cartId, String uid) {
		int count = 0;
		List<CartItem> items = this.getCartItemList(cartId, uid);
		if(items != null && !items.isEmpty()) {
			for(CartItem item : items) {
				count += item.getQty() == null ? 0 : item.getQty().intValue();
			}
		}
		return count;
	}
	
	  /**
     * 得到当前请求的购物车中的OrderVO
     * @param cartId    购物车id(当前会话sessionID)
     * @return
     */
    public OrderVO getCartOrder(String cartId){
      return getCart(cartId).getOrderVO();
    }
	
    /**
     * 更新购物车中的ordervo
     * @param cartId
     * @param order
     */
    private void updateOrderVO(String cartId,OrderVO order){
        Cart cart=getCart(cartId);
        cart.setOrderVO(order);
        setCart(cartId,cart);
    }
    
	/**
     * 保存地址到购物车
     * @param cartId    购物车id(当前会话sessionID)
     * @param order     购物车中的待确认的订单
     */
    public void saveCartAddress(String cartId, MemberAddressVO address){
        OrderVO old=getCartOrder(cartId);
        old.setReceptName(address.getName());
        old.setReceptAddress(address.getFullAddress());
        old.setInceptProvinceSid(address.getDeliProvinceSid());
        old.setInceptProvince(address.getProvinceName());
        old.setInceptCitySid(address.getDeliCitySid());
        old.setInceptCity(address.getCityName());
        old.setInceptPostcode(address.getPostcode());
        old.setReceptPhone(address.getTel());
        //清空支付方式
        old.setPaymentModeSid(null);
        old.setPaymentModeName(null);
        //清空配送方式
        old.setSendType(null);
        old.setSendTypeName(null);
        old.setSendCost(null);
        old.setMemo(null);
        updateOrderVO(cartId,old);
    }
    
    /**
     * 保存发票信息到购物车
     * @param cartId     购物车id(当前会话sessionID)
     * @param order      购物车中的待确认的订单
     */
    public void saveCartInvoice(String cartId,OrderVO order){
        OrderVO old=getCartOrder(cartId);
        old.setInvoiceBit(order.getInvoiceBit());
        old.setInvoiceName(order.getInvoiceName());
        old.setInvoiceDesc(order.getInvoiceDesc());
        updateOrderVO(cartId,old);
    }
    
    /**
     * 保存支付方式和发货方式到购物车
     * @param cartId    购物车id(当前会话sessionID)
     * @param order     购物车中的待确认的订单
     */
    public void  saveCartSendType(String cartId,OrderVO order){
        OrderVO old=getCartOrder(cartId);
        
        //设置支付方式
        old.setPaymentModeSid(order.getPaymentModeSid());
        old.setPaymentModeName(order.getPaymentModeName());
        //设置配送方式
        old.setSendType(order.getSendType());
        old.setSendTypeName(order.getSendTypeName());
        old.setSendCost(order.getSendCost());
        old.setMemo(order.getMemo());
        updateOrderVO(cartId,old);
    }

	
}
