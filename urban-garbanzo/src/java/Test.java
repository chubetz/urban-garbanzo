/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author d.gorshenin
 */
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

class Test {
    
    static void aaa(byte b) {}
    static int aaa2(byte b) {return 6;}
    static void bbb(float f) {}
    //static void ccc(int d) { System.out.println("ccc int");}
    //static void ccc(short d) { System.out.println("ccc short");}
    //static void ccc(double d) { System.out.println("ccc double");}
    static void ccc(float f) { System.out.println("ccc float");}
    
    public static final void main(String args[]) {
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
        String d,f;
        String d1 = "asd", f1 = "dfg";
        //d = "asd", f = "dfg";
        double ff = 5.6d;
        //long dd = 454.90L;
        Map<Integer, Boolean> mmm= new HashMap<Integer, Boolean>();
        mmm.put(0, false);
        mmm.put(1, true);
        mmm.put(2, true);
        boolean b0 = mmm.get(0), b1 = mmm.get(1), b2 = mmm.get(2);
        System.out.println(b0);
        System.out.println(Boolean.FALSE);
        //System.out.println(mmm.get(2));
        int папуся = 4;
        
        SimpleDateFormat form = new SimpleDateFormat("'TIMESTAMP' ''yyyy-MM-dd HH:mm:ss''");
        System.out.println(form.format(new Date()));
        
        char c = 'b';
        //c+=22222222;
        hhh : System.out.println(--c);
            
        
        label: {
            System.out.println(44444);
            System.out.println(55555);
            
            inner_label : {
                //break label;
            }
            label1 : switch (c) {
                case 'g':
                    break label1;
            }
         }
        

        
        label2 : if (true) {
            break label2;
        }
        
        byte bb = (byte)129;
        System.out.println(bb);
        
        bb = 127;
        bb += 10;
        System.out.println(bb);
        
        int hourOfDay = 9;
        
        eee : if(hourOfDay < 15) {
            ggg: System.out.println("Good Afternoon");
        } else if(hourOfDay < 11) {
        System.out.println("Good Morning"); // UNREACHABLE CODE
        } else {
        System.out.println("Good Evening");
        }        
        
        int tt = 9;
        
        final int ccc = 6;
        
        switch (new Integer(4)) {
            case ccc:
                break;
        }
        
        int h=5,l=0;
        byte ww = 0;
        for(h=0,ww=0;;h = l+1) {
            System.out.println(h);
            break;
        }
        
        String[] names = new String[1];
        ddd : for(String name : names) {
            System.out.print(name + ", ");
        }        
        
    }
    
}