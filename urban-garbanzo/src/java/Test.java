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
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.Stack;
import org.apache.tomcat.util.digester.ArrayStack;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

class Test {
    
    static void aaa(byte b) {}
    static int get5() {
        return 5;
    }
    static int aaa2(byte b) {return 6;}
    static void bbb(float f) {}
    //static void ccc(int d) { System.out.println("ccc int");}
    //static void ccc(short d) { System.out.println("ccc short");}
    //static void ccc(double d) { System.out.println("ccc double");}
    static void ccc(float f) { System.out.println("ccc float");}
    
    public static final void main(String args[]) {
LocalDate localDate = LocalDate.now();

DateTimeFormatter f = DateTimeFormatter
    .ofLocalizedDateTime(FormatStyle.SHORT);

//System.out.println(f.format(localDate));

LocalDateTime ldt = LocalDateTime.now();
DateTimeFormatter dtf = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM);
System.out.println(ldt.format(dtf));

DateTimeFormatter myFormat = DateTimeFormatter.ofPattern("MMMM");
System.out.println();

Date d = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
System.out.println(sdf.format(d));

byte b = 5;
b = 10*5;
//b = get5();
//b = 100*5;

String s1 = "java";
StringBuilder s2 = new StringBuilder("java");
//if (s1 == s2)
//    System.out.print("1");
if (s1.equals(s2))
    System.out.print("2");

LocalDate date5 = LocalDate.parse("2018-04-30", DateTimeFormatter.ISO_LOCAL_DATE);
date5.plusDays(2);
System.out.println(date5.getYear() + " " + date5.getMonth() + " "
+ date5.getDayOfMonth());









    }
        
        
        
    }
    
