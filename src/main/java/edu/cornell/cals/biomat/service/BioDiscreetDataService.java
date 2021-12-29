package edu.cornell.cals.biomat.service;

import java.util.List;

import javax.validation.Valid;

import edu.cornell.cals.biomat.dao.BioDiscreetData;

public interface BioDiscreetDataService {
	
	List<BioDiscreetData> getAllBioDiscreetData();

	BioDiscreetData getBioDiscreetData(Long id);
	
	List<BioDiscreetData> getBioDiscreetDataByDataSetNameORYVariable(String yVariable);
}
