package com.hh.service;

import com.baomidou.mybatisplus.service.IService;
import com.hh.common.utils.PageUtils;
import com.hh.entity.sys.SysDictEntity;

import java.util.Map;

/**
 * 数据字典
 *
 * @author Mark sunlightcs@gmail.com
 * @since 3.1.0 2018-01-27
 */
public interface SysDictService extends IService<SysDictEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

