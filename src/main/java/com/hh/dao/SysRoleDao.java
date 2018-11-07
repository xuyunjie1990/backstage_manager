package com.hh.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.hh.entity.sys.SysRoleEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 角色管理
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2016年9月18日 上午9:33:33
 */
@Repository
@Mapper
public interface SysRoleDao extends BaseMapper<SysRoleEntity> {
	

}
