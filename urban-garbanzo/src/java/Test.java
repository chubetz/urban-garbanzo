/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author d.gorshenin
 */
import java.util.Date;

class Test {
    
    static void aaa(byte b) {}
    static void bbb(float f) {}
    //static void ccc(int d) { System.out.println("ccc int");}
    //static void ccc(short d) { System.out.println("ccc short");}
    //static void ccc(double d) { System.out.println("ccc double");}
    static void ccc(float f) { System.out.println("ccc float");}
    
    public static void main(String args[]) {
        //aaa(1);
        //bbb(5.5);
        //byte b = 13;
        
        //ccc(3.5);
        //long max = 3123456789.5;
        
        int i = 1_000_00;
        int j = 01627_3;
        int k = 0XC____AFE;
//        float m = 13.34234;
//        
//        float n = -9.342__3_4f;
//        double o = __190.0;
//        byte p = 198_;
//        double q = 1_00_0_._0_0; // this one compiles
        float r = 1_00_0.5_5_6F; // this one compiles
        
        
    }
    
}