package com.hh.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.hh.entity.sys.SysDictEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 数据字典
 *
 * @author Mark sunlightcs@gmail.com
 * @since 3.1.0 2018-01-27
 */
@Repository
@Mapper
public interface SysDictDao extends BaseMapper<SysDictEntity> {
	
}
