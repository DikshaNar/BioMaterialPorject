package edu.cornell.cals.biomat.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import edu.cornell.cals.biomat.dao.BioMaterial;
import edu.cornell.cals.biomat.repository.BioMaterialRepository;
import edu.cornell.cals.biomat.service.BioMaterialService;

@Service
public class BioMaterialServiceImpl implements BioMaterialService{

	@Autowired
	BioMaterialRepository bioMaterialRepository;
	
	@Override
	public BioMaterial getBioMaterial(Long id) {
		BioMaterial bm = bioMaterialRepository.getOne(id);
		return bm;
	}
	
	@Override
	public List<BioMaterial> getBioMaterial(String shortDesc) {
		return bioMaterialRepository.getBioMaterial("%"+shortDesc+"%");
	}

	@Override
	public BioMaterial getBioMaterialByUsdaId(Long usdaId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String,Object> getBioMaterial(Pageable pageable, String shortDesc) {
		Map<String,Object> map = new HashMap<String,Object>();
		int count = bioMaterialRepository.getBioMaterialCount("%"+shortDesc+"%");
		Page<BioMaterial>  bioMaterialPage  = bioMaterialRepository.getBioMaterialWithPagination(pageable,"%"+shortDesc+"%");	
		map.put("count",count);
		map.put("bioMaterialPage",bioMaterialPage);
		return map;
	}

	@Override
	public BioMaterial updateBioMaterial(BioMaterial bioMaterial, String userId) {
		bioMaterial.setUpdatedBy(userId);
		BioMaterial bm =bioMaterialRepository.save(bioMaterial);
		return bm;
	}

	
	@Override
    public List<BioMaterial> getBioMaterialWithFormula(String shortDesc){
		//List<BioMaterial> bioMaterialsWithFormula = bioMaterialRepository.getBioMaterialWithFormula("%"+shortDesc+"%");
		//return bioMaterialsWithFormula ;
		List<BioMaterial> bioMaterialsWithFormula = bioMaterialRepository.getBioMaterial(shortDesc+"%");
		// Filter All Material with Id 0 
		return bioMaterialsWithFormula.stream().filter(bm->bm.getId()!=0).collect(Collectors.toList());
	}

	@Override
	public List<BioMaterial> getSelectedUniqueMaterial(String shortDesc) {
		List<BioMaterial> bioMat = new ArrayList<BioMaterial>();
		List<BioMaterial> bioMaterialList = new ArrayList<BioMaterial>();
		List<BioMaterial>  bioMaterials = bioMaterialRepository.getBioMaterial(shortDesc+"%");
		List<String> items = null;
		for(BioMaterial bioMaterial:bioMaterials) {
			items = Arrays.asList(bioMaterial.getShortDesc().split(","));
			String name = items.get(0);
			bioMaterial.setShortDesc(name);
			bioMat.add(bioMaterial);
		}
		Set<BioMaterial> set = bioMat.stream()
	            .collect(Collectors.toCollection(() ->
	                 new TreeSet<>(Comparator.comparing(BioMaterial::getShortDesc))));
		for(BioMaterial bi:set) {
			bioMaterialList.add(bi);
		}
		return  bioMaterialList;
	}
	
	@Override
	public Integer getLastIdOfBioMaterial() {
		Integer lastId = bioMaterialRepository.getLastIdOfBioMaterial();
		return lastId;
	}
	
	@Override
	public BioMaterial getCustomBioMaterialUsingId(Long biomaterialId) {
		BioMaterial bm = bioMaterialRepository.getOne(biomaterialId);
		return bm;
	}
	
	@Override
	public boolean removeMaterialUsingId(Long materialId) {
		bioMaterialRepository.deleteBioMaterialUsingId(materialId);
		if(bioMaterialRepository.existsById(materialId)) {
			bioMaterialRepository.deleteById(materialId);
			return true;
		}
		return true;
	}
	
	@Override
	public boolean updateCustomBioMaterialUsingId(Long materialId, String shortDescName, String longDescName, String updatedDate, String userName) {
		bioMaterialRepository.updateCustomBioMaterialUsingId(materialId, shortDescName, longDescName, updatedDate, userName);
		return true;
	}
	
	@Override
	public List<BioMaterial> getBioMaterialForCustom(String shortDesc) {
		return bioMaterialRepository.getBioMaterial("%"+shortDesc);
	}
}
