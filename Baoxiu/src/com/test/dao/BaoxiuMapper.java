package com.test.dao;

/*dao包,标记@MyBatisDao,网页操作在这里定义*/
import com.test.common.persistence.annotation.MyBatisDao;
import com.test.web.entity.Baoxiu;
import com.test.web.entity.BaoxiuExample;

import java.util.List;
@MyBatisDao
public interface BaoxiuMapper {
    int deleteByPrimaryKey(String id);

    int insert(Baoxiu record);

    int insertSelective(Baoxiu record);

    List<Baoxiu> selectByExample(BaoxiuExample example);

    Baoxiu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Baoxiu record);

    int updateByPrimaryKey(Baoxiu record);
}