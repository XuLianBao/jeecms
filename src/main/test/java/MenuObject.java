import java.io.Serializable;
import java.util.List;

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
 * @类名：MenuObject
 * @描述：PACKAGE_NAME
 * @创建人 xlb
 * @创建时间 2018/12/28 13:40
 * @Version 1.0
 */
public class MenuObject implements Serializable {
    String path;
    String name;
    List<MenuObject> children;

    String redirect;
    String isParent;
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public List<MenuObject> getChildren() {
        return children;
    }

    public void setChildren(List<MenuObject> children) {
        this.children = children;
    }

    public String getRedirect() {
        return redirect;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }

    public String getIsParent() {
        return isParent;
    }

    public void setIsParent(String isParent) {
        this.isParent = isParent;
    }


    @Override
    public String toString() {
        return "MenuObject{" +
                "path='" + path + '\'' +
                ", name='" + name + '\'' +
                ", children=" + children +
                ", redirect='" + redirect + '\'' +
                ", isParent='" + isParent + '\'' +
                '}';
    }
}
