package com.java.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CListJoinDto {

	private int cjoinriviewno;
	private int cno;
	private String id;
	private String cnm;
	private String dongcate;
	private Date cdodate;
	private String giveid;
	private String cnowstatus;

	//------------------------------clubreviewtemp----
	private int clubreviewno;
	private String getid;
	private int personaltemp;
}
