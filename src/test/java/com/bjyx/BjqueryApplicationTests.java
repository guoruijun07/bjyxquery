package com.bjyx;

import com.alibaba.csb.sdk.HttpCallerException;
import com.bjyx.controller.BindingRemoveRalationController;
import com.bjyx.entity.bo.bindingandremove.BindingRalationBo;
import com.bjyx.entity.bo.bindingandremove.RemoveRalationBo;
import com.bjyx.entity.po.TbBindingRemoveRalation;
import com.bjyx.mapper.TbBindingRmoveRalationMapper;
import com.bjyx.service.bindingandremove.BindingRalation;
import com.bjyx.service.bindingandremove.RemoveRalation;
import com.bjyx.service.QueryTrackInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest
public class BjqueryApplicationTests {

  @Autowired
  private QueryTrackInfo queryTrackInfo;



  @Autowired
  private BindingRalation bindingRalation;

  @Autowired
  private RemoveRalation removeRalation;

  @Autowired
  private TbBindingRmoveRalationMapper tbBindingRmoveRalationMapper;

  @Autowired
  private com.bjyx.controller.BindingRemoveRalationController bindingRemoveRalationController;

    @Test
    public void test() throws HttpCallerException {
        queryTrackInfo.queryTrackInfo("9610259229251");
    }



    @Test
    public void test3() throws IOException {
      TbBindingRemoveRalation bindingRalationBo=new TbBindingRemoveRalation();
      bindingRalationBo.setPrtms("18410427797");
      bindingRalationBo.setUnitID("10000000034");
      bindingRalationBo.setUuidinpartner("123");
      //bindingRalationBo.setSmbms("950135901236500");
      //bindingRalationBo.setOtherms("");
      //bindingRalationBo.setValiditytime("2020-6-27 23:30:00");
      bindingRalationBo.setSource("1");
      bindingRalationBo.setMenu("1");
      bindingRalationBo.setUserid("1");
      bindingRalationBo.setUsername("zhangsan");
      bindingRalation.bindingRalation(bindingRalationBo);
  }

  @Test
  public void test4() throws IOException {
    TbBindingRemoveRalation removeRalationBo=new TbBindingRemoveRalation();
    removeRalationBo.setUnitID("10000000034");
    removeRalationBo.setUuidinpartner("123");
    removeRalation.removeRalation(removeRalationBo);
  }

  @Test
  public void test5() throws IOException {
    TbBindingRemoveRalation bindingRalationBo=new TbBindingRemoveRalation();
    bindingRalationBo.setUuidinpartner("");
    List<TbBindingRemoveRalation> result=tbBindingRmoveRalationMapper.select(bindingRalationBo);
    System.out.println(result);
  }

  @Test
  public void test6() throws IOException {
    TbBindingRemoveRalation bindingRalationBo=new TbBindingRemoveRalation();
    bindingRalationBo.setId(3);
    bindingRalationBo.setDissubts("2020-1-1 00:00:00");
    bindingRalationBo.setStatus("0");
    bindingRalationBo.setModifyTime(new Date());
    bindingRalationBo.setRegphone("18410427797");
    int a=tbBindingRmoveRalationMapper.update(bindingRalationBo);
  }

  @Test
  public void test7() throws IOException {
    TbBindingRemoveRalation result =bindingRemoveRalationController.binding("15122625539","");
    System.out.println(result.getResult());
  }


}
