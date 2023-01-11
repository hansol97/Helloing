package com.jl.helloing.business.model.service;

import java.util.ArrayList;

import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.common.model.vo.Cert;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Room;

public interface BusinessService {
	// 파트너 기업 등록
	int insertCompany(Business b);
	
	Business loginCompany(int memNo);
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//인호 ---------------------------------------------------------------------------
	// 숙소 등록
	
	int insertAccom(Accomm acc);

	int insertAccomPhoto(ArrayList<Attachment> list);

	int InsertAct(Activity act);

	int InsertActPhoto(ArrayList<Attachment> list);


	int InsertRoom(Room room);

	int InsertRoomPhoto(ArrayList<Attachment> list);

	int updateBusinessMember(Business loginCompany);


	
	
	
	
	
	

	//인호 ---------------------------------------------------------------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
