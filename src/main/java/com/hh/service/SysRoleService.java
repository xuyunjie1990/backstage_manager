package com.hh.service;


import com.baomidou.mybatisplus.service.IService;
import com.hh.common.utils.PageUtils;
import com.hh.entity.sys.SysRoleEntity;

import java.util.Map;


/**
 * 角色
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年9月18日 上午9:42:52
 */
public interface SysRoleService extends IService<SysRoleEntity> {

	PageUtils queryPage(Map<String, Object> params);

	void save(SysRoleEntity role);

	void update(SysRoleEntity role);
	
	void deleteBatch(Long[] roleIds);

}
