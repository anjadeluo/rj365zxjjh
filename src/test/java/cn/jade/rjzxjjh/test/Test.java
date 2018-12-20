package cn.jade.rjzxjjh.test;

public class Test {

    @org.junit.Test
    public void test1(){
        int x = 25, y = 9, temp = 9;
        for (int i=0;i<y;i++) {
//            i=0, 6;
//            i=1, 5
//            i=2, 4
//            i=3, 3
//            i=4, 2
//            i=5, 1
//            i=6, 0
            for (int j=0;j<x;j++) {
                if (j >= (temp - i) && j < (y + temp - i)) {
                    System.out.print(" * ");
                } else {
                    System.out.print("   ");
                }
            }
            System.out.println();
        }
    }
}
