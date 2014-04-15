package net.shopin.service;

import java.util.List;
import java.util.UUID;

import net.shopin.api.ICartService;
import net.shopin.view.Cart;
import net.shopin.view.CartItem;
import net.shopin.view.OrderVO;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-1-19
 * Time: 16:46:50
 * To change this template use File | Settings | File Templates.
 */

public class CartServiceImplTest {
    private static AbstractApplicationContext context;
    private ICartService memberService;

    @Before
    public void setUp() throws Exception {
        context = new ClassPathXmlApplicationContext("spring.xml");
        memberService = (ICartService) context.getBean("cartService");

    }
   // @Test
    public void testgetCart() throws Exception{
      	String cartId = "9da90ab5-0b86-418b-8a2f-b86f6ea94660";
      	Cart cart = memberService.getCart(cartId);
        System.out.println(cart.toString());
    }
    
    
   //@Test
    public void testgetCartItem() throws Exception{
      	String cartId = "14e0c61d-7def-45ac-9eab-8df195f39057";
      	String pid = "222";
      	CartItem cartItem = memberService.getCartItem(cartId, pid);
        System.out.println(cartItem);
    }
    
//    @Test
    public void testAddCartItem() {
    	String cartId = UUID.randomUUID().toString();
    	System.out.println(cartId);
    	CartItem cartItem = new CartItem();
    	cartItem.setChannelId("1");
    	cartItem.setColor("white");
    	cartItem.setName("清凉一夏");
    	cartItem.setOriginalPrice("999.99");
    	cartItem.setPositionId("2");
    	cartItem.setProductSid("55");
    	cartItem.setPromotionPrice("333.98");
    	cartItem.setSid("5");
    	cartItem.setProPicture("image/231.jgp");
    	cartItem.setProSku("proSku");
    	cartItem.setQty(3);
    	cartItem.setShopCount("4");
    	cartItem.setSize("22");
    	cartItem.setStoreCount("3");
    	this.memberService.addCartItem("62ba1e42-1e3e-4079-9b87-cf10f1f9a00b", cartItem);
    }
    
//    @Test 
    public void testAddCartPro() {
    	String cartId = UUID.randomUUID().toString();
    	System.out.println(cartId);
    	CartItem cartItem = new CartItem();
    	cartItem.setSid("222");
    	cartItem.setChannelId("22");
    	cartItem.setColor("cloudy");
    	cartItem.setName("阴天了，here we go!");
    	cartItem.setOriginalPrice("999.99");
    	cartItem.setPositionId("2");
    	cartItem.setProductSid("55");
    	cartItem.setPromotionPrice("333.98");
    	cartItem.setProPicture("image/231.jgp");
    	cartItem.setProSku("proSku");
    	cartItem.setQty(3);
    	cartItem.setShopCount("4");
    	cartItem.setSize("22");
    	cartItem.setStoreCount("3");
    	this.memberService.addCartPro(cartId, cartItem);
    }

//    @org.junit.Test
//    public void testSaveCartProduct() throws Exception {
//
//        OrderVO vo = new OrderVO();
//        vo.setInceptArea("北京市海淀区");
//        Cart cart = new Cart();
//        cart.setCartId("11000");
//        cart.setOrderVO(vo);
//        memberService.saveCartProduct(cart);
//        System.out.println("---" +memberService.getCartProduct("11000"));
////        System.out.println("--------"+cart1.getOrderVO().getInceptArea());
//    }

//    @org.junit.Test
    public void testGetCartProduct() throws Exception {

    }

//    @org.junit.Test
    public void testDelCartProduct() throws Exception {
    }

//    @org.junit.Test
    public void testSaveCartAddress() throws Exception {
    }

//    @org.junit.Test
    public void testSaveCartPayType() throws Exception {
    }

//    @org.junit.Test
    public void testSaveCartSendType() throws Exception {
    }

//    @org.junit.Test
    public void testCart() throws Exception {
          Cart cart=memberService.getCart("haha");
          cart.getItemList().add(new CartItem());
        System.out.println(cart.getItemList().size());
    }

//    @org.junit.Test
    public void testGetProCount() throws Exception {
//        int qty= memberService.getProCount("101");
//        System.out.println(qty);
    }

//    @org.junit.Test
    public void testAddGroupCount() throws Exception {
//        memberService.addGroupCount("101",100L);
//        Topkey add = GroupkeyCache.getTopkey(100L, "101");
        System.out.println("add:");
//        System.out.println("add count:"+(add==null?0:add.getCount()));
//        int qty= memberService.getProCount("101");

//        System.out.println("qty:"+qty);
    }

//    @org.junit.Test
    public void testUpdateProCount() throws Exception {
        System.out.println("pro count:"+memberService.getProCount("101"));
        for(int i=0;i<100;i++){
//             memberService.addGroupCount("101",100L);
        }
        System.out.println("pro count:"+memberService.getProCount("101"));
        for(int i=0;i<50;i++){
//            memberService.addGroupCount("101",200L);
        }
        System.out.println("pro count:"+memberService.getProCount("101"));

//        memberService.addGroupCount("101",100L);
//        Topkey add = GroupkeyCache.getTopkey(100L, "101");
//        System.out.println("add:");
//        System.out.println("add count:"+(add==null?0:add.getCount()));
//        int qty= memberService.getProCount("101");
//
//        System.out.println("qty:"+qty);
    }
    
    @Test
    public void getCartItemByDetailTest(){
	CartItem cartItem = memberService.getCartItemByDetail("342111","25");
	System.out.println(cartItem.toString());
    }
    //    @Test
    public void getCartProList(){
	List<CartItem> list = memberService.getCartProList("62ba1e42-1e3e-4079-9b87-cf10f1f9a00b");
	for (CartItem cartItem : list) {
	    System.out.println(cartItem.getSid());
	}
    }
    
//    @Test
    public void getCartItemQty(){
	int count = memberService.getCartItemQty("62ba1e42-1e3e-4079-9b87-cf10f1f9a00b",null);
	System.out.println(count);
    }
   
}
