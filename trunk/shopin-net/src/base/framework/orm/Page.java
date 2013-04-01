package base.framework.orm;

import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.StringUtils;


/**
 * 与具体ORM实现无关的分页参数及查询结果封装.
 * 注意所有序号从1开始.
 *
 * @param <T> Page中记录的类型.
 * 
 */
public class Page<T> {

	//公共变量
	public static final String ASC = "asc";
	public static final String DESC = "desc";
	//分页参数
	protected int pageNo = 1;
	protected int pageSize = 1; 
	protected String orderBy = null;
	protected String order = null;
	protected boolean autoCount = true;
	
	//返回结果
	protected List<T> result = Collections.emptyList();
	protected long totalCount = -1;
	//构造器
	public Page(){}
	public Page(final int pageSize){
		setPageSize(pageSize);
	}
	
	public Page(final int pageSize,final boolean autoCount){
		setPageSize(pageSize);
		setAutoCount(autoCount);
	}
	/**
	 * 获得当前页的页号 序号从1开始 默认为1
	 * @return
	 */
	public int getPageNo() {
		return pageNo;
	}
	/**
	 * 设置当前页的页号 序号从1开始 低于1时自动调整为1 
	 * @param pageNo
	 */
	public void setPageNo(final int pageNo) {
		this.pageNo = pageNo;
		if(pageNo < 1){
			this.pageNo = 1;
		}
	}
	
	
	
	
	/**
	 * 查询对象时是否自动另外执行count查询获取总记录数, 默认为false.
	 */
	public boolean isAutoCount() {
		return autoCount;
	}
	/**
	 * 查询对象时是否自动另外执行count查询获取总记录树
	 * @param autoCount2
	 */
	private void setAutoCount(final boolean autoCount) {
		this.autoCount = autoCount;
	}
	/**
	 * 设置每页的记录数量 低于1时自动调整为1
	 * @param pageSize
	 */
	public void setPageSize(final int pageSize){
		this.pageSize = pageSize;
		if(pageSize < 1){
			this.pageSize = 1;
		}
	}
	/**
	 * 获得每页的记录数量,默认为1.
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 根据pageNo 和 pageSize计算当前页第一条记录在总结果集中的位置 序号从1开始
	 * @return
	 */
	public int getFirst(){
		return ((pageNo - 1) * pageSize) + 1;
	}
	/**
	 * 获得排序字段 无默认值 多个排序字段时用 ',' 隔开
	 * @return
	 */
	public String getOrderBy() {
		return orderBy;
	}
	/**
	 * 设置排序字段 多个排序字段时用','隔开
	 * @param orderBy
	 */
	public void setOrderBy(final String orderBy) {
		this.orderBy = orderBy;
	}
	
	/**
	 * 是否已设置排序字段 无默认值
	 * @return
	 */
	public boolean isOrderBySetted(){
		return (StringUtils.isNotBlank(orderBy) && StringUtils.isNotBlank(order));
	}
	/**
	 * 获得排序方向.
	 */
	public String getOrder() {
		return order;
	}
	
	public void setOrder(final String order) {
		//检查order字符串的合法值
		String[] orders = StringUtils.split(StringUtils.lowerCase(order),",");
		for(String orderStr : orders){
			if(!StringUtils.equals(DESC, orderStr)&&!StringUtils.equals(ASC, orderStr))
				throw new IllegalArgumentException("排序方向" + orderStr + "不是合法值");
		}
		this.order = StringUtils.lowerCase(order);
	}
	
	/**
	 * 取得页内的记录列表.
	 */
	public List<T> getResult(){
		return result;
	}
	public void setResult(final List<T> result) {
		this.result = result;
	}
	/**
	 * 取得总记录数 默认值为-1
	 * @return
	 */
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(final long totalCount) {
		this.totalCount = totalCount;
	}
	
	/**
	 * 根据pageSize 与 totalCount 计算总页数 默认值为-1
	 * @return
	 */
	public long getTotalPages(){
		if(totalCount < 0){
			return -1;
		}
		long count = totalCount / pageSize;
		if(totalCount % pageSize > 0){
			count ++;
		}
		return count;
	}
	/**
	 * 是否还有下一页
	 * @return
	 */
	public boolean isHasNext(){
		return (pageNo + 1 <= getTotalPages());
	}
	
	/**
	 * 取得下页的页号, 序号从1开始.
	 * 当前页为尾页时仍返回尾页序号.
	 */
	public int getNextPage(){
		if(isHasNext()){
			return pageNo + 1;
		}else{
			return pageNo;
		}
	}
	/**
	 * 是否还有上一页.
	 */
	public boolean isHasPre(){
		return (pageNo - 1 >= 1);
	}
	
	/**
	 * 取得上页的页号, 序号从1开始.
	 * 当前页为首页时返回首页序号.
	 */
	public int getPrePage(){
		if(isHasPre())
			return pageNo - 1;
		else
			return pageNo;
	}
	@Override
	public String toString() {
		return String
				.format("Page :{pageNo:'%s', pageSize:'%s', orderBy:'%s', order:'%s', autoCount:'%s', result:'%s', totalCount:'%s'}",
						pageNo, pageSize, orderBy, order, autoCount, result,
						totalCount);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
