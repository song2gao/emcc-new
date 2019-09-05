package com.gs.service.maintenance.unit;

import com.gs.domain.PomsAssembledTerminalDevice;
import com.gs.domain.PomsCalculateTerminalDevice;

import net.sf.json.JSONObject;

/** 
* @author 作者 朱亚彬: 
* @version 创建时间：2017年10月26日 下午1:31:37 
* 描述： 测量仪表配置 接口
*/
public interface InventoryService {

	/**
	 * 分页查询 cc
	 * @param pageIndex
	 * @param pageSize
	 * @param qyname
	 * @return
	 */
	JSONObject getEnegryUints(String pageIndex, String pageSize, String qyname);

	/**
	 * 分页查询 dd
	 * @param pageIndex
	 * @param pageSize
	 * @param unitid
	 * @return
	 */
	JSONObject getAss(String pageIndex, String pageSize, String unitid);

	/**
	 * 分页查询 ee
	 * @param unitid
	 * @param calculteid
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	JSONObject getCalculte(String unitid, String calculteid, int pageIndex, int pageSize);

	/**
	 * 添加前查询前置机列表信息 table="dd"
	 * @return
	 */
	JSONObject getfpc();

	/**
	 * 添加 table="dd"
	 * @param ass
	 * @param eid
	 * @param qzjid
	 * @return
	 */
	int saveAssembled(PomsAssembledTerminalDevice ass, String eid, String qzjid);

	/**
	 * 修改 table="dd"
	 * @param ass
	 * @param eid
	 * @param pid
	 * @return
	 */
	int saveOrUpdateAssembled(PomsAssembledTerminalDevice ass, String eid, String pid);

	/**
	 * 删除 table="dd"
	 * @param eid
	 * @param pid
	 * @return
	 */
	int delAssembled(String eid, String pid);

	/**
	 * 添加 table="ee"
	 * @param calculate 
	 * @param aid
	 * @return
	 */
	int saveMeter(PomsCalculateTerminalDevice calculate, String aid);

	/**
	 * 删除 table="ee" 及批量删除
	 * @param aid
	 * @param calculIds
	 * @return
	 */
	int delMeter(String calculIds);

	/**
	 * 修改 table="ee"
	 * @param calculate
	 * @return
	 */
	int uppMeter(PomsCalculateTerminalDevice calculate);

}
