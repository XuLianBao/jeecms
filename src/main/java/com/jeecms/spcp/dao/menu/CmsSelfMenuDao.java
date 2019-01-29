package com.jeecms.spcp.dao.menu;

import com.jeecms.spcp.entity.persistence.menu.CmsSelfMenu;
import com.jeecms.spcp.entity.model.CmsSelfMenuEditModel;

import java.util.List;

public interface CmsSelfMenuDao {
    public List<CmsSelfMenu> getMenuDates();

    public List<CmsSelfMenuEditModel> getEditMenuDates();
}
