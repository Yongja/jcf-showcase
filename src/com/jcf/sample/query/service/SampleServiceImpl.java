package com.jcf.sample.query.service;

import java.util.List;
import java.util.Map;

import jcf.data.GridData;
import jcf.data.RowStatusCallback;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jcf.sample.query.model.Sample;
import com.jcf.system.dao.CommonDao;

@Service
public class SampleServiceImpl implements SampleService {

	@Autowired
	private CommonDao commonDao;

	/**
	 * <T> T queryForObject(Object statementTemplate, Object parameter,	Class<T> clazz)
	 *
	 * @param String
	 * @return Sample
	 */
	public Sample getSampleByBean(Sample param) {
		return commonDao.queryForObject("sample.getSampleByModel", param, Sample.class);
	}

	/**
	 * Map<String, Object> queryForMap(Object statementTemplate, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public Map<String, Object> getSampleByMap(Map param) {
		Map<String, Object> retValue = commonDao.queryForMap("sample.getSampleByMap", param);
		return retValue;
	}

	/**
	 * Integer queryForInt(Object statementTemplate, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public int getSampleByCount(Sample param) {
		return commonDao.queryForInt("sample.getSampleByInt", param);
	}


	/**
	 * <T> List<T> queryForList(Object statementTemplate, Object parameter, Class<T> clazz)
	 *
	 * @param param
	 * @return
	 */
	public List<Sample> getSampleListByBean(Sample param) {
		return commonDao.queryForList("sample.getSampleByModel", param, Sample.class);
	}

	/**
	 * List<Map<String, Object>> queryForMapList(Object statementTemplate, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getSampleListByMap(Map param) {
		return commonDao.queryForMapList("sample.getSampleByMap", param);
	}

	/**
	 * <T> List<T> queryForList(Object statementTemplate, Object parameter, final int skipRows, final int maxRows, Class<T> clazz)
	 * skipRows 현재 페이지가 보여지기 위해 skip 한 데이터 건수
	 * maxRows 한 페이지에서 보여지는 최대 건수
	 *
	 * @param param
	 * @param skipRows
	 * @param maxRows
	 * @return
	 */
	public List<Sample> getSampleListByPaging(Sample param, int skipRows, int maxRows) {
		return commonDao.queryForList("sample.getSampleByModel", param, skipRows, maxRows, Sample.class);
	}

	/**
	 * Integer update(Object statementTemplate, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public int insertSample(Sample param) {
		return commonDao.update("sample.insertSample", param);
	}

	/**
	 * Integer update(Object statementTemplate, Object parameter)
	 *
	 * @param parma
	 * @return
	 */
	public int updateSample(Sample parma) {
		return commonDao.update("sample.updateSample", parma);
	}

	/**
	 * Integer update(Object statementTemplate, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public int deleteSample(Sample param) {
		return commonDao.update("sample.deleteSample", param);
	}

	/**
	 * GridData<E> CRUD Example
	 *
	 * @param gridData
	 */
	public void saveSampleList(GridData<Sample> gridData) {
		this.saveGridData(gridData);
	}

	private <E> void saveGridData(GridData<E> gridData) {
		gridData.forEachRow(new RowStatusCallback<E>() {

			@Override
			public void insert(E record, int rowNum) {
				commonDao.update("sample.insertSample", record);
			}

			@Override
			public void update(E record, E oldRecord, int rowNum) {
				commonDao.update("sample.updateSample", record);
			}

			@Override
			public void delete(E record, int rowNum) {
				commonDao.update("sample.deleteSample", record);
			}

			@Override
			public void normal(E arg0, int arg1) {
			}
		});
	}

	public int[] updateSampleBatch(Sample[] param) {
		return commonDao.batchUpdate("sample.updateSample", param);
	}

 	/**
	 * Map<String, Object> executeFunction(String schema, String packageName, String functionName, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public Map<String, Object> executeFunction(Map param) {
		return commonDao.executeFunction("SCHEMA", "PKG_NAME", "FUN_NAME", param);
	}

	/**
	 * Map<String, Object> executeProcedure(String schema, String packageName, String procedureName, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public Map<String, Object> executeProcedure(Map param) {
		return commonDao.executeProcedure("SCHEMA", "PKG_NAME", "SP_NAME", param);
	}

	/**
	 * Map<String, Object> executeCallStatement(Object statementTemplate, Object parameter)
	 *
	 * @param param
	 * @return
	 */
	public Map<String, Object> executeCallStatement(Map param) {
		return commonDao.executeCallStatement("sample.executeCallStatment", param);
	}
}
