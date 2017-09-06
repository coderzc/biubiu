/**
 * 
 */
package com.dao;

import com.entity.modelBeans.PageModel;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


/**
 * @author zc
 * 通用泛型DAO
 */
public interface BaseDao<T> {

	/**
	 * 新增一个实例
	 * @param entity 要新增的实例 
	 */
	public void save(T entity);
	
	/**
	 * 根据主键删除一个实例 
	 * @param entity 对象
	 */
	public void delete(T entity);
	
	/**
	 * 编辑指定实例的详细信息
	 * @param entity 实例 
	 */
	public void update(T entity);
	
	/**
	 * 根据主键获取对应的实例 
	 * @param id 主键值
	 * @return 如果查询成功，返回符合条件的实例;如果查询失败，返回null
	 */
	public T get(Serializable id);
	
	/**
	 * 根据主键获取对应的实例 
	 * @param id 主键值
	 * @return 如果查询成功，返回符合条件的实例;如果查询失败，抛出空指针异常
	 */
	public T load(Serializable id);
	
	/**
	 * 获取所有实体实例列表
	 * @return 符合条件的实例列表
	 */
	public List<T> findAll();

	/**
	 *
	 * 查询实体列表
	 *
	 * @param hql
	 *            查询语句
	 * @param params
	 *            可选的查询参数
	 * @return 实体列表
	 */
	<T> List<T> findList(String hql, Object... params);


	<T> List<T> findList(String hql, Map<String, Object> params);


	/**
	 *
	 * 根据单一属性查询实体列表
	 *
	 * @param hql
	 *            查询语句
	 * @param param
	 *            可选的查询参数
	 * @return 实体列表
	 */
	<T> List<T> findList(String hql, Object param);


	/**
	 * 统计总实体实例的数量
	 * @return 总数量
	 */
	public int totalCount();



	/**
	 * 获取分页列表
	 * @param pageNo 当前页号
	 * @param pageSize 每页要显示的记录数
	 * @return 符合分页条件的分页模型实例
	 */
	public PageModel<T> findByPager(int pageNo, int pageSize);


	/*
	按语句根据单一参数获得分页模型实例
	 */
	public PageModel<T> findByPager(int pageNo, int pageSize, String hql, Object param);

	/*
        按语句根据多参数获得分页模型实例
         */
	public PageModel<T> findByPager(int pageNo, int pageSize, String hql, Object... params);

}
