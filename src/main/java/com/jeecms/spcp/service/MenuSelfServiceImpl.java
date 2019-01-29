package com.jeecms.spcp.service;

import com.jeecms.spcp.dao.menu.CmsMenuDao;
import com.jeecms.spcp.dao.menu.CmsSelfMenuDao;
import com.jeecms.spcp.entity.model.CmsSelfMenuEditModel;
import com.jeecms.spcp.entity.persistence.menu.CmsSelfMenu;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

/**
 * 　　　┏┓　　　┏┓
 * 　　┏┛┻━━━┛┻┓
 * 　　┃　　　━　　　┃
 * 　　┃　┳┛　┗┳　┃
 * 　　┃　　　┻　　　┃
 * 　　┗━┓　　　┏━┛
 * 　　　　┃　　　┗━━━┓
 * 　　　　┃　　永无BUG 　┣┓
 * 　　　　┃　　万物天佑　┏┛
 * 　　　　┗┓┓┏━┳┓┏┛
 * 　　　　　┗┻┛　┗┻┛
 *
 * @类名：MenuSelfService
 * @描述：com.jeecms.cms.service
 * @创建人 xlb
 * @创建时间 2019/1/2 14:48
 * @Version 1.0
 */
@Service(value = "menuSelfService")
public class MenuSelfServiceImpl implements MenuSelfService {

    @Resource
    private CmsSelfMenuDao cmsSelfMenuDao;

    @Resource
    private CmsMenuDao cmsMenuDao;

    public List<CmsSelfMenu> getMenuDates() {
        return cmsSelfMenuDao.getMenuDates();
    }

    public String getMenuDatesJson() {
        // 原始的数据
        List<CmsSelfMenu> allMenuDates = this.getMenuDates();

        // 最后的结果
        List<CmsSelfMenu> menuList = new ArrayList<>();
        // 先找到所有的一级菜单
        firstSelec:
        for (int i = 0; i < allMenuDates.size(); i++) {
            // 父节点id是0
            if ((allMenuDates.get(i).getParentId().intValue() == 0)) {
                menuList.add(allMenuDates.get(i));
            } else if (allMenuDates.get(i).getParentId().intValue() > 0) {
                break firstSelec;
            }
        }
        int currentSize = menuList.size();
        if (menuList.size() > 0) {
            Collections.sort(menuList);//将儿子们排好序列
        }
        Collections.sort(menuList);//将儿子们排好序列
        final int totalSize = allMenuDates.size();
        // 为一级菜单设置子菜单，getChild是递归调用的
        for (CmsSelfMenu menu : menuList) {
            menu.setCmsChildMenuList(getChild(menu.getId(), allMenuDates, currentSize, totalSize));
        }
        return menuList.toString();

    }

    @Override
    public List<CmsSelfMenuEditModel> getEditMenuDates() {
        return cmsSelfMenuDao.getEditMenuDates();
    }

    @Override
    public String getMenuEditDatesJson() {
        // 最后的结果
        List<CmsSelfMenuEditModel> menuList = new ArrayList<>();
        // 原始的数据
        List<CmsSelfMenuEditModel> allMenuDates = this.getEditMenuDates();

        // 先找到所有的一级菜单
        firstSelect:
        for (int i = 0; i < allMenuDates.size(); i++) {
            // 父节点id是0
            if ((allMenuDates.get(i).getParentId().intValue() == 0)) {
                menuList.add(allMenuDates.get(i));
            } else if (allMenuDates.get(i).getParentId().intValue() > 0) {
                break firstSelect;
            }
        }

        int totalSize = allMenuDates.size();
        if (menuList.size() > 0) {
            Collections.sort(menuList);//将儿子们排好序列
        }
        int currentSize = menuList.size();
        // 为一级菜单设置子菜单，getChild是递归调用的
        for (CmsSelfMenuEditModel menu : menuList) {
            menu.setCmsSelfMenuEditModelList(getEditChild(menu.getId(), allMenuDates, currentSize, totalSize));
        }
        return menuList.toString();
    }

    @Override
    public CmsSelfMenu get(Integer id) {
        return cmsMenuDao.getInfo(id);
    }

    @Transactional
    @Override
    public void update(CmsSelfMenu cmsSelfMenu) {
        if (cmsSelfMenu.getId() != null) {
            cmsMenuDao.update(cmsSelfMenu);
        } else {
            cmsMenuDao.saveInfo(cmsSelfMenu);
        }
    }

    @Override
    public void delete(Integer id) {
        cmsMenuDao.delete(id);
    }

    @Override
    public void deleteAll(List<Integer> ids) {
        cmsMenuDao.deleteAll(ids);
    }

    @Override
    public List<CmsSelfMenu> getAll() {
        SimpleExpression value = Restrictions.eq("isDisplay", 1);
        return  cmsMenuDao.find(value);
    }

    @Override
    public List<CmsSelfMenu> getRecommendById(Integer id) {
        SimpleExpression value = Restrictions.eq("isDisplay", 1);
        SimpleExpression isLeaf = Restrictions.eq("isLeaf", 0);
        SimpleExpression notId = Restrictions.ne("id", id);
        SimpleExpression menuLevel = Restrictions.eq("menuLevel", 2);
        return  cmsMenuDao.find(value,isLeaf,notId,menuLevel);
    }

    @Override
    public List<CmsSelfMenu> getByFilter(Criterion... criterion) {
        return cmsMenuDao.find(criterion);
    }

    /**
     * 递归查找子菜单
     *
     * @param id           当前菜单id
     * @param allMenuDates 要查找的列表
     * @param totalSize
     * @param currentSize
     *
     * @return
     */
    private List<CmsSelfMenu> getChild(Integer id, List<CmsSelfMenu> allMenuDates, int currentSize, int totalSize) {
        // 子菜单
        List<CmsSelfMenu> childList = new ArrayList<>();

        if (currentSize * 2 > totalSize) {//遍历的有效数据超过一半了，反向遍历
            CmsSelfMenu menu;
            firstChild:
            for (int i = totalSize - 1; i > 0; i--) {//parentId 从大到小遍历
                menu = allMenuDates.get(i);
                // 遍历所有节点，将父菜单id与传过来的id比较
                if (menu.getParentId().intValue() > 0) {
                    if (menu.getParentId().equals(id)) {
                        childList.add(menu);
                        currentSize++;
                    } else if (menu.getParentId().intValue() < id) {//可以退出遍历了；因为得到的数据是根据parentId排好序的，剩下的数据永远只会小于当前id
                        if (childList.size() > 0) {
                            Collections.sort(childList);//将儿子们排好序列
                        }
                        break firstChild;
                    }
                }
            }
        } else {//遍历的数据没有超过一半则正向遍历
            //查出当前节点的所有直接一级子元素
            firstChild:
            for (CmsSelfMenu menu : allMenuDates) {
                // 遍历所有节点，将父菜单id与传过来的id比较
                if (menu.getParentId().intValue() > 0) {
                    //数据是排好序列的，如果当前的父节点大于应 处理数据的父节点，说明后序的数据永远不会符合要求，则停止查询
                    if (menu.getParentId().intValue() > id) {
                        break firstChild;
                    } else if (menu.getParentId().equals(id)) {
                        childList.add(menu);
                        currentSize++;
                        Collections.sort(childList);
                    }
                }
            }
        }

        // 把子菜单的子菜单再循环一遍;这个过程无所谓正负顺序
        secondChild:
        for (CmsSelfMenu menu : childList) {
            if ( menu.getIsCustomPage() !=null && 1 != menu.getIsCustomPage()) {//因为当子元素有数据时，则此时是相对父节点，getRedirect不为空，因此有必要继续查询其子节点
                // 递归
                menu.setCmsChildMenuList(getChild(menu.getId(), allMenuDates, currentSize, totalSize));
            }
        }

        // 递归退出条件
        if (childList.size() == 0) {
            return null;
        }
        return childList;
    }


    /**
     * 递归查找子菜单
     *
     * @param id           当前菜单id
     * @param allMenuDates 要查找的列表
     * @param currentSize
     * @param totalSize
     *
     * @return
     */
    private List<CmsSelfMenuEditModel> getEditChild(Integer id, List<CmsSelfMenuEditModel> allMenuDates, int currentSize, int totalSize) {
        // 子菜单
        List<CmsSelfMenuEditModel> childList = new ArrayList<>();

        if (currentSize * 2 < totalSize) {//遍历的数据没有超过一半则正向遍历
            //查出当前节点的所有直接一级子元素
            firstChild:
            for (CmsSelfMenuEditModel menu : allMenuDates) {
                // 遍历所有节点，将父菜单id与传过来的id比较
                if (menu.getParentId().intValue() >= 1) {
                    //数据是排好序列的，如果当前的父节点大于应 处理数据的父节点，说明后序的数据永远不会符合要求，则停止查询
                    if (menu.getParentId().equals(id)) {
                        childList.add(menu);
                        currentSize++;
                        Collections.sort(childList);
                    } else if (menu.getParentId().intValue() > id) {
                        break firstChild;
                    }
                }
            }
        } else {//遍历的有效数据超过一半了，反向遍历
            CmsSelfMenuEditModel menu;
            firstChild:
            for (int i = totalSize - 1; i > 0; i--) {//parentId 从大到小遍历
                menu = allMenuDates.get(i);
                // 遍历所有节点，将父菜单id与传过来的id比较
                if (menu.getParentId().intValue() >= 1) {
                    if (menu.getParentId().intValue() < id) {//可以退出遍历了；因为得到的数据是根据parentId排好序的，剩下的数据永远只会小于当前id
                        if (childList.size() > 0) {
                            Collections.sort(childList);//将儿子们排好序列
                        }
                        break firstChild;
                    } else if (menu.getParentId().equals(id)) {
                        childList.add(menu);
                        currentSize++;
                    }
                }
            }
        }

        // 把子菜单的子菜单再循环一遍
        secondChild:
        for (CmsSelfMenuEditModel menu : childList) {// 没有url子菜单还有子菜单
            // 递归
            if (menu.getIsCustomPage() !=null && 1 != menu.getIsCustomPage())
            menu.setCmsSelfMenuEditModelList(getEditChild(menu.getId(), allMenuDates, currentSize, totalSize));
        }

        // 递归退出条件
        if (childList.size() == 0) {
            return null;
        }
        return childList;
    }

}
