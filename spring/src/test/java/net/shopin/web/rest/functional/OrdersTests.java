/**
 * @Probject Name: spring
 * @Path: net.shopin.web.rest.functional.OrdersTests.java
 * @Create By kongm
 * @Create In 2013-12-2 下午5:32:33
 * TODO
 */
package net.shopin.web.rest.functional;

import java.util.Arrays;

import net.shopin.web.rest.domain.Order;
import net.shopin.web.rest.fixture.RestDataFixture;

import org.junit.Test;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import static junit.framework.TestCase.*;
/**
 * @Class Name OrdersTests
 * @Author kongm
 * @Create In 2013-12-2
 */
public class OrdersTests {
	
	
	@Test
	public void thatOrdersCanBeAddedAndQueried(){
	/*	HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	*/	
		RestTemplate template = new RestTemplate();
		HttpEntity<String> requestEntity = new HttpEntity<String>(RestDataFixture.standardOrderJSON(),
				getHeaders("letsnosh" + ":" + "noshing"));
		
		ResponseEntity<Order> entity = 
				template.postForEntity("http://localhost:8080/orders",requestEntity, Order.class);
		
		String path = entity.getHeaders().getLocation().getPath();
		
		assertEquals(HttpStatus.CREATED, entity.getStatusCode());
		assertTrue(path.startsWith("/orders"));
		Order order = entity.getBody();
		System.out.println("The Order ID is " + order.getKey());
		System.out.println("The Location is " + entity.getHeaders().getLocation());
		assertEquals(2, order.getItems().size());
	}
	
	@Test
	public void thatOrdersCannotBeAddedAndQueriedWithBadUser(){
		HttpEntity<String> requestEntity = new HttpEntity<String>(RestDataFixture.standardOrderJSON(),
				getHeaders("letsnosh:BADPASSWORD"));
		RestTemplate template = new RestTemplate();
		try {
			ResponseEntity<Order> entity = template.postForEntity("http://localhost:8080/orders", 
					requestEntity,Order.class);
			fail("Request Passed incorrectly with status " + entity.getStatusCode());
		} catch (HttpClientErrorException e) {
			assertEquals(HttpStatus.UNAUTHORIZED, e.getStatusCode());
		}
		
	}
	
	
	
	//{!begin httpheaders}
	public static HttpHeaders getHeaders(String auth){
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		byte[] encodedAuthorisation = Base64.encode(auth.getBytes());
		headers.add("Authorization", "Basic " + new String(encodedAuthorisation));
		return headers;
	}
	//{!end httpheaders}
	
	

}
