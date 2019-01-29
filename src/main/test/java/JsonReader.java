import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;

import net.sf.json.groovy.GJson;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
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
 * @类名：JsonReader
 * @描述：PACKAGE_NAME
 * @创建人 xlb
 * @创建时间 2018/12/28 13:34
 * @Version 1.0
 */
public class JsonReader {
    public static void main(String[] args) {
        Gson gson = new Gson();
        StringBuffer jsonString = getSTr();
        List<String> stringList = gson.fromJson(jsonString.toString(), new TypeToken<List<String>>() {}.getType());
      for(String t:stringList){
          System.out.println(t);
      }

    }
    
    public static StringBuffer getSTr(){
        StringBuffer stringBuffer = new StringBuffer();
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(new File("E:\\menHU\\menhu\\src\\main\\webapp\\jeeadmin\\jeecms\\static\\js\\indexWorkPaltForm"))));
            String temp;
            while ((temp=reader.readLine()) !=null){
                stringBuffer.append(temp);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return  stringBuffer;
    }
}
