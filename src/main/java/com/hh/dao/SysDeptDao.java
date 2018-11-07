package com.hh.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.hh.entity.sys.SysDeptEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 部门管理
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017-06-20 15:23:47
 */
@Repository
@Mapper
public interface SysDeptDao extends BaseMapper<SysDeptEntity> {

    /**
     * 查询子部门ID列表
     * @param parentId  上级部门ID
     */
    List<Long> queryDetpIdList(Long parentId);

}
