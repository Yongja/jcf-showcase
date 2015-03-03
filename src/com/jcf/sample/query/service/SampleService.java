package com.jcf.sample.query.service;

import java.util.List;
import java.util.Map;

import jcf.data.GridData;

import com.jcf.sample.query.model.Sample;

public interface SampleService {

	Sample getSampleByBean(Sample param);

	Map<String, Object> getSampleByMap(Map param);

	int getSampleByCount(Sample param);

	List<Sample> getSampleListByBean(Sample param);

	List<Map<String, Object>> getSampleListByMap(Map param);

	List<Sample> getSampleListByPaging(Sample param, int skipRows, int maxRows);

	int insertSample(Sample param);

	int updateSample(Sample parma);

	int deleteSample(Sample param);

	void saveSampleList(GridData<Sample> gridData);

	int[] updateSampleBatch(Sample[] param);

	Map<String, Object> executeFunction(Map param);

	Map<String, Object> executeProcedure(Map param);

	Map<String, Object> executeCallStatement(Map param);

}
