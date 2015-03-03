package com.jcf.system.dao;

import java.util.List;
import java.util.Map;

import jcf.data.handler.StreamHandler;

import jcf.query.core.QueryExecutor;
import jcf.query.core.mapper.PrimitiveTypeRowMapper;

public class CommonDaoImpl implements CommonDao {

	private QueryExecutor queryExecutor;

	public void setQueryExecutor(QueryExecutor queryExecutor) {
		this.queryExecutor = queryExecutor;
	}

	@Override
	public <T> void queryForStream(Object statementTemplate, Object parameter, StreamHandler<T> streamHandler) {
		queryExecutor.queryForStream(statementTemplate, parameter, streamHandler);
	}

	@Override
	public <T> List<T> queryForList(Object statementTemplate, Object parameter, Class<T> clazz) {
		return queryExecutor.queryForList(statementTemplate, parameter, clazz);
	}

	@Override
	public <T> List<T> queryForList(Object statementTemplate, Object parameter, int skipRows, int maxRows, Class<T> clazz) {
		return queryExecutor.queryForList(statementTemplate, parameter, skipRows, maxRows, clazz);
	}

	@Override
	public List<Object> queryForList(Object statementTemplate, Object parameter) {
		return queryExecutor.queryForList(statementTemplate, parameter);
	}

	@Override
	public List<Map<String, Object>> queryForMapList(Object statementTemplate, Object parameter) {
		return queryForMapList(statementTemplate, parameter, true);
	}

	@Override
	public List<Map<String, Object>> queryForMapList(Object statementTemplate, Object parameter, boolean usePropertyName) {
		return queryExecutor.queryForMapList(statementTemplate, parameter, usePropertyName);
	}

	@Override
	public List<Map<String, Object>> queryForMapList(Object statementTemplate, Object parameter, int skipRows, int maxRows, boolean usePropertyName) {
		return queryExecutor.queryForMapList(statementTemplate, parameter, skipRows, maxRows, usePropertyName);
	}

	@Override
	public Map<String, Object> queryForMap(Object statementTemplate, Object parameter) {
		return queryForMap(statementTemplate, parameter, true);
	}

	@Override
	public Map<String, Object> queryForMap(Object statementTemplate, Object parameter, boolean usePropertyName) {
		return queryExecutor.queryForMap(statementTemplate, parameter, usePropertyName);
	}

	@Override
	public <T> T queryForObject(Object statementTemplate, Object parameter, Class<T> clazz) {
		return queryExecutor.queryForObject(statementTemplate, parameter, clazz);
	}

	@Override
	public Object queryForObject(Object statementTemplate, Object parameter) {
		return queryExecutor.queryForObject(statementTemplate, parameter);
	}

	@Override
	public int queryForInt(Object statementTemplate, Object parameter) {
		return queryExecutor.queryForInt(statementTemplate, parameter);
	}

	@Override
	public long queryForLong(Object statementTemplate, Object parameter) {
		return queryExecutor.queryForLong(statementTemplate, parameter);
	}

	@Override
	public String queryForString(Object statementTemplate, Object parameter) {
		return queryExecutor.queryForObject(statementTemplate, parameter, new PrimitiveTypeRowMapper<String>(String.class));
	}

	@Override
	public int update(Object statementTemplate, Object parameter) {
		return queryExecutor.update(statementTemplate, parameter);
	}

	@Override
	public int[] batchUpdate(Object statementTemplate, Object[] parameters) {
		return queryExecutor.batchUpdate(statementTemplate, parameters);
	}

	@Override
	public <T> T executeProcedure(String schema, String packageName, String procedureName, Object parameter, Class<T> clazz) {
		return queryExecutor.executeProcedure(schema, packageName, procedureName, parameter, clazz);
	}

	@Override
	public Map<String, Object> executeProcedure(String schema, String packageName, String procedureName, Object parameter) {
		return queryExecutor.executeProcedure(schema, packageName, procedureName, parameter);
	}

	@Override
	public <T> T executeFunction(String schema, String packageName, String functionName, Object parameter, Class<T> clazz) {
		return queryExecutor.executeFunction(schema, packageName, functionName, parameter, clazz);
	}

	@Override
	public Map<String, Object> executeFunction(String schema, String packageName, String functionName, Object parameter) {
		return queryExecutor.executeFunction(schema, packageName, functionName, parameter);
	}

	@Override
	public Map<String, Object> executeCallStatement(Object statementTemplate, Object parameter) {
		return queryExecutor.executeCallStatement(statementTemplate, parameter);
	}

}
