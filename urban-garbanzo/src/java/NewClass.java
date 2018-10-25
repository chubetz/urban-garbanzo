/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author d.gorshenin
 */
public class NewClass {
    
    static int id2() {return 0;}
    
    static int id3;
    
    int id=0;
    
    String getStr() {
        return "Father";
    }
    String who() {
        return  getStr() + id;
    }
    
}


class NewClassChild extends NewClass {
    
    private static int id3;

    int id=1;
    String getStr() {
        return "Child";
    }
    static int id2() {return 1;}

}

class NewClassVnuk extends NewClassChild {
    String getStr() {
        return super.getStr();
    }
    
    int id=2;
    
        static int id2() {return 2;}

    public static void main (String... aaa) {
        NewClassChild father = new NewClassVnuk();
        System.out.println(father.who());
        System.out.println(father.id);
        System.out.println(father.id2());
    }

}

//abstract class GrandVnuk {
//    abstract static int getId();
//}
