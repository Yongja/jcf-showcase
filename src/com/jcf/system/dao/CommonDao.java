package com.jcf.system.dao;

import java.util.List;
import java.util.Map;

import jcf.data.handler.StreamHandler;

public interface CommonDao {

	/**
     *
     * @param sqlId
     * @param parameter
     * @param streamHandler
     */
    <T> void queryForStream(Object statementTemplate, Object parameter, StreamHandler<T> streamHandler);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @return
     */
    <T> List<T> queryForList(Object statementTemplate, Object parameter, Class<T> clazz);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @return
     */
    List<Map<String, Object>> queryForMapList(Object statementTemplate, Object parameter);


    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @deprecated
     * @return
     */
    List<Map<String, Object>> queryForMapList(Object statementTemplate, Object parameter, boolean usePropertyName);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @deprecated
     * @return
     */
    List<Map<String, Object>> queryForMapList(Object statementTemplate, Object parameter, final int skipRows, final int maxRows, boolean usePropertyName);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param skipRows
     * @param maxRows
     * @param clazz
     * @return
     */
    <T> List<T> queryForList(Object statementTemplate, Object parameter, int skipRows, int maxRows, Class<T> clazz);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param skipRows
     * @param maxRows
     * @param clazz
     * @deprecated
     * @return
     */
    List<Object> queryForList(Object statementTemplate, Object parameter);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @return
     */
    Map<String, Object> queryForMap(Object statementTemplate, Object parameter);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param usePropertyName
     *            (camelCase ������ ��ȸ ����)
     * @return
     */
    Map<String, Object> queryForMap(Object statementTemplate, Object parameter, boolean usePropertyName);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @return
     */
    <T> T queryForObject(Object statementTemplate, Object parameter, Class<T> clazz);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @return
     */
    Object queryForObject(Object statementTemplate, Object parameter);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @return
     */
    int queryForInt(Object statementTemplate, Object parameter);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @return
     */
    long queryForLong(Object statementTemplate, Object parameter);


    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @return
     */
    String queryForString(Object statementTemplate, Object parameter);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @return
     */
    int update(Object statementTemplate, Object parameter);

    /**
     *
     * @param statementTemplate
     * @param parameters
     * @return
     */
    int[] batchUpdate(Object statementTemplate, Object[] parameters);

    /**
     *
     * @param schema
     * @param packageName
     * @param procedureName
     * @param parameter
     * @param clazz
     * @return
     */
    <T> T executeProcedure(String schema, String packageName, String procedureName, Object parameter, Class<T> clazz);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @return
     */
    Map<String, Object> executeProcedure(String schema, String packageName, String procedureName, Object parameter);

    /**
     *
     * @param schema
     * @param packageName
     * @param procedureName
     * @param parameter
     * @param clazz
     * @return
     */
    <T> T executeFunction(String schema, String packageName, String functionName, Object parameter, Class<T> clazz);

    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @return
     */
    Map<String, Object> executeFunction(String schema, String packageName, String functionName, Object parameter);


    /**
     *
     * @param statement id(in sqlMap)
     * @param parameter
     * @param clazz
     * @return
     */
    Map<String, Object> executeCallStatement(Object statementTemplate, Object parameter);

}
