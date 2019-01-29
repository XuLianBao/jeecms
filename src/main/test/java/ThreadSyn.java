/**
 * @类名：ThreadSyn
 * @描述：PACKAGE_NAME
 * @创建人 xlb
 * @创建时间 2019/1/24 9:54
 * @Version 1.0
 */
public class ThreadSyn {

    String name;

    public ThreadSyn(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

   public final synchronized void  print() {
            while (true) {
                try {
                    System.out.println(this.getName());
                    wait(0);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
   }
}
