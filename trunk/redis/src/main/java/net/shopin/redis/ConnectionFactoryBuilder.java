///**
// * 
// */
//package net.shopin.redis;
//
//import redis.clients.jedis.JedisPoolConfig;
//
//
///**
// * @author kongming
// *
// */
//public class ConnectionFactoryBuilder {
//
//	private RedisClientConfig redisClientConfig;
//	
//    public void resetRedisClientConfig(){
//        redisClientConfig = new RedisClientConfig();
//    }
//
//    public int getErrorRetryTimes() {
//        return redisClientConfig.getErrorRetryTimes();
//    }
//
//    public void setErrorRetryTimes(int errorRetryTimes) {
//        this.redisClientConfig.setErrorRetryTimes(errorRetryTimes);
//    }
//
//    public RedisClientConfig getRedisClientConfig() {
//        return redisClientConfig;
//    }
//
//    public void setRedisClientConfig(RedisClientConfig redisClientConfig) {
//        this.redisClientConfig = redisClientConfig;
//    }
//
//    public void setMaxActive(int maxActive) {
//        this.redisClientConfig.setMaxActive(maxActive);
//    }
//
//    public void setMaxIdle(int maxIdle) {
//        this.redisClientConfig.setMaxIdle(maxIdle);
//    }
//
//    public void setMaxWait(int maxWait) {
//        this.redisClientConfig.setMaxWait(maxWait);
//    }
//
//    public void setTestOnBorrow(boolean flag) {
//        this.redisClientConfig.setTestOnBorrow(flag);
//    }
//
//    public JedisPoolConfig getJedisPoolConfig() {
//        return redisClientConfig.getJedisPoolConfig();
//    }
//
//    public void setTimeout(int timeout) {
//        redisClientConfig.setTimeout(timeout);
//    }
//
//    public int getTimeout() {
//        return redisClientConfig.getTimeout();
//    }
//
//    public String getMasterConfString() {
//        return redisClientConfig.getMasterConfString();
//    }
//
//    public void setMasterConfString(String masterConfString) {
//        redisClientConfig.setMasterConfString(masterConfString);
//    }
//
//    public String getSlaveConfString() {
//        return redisClientConfig.getSlaveConfString();
//    }
//
//    public void setSlaveConfString(String slaveConfString) {
//        redisClientConfig.setSlaveConfString(slaveConfString);
//    }
//
//    
//    
//	
//	
//	
//}
