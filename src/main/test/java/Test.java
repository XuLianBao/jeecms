/**
 * @类名：Tesr
 * @描述：PACKAGE_NAME
 * @创建人 xlb
 * @创建时间 2019/1/11 14:21
 * @Version 1.0
 */
public class Test {
    public static void main(String[] args) throws InterruptedException {
      Thread th = new Thread(new Runnable() {
          @Override
          public void run() {
              new ThreadSyn("1").print();
          }
      });
      th.setName("1");

        Thread th2 = new Thread(new Runnable() {
            @Override
            public void run() {
                new ThreadSyn("2").print();
            }
        });

        th2.setName("2");
        th2.start();
        th2.join();
        th.start();
        th.join();
    }
}
