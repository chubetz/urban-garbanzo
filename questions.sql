DROP TABLE Realm IF EXISTS;
CREATE TABLE Realm (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, text VARCHAR(20), description VARCHAR(2000));
DROP TABLE Theme IF EXISTS;
CREATE TABLE Theme (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, realmId int, text VARCHAR(2000), number DOUBLE);
DROP TABLE Question IF EXISTS;
CREATE TABLE Question (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, realmId int, type int, text VARCHAR(2000));
	DROP TABLE Answer IF EXISTS;
	CREATE TABLE Answer (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, questionId int, correct boolean, text VARCHAR(2000), comment VARCHAR(2000));
DROP TABLE ThemeQuestion IF EXISTS;
CREATE TABLE ThemeQuestion (themeId int, questionId int, PRIMARY KEY(themeId, questionId));
DROP TABLE Image IF EXISTS;
CREATE TABLE Image (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, filename VARCHAR(2000), extension VARCHAR(10));
DROP TABLE UserAnswer IF EXISTS;
CREATE TABLE UserAnswer (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, questionId int, correct boolean);
DROP TABLE ThemeExam IF EXISTS;
CREATE TABLE ThemeExam (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, themeId int, percentage DOUBLE, date TIMESTAMP);
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (0,'java','Java');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (1,'kotlin','Kotlin');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (2,'sql','SQL');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (3,'minecraft','MINECRAFT');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (4,'oca_1','Сертификат OCA');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (5,'test','ТЕСТ');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (6,'common','Общие вопросы');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (7,'history','История');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (8,'ocp','Сертификат OCP');
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (0,4,'Основы',1.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (1,4,'Особенности экзамена',0.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (2,4,'Задания к теме',1.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (3,0,'вавап',4.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (4,0,'К собеседованию',100.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (5,4,'Пополняемые тесты',0.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (6,4,'Операторы и управляющие конструкции',2.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (7,4,'Задания к теме',2.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (8,4,'Основной API Java',3.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (9,0,'Это должен знать каждый',1.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (10,4,'Задания к теме',3.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (11,4,'Методы и инкапсуляция',4.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (12,4,'Задания к теме',4.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (13,4,'Дизайн классов',5.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (14,4,'Задания к теме',5.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (15,4,'Исключения',6.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (16,4,'Задания к теме',6.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (17,8,'Расширенный дизайн классов',1.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (18,0,'Полезные рецепты',0.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (19,8,'Задания к теме',1.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (20,8,'Шаблоны и принципы проектирования',2.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (21,8,'Задания к теме',2.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (22,8,'Дженерики и коллекции',3.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (23,8,'Особенности экзамена',0.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (24,8,'Задания к теме',3.1);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (25,8,'Функциональное программирование',4.0);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (0,4,0,'Тесты экзамена предполагают обычно 5 или 6 ответов, со множественным выбором.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (1,4,0,'Нельзя реализовать в классе два интерфейса с общим дефолтным методом, если не переопределить этот метод в классе.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (2,4,2,'<p>Перечислите 3 вида комментариев в Java</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (79,2,'<p>1. Комменарий до конца строки:<br />// comment until end of line<br />2. Многострочный комментарий (звездочки на промежуточных строках необязательны):<br />/*&nbsp; Multiple<br />[*] line<br />comment */<br />3. Комментарий Javadoc<br />/**<br />[*] Javadoc multiple-line comment<br />[*] @author Jeanne and Scott<br />*/</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (3,4,0,'Особенности комментариев. <br />- Любые символы между /* и */ - часть многострочного комментария <br />- Любые символы после // - часть однострочного комментария <br />- Вкладывать многострочные комментарии друг в друга нельзя - компилятор реагирует на первый закрывающий, и последующие закрывающие остаются неинтерпретируемыми:<br />/* * /* ferret */ */ (для компилятора то же самое, что просто */)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (4,4,0,'В одном файле может быть определено несколько классов. Только один из них может быть объявлен как <strong>public</strong>, и в этом случае имя файла должно совпадать с именем класса.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (5,7,1,'В каком веке родился <strong>Александр</strong> Македонский?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (75,5,'III до н.э.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (76,5,'II н.э.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (77,5,'II до н.э.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (78,5,'XX век',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (6,4,2,'Как скомпилировать и запустить java-файл из командной строки?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (80,6,'$ javac Zoo.java <br />$ java Zoo',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (7,4,0,'Очень полезно следовать следующим правилам именования: <br />1. Один файл - один класс <br />2. Имя класса = имя файла');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (8,4,0,'Если в классе <strong>Test.java</strong> нет <strong>static</strong>-метода <em>main</em>(), то при попытке запуска <strong>Test.class</strong> будет ошибка (например, <em>Main method not found in class...</em>).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (9,2,0,'Какой оператор1?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (65,9,'SELECT FROM',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (66,9,'GOPRKD',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (67,9,'UPDATE SET',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (10,4,2,'Как можно корректно задать строковый параметр метода <em>main()?</em>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (81,10,'String[] args<br />String args[]<br />String... args',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (11,4,1,'Сколько wildcard-звездочек может быть в строке импорта?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (83,11,'Сколько угодно:<br /><strong>import java.nio.*.*;</strong>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (84,11,'Только одна, в любом месте импорта:<br /><strong>import java.nio.*.Files;</strong>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (85,11,'Только одна,&nbsp;в конце импорта:<br /><strong>import java.nio.file.*;</strong>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (12,4,2,'Как задать строковые параметры при старте программы из командной строки?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (82,12,'$ javac Zoo.java<br />$ java Zoo Bronx Сat<br />$ java Zoo "San Diego" Gon',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (13,4,2,'Может ли обычный импорт импортировать методы и поля класса?<br /><strong>import java.nio.files.Paths.*;</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (86,13,'Нет.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (14,4,0,'<p>Прямой импорт нескольких классов с одинаковыми именами не скомпилируется:<br />import java.util.<strong>Date;</strong><br />import java.sql.<strong>Date; </strong>// <em>DOES NOT COMPILE</em><br /><br />Импорт с wildcald скомпилируется:<br />import java.util.*;<br />import java.sql.*;<br />...<br /><em>но если в коде будет ссылка на тип, который есть в обоих пакетах, также будет ошибка:</em><br />...<br />public class Test {<br />&nbsp;&nbsp;&nbsp; Date date; // <em>DOES NOT COMPILE</em><br />}</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (15,3,1,'Minecraft - это очень классная игра?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (7,15,'Да',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (8,15,'Нет',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (9,15,'Конечно',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (16,4,2,'<p>Почему<br /><em><br />import java.util.Date;</em><br /><em>import java.sql.Date;</em><br /><br />не скомпилируется, а <br /><em><br />import java.util.*;<br /></em><em>import java.sql.Date;<br /><br /></em>скомпилируется?<br /><br /></p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (12,16,'<p>Потому что эксплицитное указание имени класса имеет преимущество над любым wildcard-выражением.</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (17,4,2,'<p>Как быть, если в коде одновременно нужно использовать классы с одинаковым именем из разных пакетов?</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (14,17,'<p>Использовать полное (fully qualified) имя класса.</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (18,4,0,'Classpath можно задать в командной строке:<br /><br />1. Windows<br /><br />java -cp ".;C:\temp\someOtherLocation;c:\temp\myJar.jar" myPackage.MyClass<br /><br />2. Linux<br /><br />java -cp ".:/tmp/someOtherLocation:/tmp/myJar.jar" myPackage.MyClass<br /><br />. (точка) означает, что текущая папка включается в Classpath. <br /><br />Можно использовать wildcard, чтобы включить все jar-файлы в конкретной папке:<br /><br />java -cp "C:\temp\directoryWithJars\*" myPackage.MyClass');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (19,4,1,'Отметьте фрагменты кода, которые скомпилируются.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (19,19,'6: public void method(ArrayList list) {<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (list.isEmpty()) { System.out.println("e");<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else { System.out.println("n");<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (22,19,'1: public class LineNumbers {<br />2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void method(ArrayList list) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (list.isEmpty()) { System.out.println("e");<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else { System.out.println("n");<br />5:&nbsp;&nbsp;&nbsp;&nbsp; } } }',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (20,4,2,'<p>Может ли имя метода совпадать с именем конструктора (класса).</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (57,20,'<p>Да</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (21,4,0,'<strong>Указания по запуску классов в пакетах из командной строки.</strong><br /><br />Пусть есть два класса:<br /><br />C:\temp\packagea\<strong>ClassA</strong>.java<br /><em>package packagea;</em><br /><em>public class ClassA {</em><br /><em>}</em><br /><br />C:\temp\packageb\<strong>ClassB</strong>.java<br /><br />package packageb;<br />import packagea.ClassA;<br />public class ClassB {<br />&nbsp;public static void main(String[] args) {<br />&nbsp;&nbsp;ClassA a;<br />&nbsp;&nbsp;System.out.println("Got it");<br />&nbsp;}<br />}<br /><br />Для компиляции:<br /><br /><em>cd c:\temp</em><br /><em>javac packagea/ClassA.java packageb/ClassB.java</em><br /><br />Для запуска:<br /><br /><em>java packageb.ClassB<br /><br /></em>ClassPath будет отсчитываться от папки вызова java-утилит');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (22,4,0,'<p>Порядок определения членов класса важен!<br /><br />public class Name {<br />&nbsp;&nbsp;&nbsp; String first = "Theodore";<br />&nbsp;&nbsp;&nbsp; String last = "Moose";<br />&nbsp;&nbsp;&nbsp; String full = first + last;<br />}<br /><br /></p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (23,4,0,'Если пакет не указан, то говорят о пакете по умолчанию (<em>default package</em>). Создавать классы в пакете по умолчанию следует только для тестовых и отладочных целей.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (24,4,0,'Основная цель конструктора - инициализация полей класса.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (25,6,1,'Что такое Apple?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (32,25,'Это бренд техники.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (33,25,'Это операционная система.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (30,25,'Это телефоны.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (31,25,'Это яблоко.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (26,6,1,'Как правильно пишется слово ш..колад?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (34,26,'Шакалад',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (35,26,'Шоколад',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (36,26,'Шиколад',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (59,26,'Шуколад',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (27,4,0,'Блок кода (<em>code block</em>) - код в фигурных скобках.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (28,4,0,'Если в вопросе экзамена не идет речь об импорте, строки импорта могут быть опущены, но подразумевается, что они есть (нумерация строк не начинается с единицы).<br /><br />Аналогичным образом отсутствие метода <em>main()</em> не является признаком ошибочности - он так же опускается.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (29,4,0,'Инициализатор экземпляра (<em>instance initializer</em>) может быть только один в классе.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (30,4,2,'Каков порядок выполнения кода в классе?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (40,30,'* Поля и инициализатор экземпляра выполняются в том порядке, в каком они идут в файле.<br />* Конструктор выполняется после всех полей&nbsp;экземпляра и инициализатора экземпляра.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (31,4,2,'<p>Скомпилируется ли следующий код?<br /><br />class Clazz {<br />&nbsp;{ System.out.println(name); }<br />&nbsp;private String name = "Fluffy";<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (43,31,'<p>Нет. Нельзя ссылаться на переменную, которая еще не инициализирована.</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (32,4,0,'<p>Все в Java сводитсяк 8 примитивным типам данных, т.к. объектные типы сводятся к набору примитивных.</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (33,4,2,'Перечислите примитивные типы данных в Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (50,33,'boolean, byte, short, int, long, float, double, char',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (34,4,0,'Названия пакетов подчиняются тем же правилам именования, что и переменные.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (35,4,2,'Назовите разрядность и диапазон типа <strong>int</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (52,35,'<p>32 бит, [-2 147 483 648, 2 147 483 647]</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (36,4,1,'Что будет напечатано после выполнения следующего кода?<br /><br />public class Egg {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public Egg() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; number = 5;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Egg egg = new Egg();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(egg.number);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; private int number = 3;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { number = 4; } <br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (53,36,'<p>3</p>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (54,36,'<p>4</p>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (55,36,'<p>5</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (37,4,2,'Назовите разрядность и диапазон типа <strong>byte</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (87,37,'8 бит, [-128,&nbsp;127]',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (38,4,2,'Назовите разрядность и диапазон типа <strong>long</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (64,38,'<p>64 бит, [-9 223 372 036 854 775 808, 9 223 372 036 854 775 807]</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (39,4,2,'Назовите разрядность и диапазон типа <strong>short</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (88,39,'16 бит, [-32 768, 32 767]',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (40,4,2,'Чем конструктор отличается от метода?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (68,40,'у конструктора нет типа возвращаемого значения',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (41,3,1,'Какой дроп у Крипера?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (71,41,'порох',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (72,41,'Фейерверки',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (73,41,'Динамит(ТНТ)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (74,41,'Пластинки',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (42,6,0,'''''''');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (43,4,0,'Wildcard при импорте распространяется только на классы, вложенные пакеты не просматриваются:<br />
<p><strong>import java.nio.*;</strong></p>
не импортирует класс java.nio.file.Files');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (44,4,0,'Чтобы узнать минимальные и максимальные значения примитивных типов данных, можно обратиться к соответствующим константам классов-оберток. Например, <strong>Integer.MAX_VALUE</strong>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (45,4,2,'Приведите примеры&nbsp;числовых десятичных литералов Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (89,45,'<strong>int</strong>: 13244<br /><strong>long</strong>: 565L, 576l<br /><strong>float</strong>: -23.4F, -23.4f, 6F<br /><strong>double</strong>: 9.8, 10D, -11.1d',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (46,4,0,'При присваивании переменным того же типа, но меньшей размерности происходит имплицитный кастинг, если число позволяет, но при передаче в метод, ожидающий меньшей размерности, кастинг потребуется явный:<br />...<br />&nbsp;&nbsp;&nbsp; static void aaa(byte b) {}<br />&nbsp;&nbsp;&nbsp; static void bbb(float f) {}<br />&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp; public static void main(String args[]) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; aaa(1); //DOESNT COMPILE!<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bbb(5.5); //DOESNT COMPILE!<br />&nbsp;&nbsp;&nbsp; }<br />...');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (47,4,0,'Если с целочисленным параметром вызывается метод, для которого есть перезагрузки с float и double - запустится метод с float:<br />...<br />&nbsp;&nbsp;&nbsp; static void ccc(double d) { System.out.println("ccc double");}<br />&nbsp;&nbsp;&nbsp; static void ccc(float f) { System.out.println("ccc float");}<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; public static void main(String args[]) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ccc(6);<br />&nbsp;&nbsp;&nbsp; }<br />...<br />&gt;&gt;&gt; ccc float');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (48,4,0,'Если byte передается в метод, у которого есть перезагрузки с int и short, запустится short:<br />...<br />&nbsp;&nbsp;&nbsp; static void ccc(int d) { System.out.println("ccc int");}<br />&nbsp;&nbsp;&nbsp; static void ccc(short d) { System.out.println("ccc short");}<br />&nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp; public static void main(String args[]) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; byte b = 6;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ccc(b);<br />&nbsp;&nbsp;&nbsp; }<br />...<br />&gt;&gt;&gt; ccc short');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (49,4,0,'Возможно присваивать&nbsp;числовой литерал переменным меньшей размерности (short, byte) - при условии, что&nbsp;допустим имплицитный кастинг:<br />byte b = 13;<br />byte c = 133; //DOESN''T COMPILE<br /><br />Однако при передаче целочисленного литерала в метод, который принимает параметр меньшей размерности, требуется явный кастинг:<br /><br />&nbsp;&nbsp;&nbsp; static void ccc(short d) { }<br /><br />&nbsp;&nbsp;&nbsp; public static void main(String args[]) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ccc(3);&nbsp;//DOESN''T COMPILE<br />&nbsp;&nbsp;&nbsp; }');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (50,4,0,'Литерал double нельзя присвоить переменной float.<br /><br />float b = 13.8; //DOESN''T COMPILE<br /><br />Также&nbsp;для передачи double-литерала в метод, который принимает параметр float, потребуется явный кастинг:<br /><br />&nbsp;&nbsp;&nbsp; static void ccc(float f) { }<br /><br />&nbsp;&nbsp;&nbsp; public static void main(String args[]) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ccc(3.5);&nbsp;//DOESN''T COMPILE<br />&nbsp;&nbsp;&nbsp; }');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (51,4,1,'Какие строки из перечисленных скомпилируются?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (90,51,'long max = 3123456789;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (91,51,'long max = 3123456789.5;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (92,51,'long max = 3123456789L;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (93,51,'long max = 3123456789l;',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (52,4,2,'Перечислите недесятичные числовые литералы в Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (94,52,'1. Восьмеричный (<em>octal</em>) - с префиксом "0": <strong>017</strong><br />2. Шестнадцатиричный (<em>hexadecimal</em>) - с префиксом "0x" или "0X": <strong>0xFF<br /></strong>3. Двоичный (<em>binary</em>):&nbsp; - с префиксом "0b" или "0B": <strong>0b10</strong>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (53,4,0,'В Java 7 добавлена возможность задавать разделитель разрядов в литералах: 1_000_000. Разделитель можно использовать везде, кроме<br />- начала литерала;<br />- конца литерала;<br />- перед десятичной точкой;<br />- после десятичной точки.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (54,4,1,'Какие присваивания литералов скомпилируются корректно?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (96,54,'int j = 01627_3;',true,'восьмеричный&nbsp;литерал с корректным разделителем разрядов');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (97,54,'int k = 0XC____AFE;',true,'шестнадцатиричный&nbsp;литерал с корректным разделителем разрядов');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (98,54,'float m = 13.34234;',false,'Попытка присвоить double-литерал float-переменной');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (99,54,'float n = -9.342__3_4f;',true,'float-литерал с корректным разделителем разрядов');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (100,54,'double o = __190.0;',false,'разделитель разрядов не может быть в начале литерала');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (101,54,'byte p = 198_;',false,'- разделитель разрядов не может быть в&nbsp;конце литерала<br />- 198 находится за пределами диапазона byte');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (102,54,'double q = 1_00_0_._0_0;',false,'разделитель разрядов не может быть перед или после десятичной точки');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (103,54,'float r = 1_00_0.5_5_6F;',true,'float-литерал с корректным (хоть и странным) использованием разделителя разрядов');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (95,54,'int i = 1_000_00;',true,'целочисленный литерал с корректным разделителем разрядов');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (55,4,0,'Примитивным типам нельзя присваивать <strong>null</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (56,4,0,'Можно объявлять и инициализировать несколько переменных <strong>одного типа</strong> в одном выражении:<br />String s3 = "yes", s4 = "no";');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (57,4,1,'Выберите строки, которые скомпилируются.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (112,57,'int i1; int i2;',true,'в одной строке может быть несколько отдельных выражений, разделенных точкой с запятой');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (104,57,'String d, f;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (105,57,'<div>String d1, f1;</div>
<div>d1 = "asd", f1 = "dfg";</div>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (106,57,'<div>String d1 = "asd", f1 = "dfg";</div>
<div>&nbsp;</div>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (107,57,'String s1, s2, s3="ext";',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (109,57,'int num, String value;',false,'разные типы объявляемых переменных;&nbsp;<span style="line-height: 18.2000007629395px;">более одного раза упоминается тип</span>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (110,57,'String s1 = "1", s2;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (111,57,'<div>double d1, double d2;</div>
<div>&nbsp;</div>',false,'<span style="line-height: 18.2000007629395px;">более одного раза упоминается тип</span>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (58,4,2,'Сколько переменных объявлено и инициализировано в следующем фрагменте кода?<br /><br />int i1, i2, i3 = 0;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (108,58,'Одна переменная объявлена и инициализирована (i3), другие две (i1 и i2) - только объявлены',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (59,4,0,'Именование переменных, методов, классов, полей в Java подчиняется одним и тем же правилам.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (60,4,2,'Назовите три правила корректного именования идентификаторов в Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (113,60,'- Первым символом имени должна быть буква или символ <strong>$</strong> или <strong>_</strong>;<br />- Последующими символами могут быть цифрами;<br />- Нельзя использовать в качестве имени зарезервированное слово (keyword).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (61,4,0,'<strong>const</strong> и <strong>goto</strong> - зарезервированные слова в Java, но в языке они не используются');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (62,4,2,'Перечислите ключевые слова Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (114,62,'abstract assert boolean break <br />byte case catch <br />char class const<br />continue default do <br />double else enum extends <br />false final finally float <br />for goto if <br />implements import instanceof <br />int interface long native <br />new null package <br />private protected public <br />return short static<br />strictfp super switch <br />synchronized this throw <br />throws transient true try<br />void volatile while',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (63,4,1,'Отметьте корректные идентификаторы.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (115,63,'<p>cjslidjnekfyud</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (116,63,'$kcLDKfo8fid',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (117,63,'_Ov9dloDof9',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (118,63,'__DLFkd9FioD4$$',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (119,63,'<p>6TCjjdKc</p>',false,'Идентификатор не может начинаться с номера');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (120,63,'<p>vjdkslk@fudi</p>',false,'@ - не входит в число допустимых символов');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (121,63,'<p>*$cioduff</p>',false,'*&nbsp;- не входит в число допустимых символов');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (122,63,'public',false,'ключевое слово');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (64,4,0,'На экзамене имеет смысл проверять корректность идентификаторов. Если имя идентификатора не соответствует правилам, можно сразу выбирать пункт "Doesn''t not compile".<br /><br />Также следует проверить области видимости переменных, чтобы не думать над отвлекающим сложным вопросом, а сразу отвечать "Doesn''t compile"');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (65,0,0,'В идентификаторах Java могут использоваться все буквы Unicode (~45000 штук), а также несколько сотен не-арабских цифр.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (66,4,1,'Какие фрагменты кода из нижеперечисленных скомпилируются?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (128,66,'<p>public class Mouse {<br />&nbsp;static int MAX_LENGTH = 5;<br />&nbsp;int length;</p>
<p>&nbsp;public void grow(int inches) {<br />&nbsp;&nbsp;if (length &lt; MAX_LENGTH) {<br />&nbsp;&nbsp;&nbsp;int newSize = length + inches;<br />&nbsp;&nbsp;&nbsp;length = newSize;<br />&nbsp;&nbsp;}<br />&nbsp;}<br />}</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (123,66,'4: public int notValid() {<br />5:&nbsp;&nbsp; int y = 10;<br />6:&nbsp;&nbsp; int x;<br />7:&nbsp;&nbsp; int reply = x + y; // DOES NOT COMPILE<br />8:&nbsp;&nbsp; return reply;<br />9: }',false,'Не инициализирована переменная <strong>x</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (124,66,'public int valid() {<br />&nbsp; int y = 10;<br />&nbsp; int x;&nbsp;<br />&nbsp; x = 3;<br />&nbsp; int reply = x + y;<br />&nbsp; return reply;<br />}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (125,66,'public void findAnswer(boolean check) {<br />&nbsp;int answer;<br />&nbsp;int onlyOneBranch;<br />&nbsp;if (check) {<br />&nbsp;&nbsp;onlyOneBranch = 1;<br />&nbsp;&nbsp;answer = 1;<br />&nbsp;} else {<br />&nbsp;&nbsp;answer = 2;<br />&nbsp;}<br />&nbsp;System.out.println(answer);<br />&nbsp;System.out.println(onlyOneBranch);<br />}',false,'Переменная <strong>onlyOneBranch</strong> может оказаться неинициализорованной в случае check==false');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (127,66,'public void eatIfHungry(boolean hungry) {<br />&nbsp;if (hungry) {<br />&nbsp;&nbsp;int bitesOfCheese = 1;<br />&nbsp;&nbsp;{<br />&nbsp;&nbsp;&nbsp;boolean teenyBit = true;<br />&nbsp;&nbsp;&nbsp;System.out.println(bitesOfCheese);<br />&nbsp;&nbsp;}<br />&nbsp;}<br />&nbsp;System.out.println(teenyBit);<br />}',false,'Переменная <strong>teenyBit</strong> не видна за пределами своего блока.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (67,4,2,'Назовите все значения по умолчанию для переменных разных типов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (126,67,'<strong>boolean: <em>false</em><br />byte, short, int, long: </strong><strong><em>0<br /></em>float, double: <em>0.0</em><br />char: </strong><strong><em>''\u0000''</em><br /></strong><strong>Объектные: <em>null</em></strong>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (68,4,0,'<p>Во фрагменте</p>
<p>&nbsp;public void eat(int piecesOfCheese) {<br />&nbsp;&nbsp;int bitesOfCheese = 1;<br />&nbsp;}</p>
<p>ровно две локальные переменные.</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (69,4,0,'Комментарии могут располагаться в любом месте кода');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (70,4,2,'Укажите основные элементы файла с java-программой и их расположение друг отностительно друга.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (129,70,'<strong>Объявление пакета</strong>: первая строка<br /><strong>Объявление импорта</strong>:&nbsp; сразу после объявления пакета<br /><strong>Объявление класса</strong>:&nbsp; сразу после объявления импорта<br /><strong>Объявление поля класса</strong>: в любом месте внутри класса, но не внутри вложенных блоков<br /><strong>Объявление&nbsp;метода класса</strong>: в любом месте внутри класса, но не внутри вложенных блоков',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (71,4,0,'В одном&nbsp;файле может быть объявлено несколько классов, но только один из них может быть <strong>public</strong>, причем в этом случае имя файла должно совпадать с именем класса. В файле может и не быть public-классов.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (72,4,0,'Метод <strong>System.gc()</strong> не запускает сборку мусора, а только рекомендует виртуальной машине ее запустить. Рекомендация может быть проигнорирована.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (73,4,0,'Отвечать на вопрос на тему сборки мусора лучше всего с карандашом и бумагой - если искать решение в уме, то легко ошибиться.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (74,4,2,'Какие объекты и в какой момент станут доступны для сборщика мусора?<br /><br />1: public class Scope {<br />2: &nbsp;public static void main(String[] args) {<br />3: &nbsp;&nbsp;String one, two;<br />4: &nbsp;&nbsp;one = new String("a");<br />5: &nbsp;&nbsp;two = new String("b");<br />6: &nbsp;&nbsp;one = two;<br />7: &nbsp;&nbsp;String three = one;<br />8: &nbsp;&nbsp;one = null;<br />9: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (130,74,'"a" - после строки 6;<br />"b" - после отработки всего метода.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (75,4,0,'Метод <strong>finalize()</strong> вызывается у объекта, когда он попадает в сборку мусора, причем если произошел сбой в работе gc и объект уничтожается повторно спустя некоторе время, вызов метода происходит только единожды - при первой попытке удаления. Таким образом, метод finalize() лучше не использовать, полагаться на него нельзя: либо он вообще не вызовется (JVM не сочтет необходимым вызывать gc), либо вызовется некорректно.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (76,4,0,'<p>Категорически нельзя делать следующее:</p>
<p>public class Finalizer {<br />&nbsp;private static List objects = new ArrayList();<br />&nbsp;protected void finalize() {<br />&nbsp;&nbsp;objects.add(this); // Don''t do this<br />&nbsp;} <br />}</p>
<p>При первой попытке удаления JVM поймет, что в статической переменной осталась ссылка на объект, и не удалит его. При повторном удалении (например, когда Finalizer.objects станет null) метод finalize(), в котором может быть какая-то важная логика, просто не будет запущен.</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (77,4,0,'Инкапсуляция - защита данных от нежелательного доступа/модификации.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (78,4,1,'Укажите корректные идентификаторы Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (131,78,'A$B',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (132,78,'_helloWorld',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (133,78,'true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (134,78,'java.lang',false,'в идентификаторах не может использоваться символ "."');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (135,78,'Public',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (136,78,'1980_s',false,'первым символом должна быть буква, $ или _');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (79,4,1,'Каким будет вывод следующей программы?<br /><br />1: public class WaterBottle {<br />2: &nbsp;private String brand;<br />3: &nbsp;private boolean empty;<br />4: &nbsp;&nbsp;public static void main(String[] args) {<br />5: &nbsp;&nbsp;&nbsp;WaterBottle wb = new WaterBottle();<br />6: &nbsp;&nbsp;&nbsp;System.out.print("Empty = " + wb.empty);<br />7: &nbsp;&nbsp;&nbsp;System.out.print(", Brand = " + wb.brand);<br />8: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (137,79,'Ошибка компиляции в строке 6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (138,79,'Ошибка компиляции в строке 7',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (139,79,'Вывода не будет',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (140,79,'Empty = false, Brand = null',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (141,79,'Empty = false, Brand =',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (142,79,'Empty = null, Brand = null',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (80,4,1,'<p>Which of the following are true? (Choose all that apply)</p>
<p>4: short numPets = 5;<br />5: int numGrains = 5.6;<br />6: String name = "Scruffy";<br />7: numPets.length();<br />8: numGrains.length();<br />9: name.length();</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (144,80,'<p>Line 5 generates a compiler error.</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (145,80,'<p>Line 6 generates a compiler error.</p>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (146,80,'<p>Line 7 generates a compiler error.</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (147,80,'<p>Line 8 generates a compiler error.</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (148,80,'<p>Line 9 generates a compiler error.</p>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (149,80,'<p>The code compiles as is.</p>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (143,80,'<p>Line 4 generates a compiler error.</p>',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (81,4,1,'<p>Given the following class, which of the following is true? (Choose all that apply)</p>
1: public class Snake {<br />2:<br />3: &nbsp;public void shed(boolean time) {<br />4:<br />5: &nbsp;&nbsp;if (time) {<br />6:<br />7: &nbsp;&nbsp;}<br />8: &nbsp;&nbsp;System.out.println(result);<br />9:<br />10: }<br />11:}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (150,81,'If String result = "done"; is inserted on line 2, the code will compile.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (151,81,'If String result = "done"; is inserted on line 4, the code will compile.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (152,81,'If String result = "done"; is inserted on line 6, the code will compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (153,81,'If String result = "done"; is inserted on line 9, the code will compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (154,81,'None of the above changes will make the code compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (82,4,1,'<p>Given the following classes, which of the following can independently replace INSERT IMPORTS HERE to make the code compile? (Choose all that apply)<br /><br />package aquarium;<br />public class Tank { }</p>
<p>package aquarium.jellies;<br />public class Jelly { }</p>
<p>package visitor;<br />INSERT IMPORTS HERE<br />public class AquariumVisitor {<br />&nbsp;public void admire(Jelly jelly) { } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (160,82,'None of these can make the code compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (155,82,'import aquarium.*;',false,'импортирует только классы&nbsp;из aquarium, игнорируя aquarium.jellies');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (156,82,'import aquarium.*.Jelly;',false,'неверный импорт: <em>wildcards</em> могут использоваться только в конце строки импорта.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (157,82,'import aquarium.jellies.Jelly;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (158,82,'import aquarium.jellies.*;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (159,82,'import aquarium.jellies.Jelly.*;',false,'неверный импорт: нельзя импортировать члены класса регулярным импортом');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (83,4,1,'<p>Given the following classes, what is the maximum number of imports that can be removed and have the code still compile?<br /><br />package aquarium; public class Water { }</p>
<p>package aquarium;<br />import java.lang.*;<br />import java.lang.System;<br />import aquarium.Water;<br />import aquarium.*;<br />public class Tank {<br />&nbsp;public void print(Water water) {<br />&nbsp;&nbsp;System.out.println(water); } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (161,83,'0',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (162,83,'1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (163,83,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (164,83,'3',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (165,83,'4',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (166,83,'Does not compile',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (84,4,1,'<p>Given the following classes, which of the following snippets can be inserted in place of INSERT IMPORTS HERE and have the code compile? (Choose all that apply)<br /><br />package aquarium;<br />public class Water {<br />&nbsp;boolean salty = false;<br />}</p>
<p>package aquarium.jellies;<br />public class Water {<br />&nbsp;boolean salty = true;<br />}</p>
<p>package employee;<br />INSERT IMPORTS HERE<br />public class WaterFiller {<br />&nbsp;Water water;<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (167,84,'import aquarium.*;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (168,84,'import aquarium.Water;<br />import aquarium.jellies.*;',true,'импорт конкретного класса сильнее импорта с wildcard, поэтому двусмысленности здесь не будет.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (169,84,'import aquarium.*;<br />import aquarium.jellies.Water;',true,'импорт конкретного класса сильнее импорта с wildcard, поэтому двусмысленности здесь не будет.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (170,84,'import aquarium.*;<br />import aquarium.jellies.*;',false,'неопределенность&nbsp;- оба пакета имеют класс Water');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (171,84,'import aquarium.Water;<br />import aquarium.jellies.Water;',false,'компилятор не поймет, какой класс &nbsp;Water использовать');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (172,84,'None of these imports can make the code compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (85,4,1,'Given the following class, which of the following calls print out Blue Jay? (Choose all that apply)<br /><br />public class BirdDisplay {<br />&nbsp;public static void main(String[] name) {<br />&nbsp;&nbsp;System.out.println(name[1]);<br />} }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (176,85,'java BirdDisplay "Blue Jay" Sparrow',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (177,85,'java BirdDisplay.class Sparrow "Blue Jay"',false,'будет выведено Error: Could not find or load main class BirdDisplay.class');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (178,85,'java BirdDisplay.class "Blue Jay" Sparrow',false,'будет выведено Error: Could not find or load main class BirdDisplay.class');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (179,85,'Does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (173,85,'java BirdDisplay Sparrow Blue Jay',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (174,85,'java BirdDisplay Sparrow "Blue Jay"',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (175,85,'java BirdDisplay Blue Jay Sparrow',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (86,4,1,'Which of the following legally fill in the blank so you can run the main() method from the command line? (Choose all that apply)<br /><br />public static void main(_______)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (180,86,'String[] _names',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (181,86,'String[] 123',false,'неверное имя аргумента');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (182,86,'String abc[]',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (183,86,'String _Names[]',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (184,86,'String... $n',true,'varargs допускаются вместо массива');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (185,86,'String names',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (186,86,'None of the above.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (87,4,1,'Which of the following are legal entry point methods that can be run from the command line? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (192,87,'public static main(String[] args)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (193,87,'None of the above',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (187,87,'private static void main(String[] args)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (188,87,'public static final main(String[] args)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (189,87,'public void main(String[] args)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (190,87,'public static void test(String[] args)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (191,87,'public static void main(String[] args)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (88,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (194,88,'An instance variable of type double defaults to null.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (195,88,'An instance variable of type int defaults to null.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (196,88,'An instance variable of type String defaults to null.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (197,88,'An instance variable of type double defaults to 0.0.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (198,88,'An instance variable of type int defaults to 0.0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (199,88,'An instance variable of type String defaults to 0.0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (200,88,'None of all.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (89,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (201,89,'A local variable of type boolean defaults to null.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (202,89,'A local variable of type float defaults to 0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (203,89,'A local variable of type Object defaults to null.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (204,89,'A local variable of type boolean defaults to false.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (205,89,'A local variable of type boolean defaults to true.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (206,89,'A local variable of type float defaults to 0.0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (207,89,'None of all.',true,'У локальных переменных не бывает значений по умолчанию.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (90,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (208,90,'An instance variable of type boolean defaults to false.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (209,90,'An instance variable of type boolean defaults to true.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (210,90,'An instance variable of type boolean defaults to null.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (211,90,'An instance variable of type int defaults to 0.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (212,90,'An instance variable of type int defaults to 0.0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (213,90,'An instance variable of type int defaults to null.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (214,90,'None of the above.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (91,4,1,'Given the following class in the file /my/directory/named/A/Bird.java:<br />INSERT CODE HERE<br />public class Bird { }<br /><br />Which of the following replaces INSERT CODE HERE if we compile from /my/directory? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (215,91,'package my.directory.named.a;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (216,91,'package my.directory.named.A;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (217,91,'package named.a;',false,'неверно, так как имена пакетов, как и все прочие идентификаторы, являются чувствительными к регистру');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (218,91,'package named.A;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (219,91,'package a;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (220,91,'package A;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (221,91,'Does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (92,4,1,'Which of the following lines of code compile? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (224,92,'double d2 = 1_234._0;',false,'подчеркивания разрешены только между цифрами');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (225,92,'double d3 = 1_234.0_;',false,'подчеркивания разрешены только между цифрами');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (226,92,'double d4 = 1_234.0;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (227,92,'None of all.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (222,92,'int i1 = 1_234;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (223,92,'double d1 = 1_234_.0;',false,'подчеркивания разрешены только между цифрами');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (93,4,1,'<p>Given the following class, which of the following lines of code can replace INSERT CODE HERE to make the code compile? (Choose all that apply)</p>
<p>public class Price {<br />&nbsp;public void admission() {<br />&nbsp;&nbsp;INSERT CODE HERE<br />&nbsp;&nbsp;System.out.println(amount);<br />&nbsp;} }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (228,93,'int amount = 9L;',false,'присваивание int-переменной double-значения');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (229,93,'int amount = 0b101;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (230,93,'int amount = 0xE;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (231,93,'double amount = 0xE;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (232,93,'double amount = 1_2_.0_0;',false,'подчеркивание может быть только между цифрами');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (233,93,'int amount = 1_2_;',false,'подчеркивание может быть только между цифрами');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (234,93,'None of all.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (94,4,1,'<p>Which of the following are true? (Choose all that apply)</p>
<p>public class Bunny {<br />&nbsp;public static void main(String[] args) {<br />&nbsp;&nbsp;Bunny bun = new Bunny();<br />} }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (240,94,'<strong>main</strong> is a reference to an object.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (241,94,'None of all.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (235,94,'<strong>Bunny</strong> is a class.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (236,94,'<strong>bun</strong> is a class.',false,'это переменная');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (237,94,'<strong>main</strong> is a class.',false,'это метод');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (238,94,'<strong>Bunny</strong> is a reference to an object.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (239,94,'<strong>bun</strong> is a reference to an object.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (95,4,1,'<p>Which represent the order in which the following statements can be assembled into a program that will compile successfully? (Choose all that apply)</p>
<p>A: class Rabbit {}<br />B: import java.util.*;<br />C: package animals;</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (242,95,'A, B, C',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (243,95,'B, C, A',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (244,95,'C, B, A',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (245,95,'B, A',true,'строки import и package опциональны');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (246,95,'C, A',true,'строки import и package опциональны');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (247,95,'A, C',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (248,95,'A, B',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (96,4,1,'<p>Suppose we have a class named Rabbit. Which of the following statements are true? (Choose all that apply)</p>
<p>1: public class Rabbit {<br />2: &nbsp;&nbsp;public static void main(String[] args) {<br />3: &nbsp;&nbsp;&nbsp;Rabbit one = new Rabbit();<br />4: &nbsp;&nbsp;&nbsp;Rabbit two = new Rabbit();<br />5: &nbsp;&nbsp;&nbsp;Rabbit three = one;<br />6: &nbsp;&nbsp;&nbsp;one = null;<br />7: &nbsp;&nbsp;&nbsp;Rabbit four = one;<br />8: &nbsp;&nbsp;&nbsp;three = null;<br />9: &nbsp;&nbsp;&nbsp;two = null;<br />10: &nbsp;&nbsp;two = new Rabbit();<br />11: &nbsp;&nbsp;System.gc();<br />12: } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (249,96,'The Rabbit object from line 3 is first eligible for garbage collection immediately following line 6.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (250,96,'The Rabbit object from line 3 is first eligible for garbage collection immediately following line 8.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (251,96,'The Rabbit object from line 3 is first eligible for garbage collection immediately following line 12.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (252,96,'The Rabbit object from line 4 is first eligible for garbage collection immediately following line 9.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (253,96,'The Rabbit object from line 4 is first eligible for garbage collection immediately following line 11.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (254,96,'The Rabbit object from line 4 is first eligible for garbage collection immediately following line 12.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (97,4,1,'<p>What is true about the following code? (Choose all that apply)</p>
<p>public class Bear {<br />&nbsp;protected void finalize() {<br />&nbsp;&nbsp;System.out.println("Roar!");<br />}<br />&nbsp;public static void main(String[] args) {<br />&nbsp;&nbsp;Bear bear = new Bear();<br />&nbsp;&nbsp;bear = null;<br />&nbsp;&nbsp;System.gc();<br />} }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (256,97,'<strong>finalize</strong>() might or might not be called',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (257,97,'<strong>finalize</strong>() is guaranteed not to be called.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (258,97,'Garbage collection is guaranteed to run.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (259,97,'Garbage collection might or might not run.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (260,97,'Garbage collection is guaranteed not to run.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (261,97,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (255,97,'<strong>finalize</strong>() is guaranteed to be called.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (98,4,1,'<p>What does the following code output?</p>
<p>1: public class Salmon {<br />2: &nbsp;&nbsp;int count;<br />3: &nbsp;&nbsp;public void Salmon() {<br />4: &nbsp;&nbsp;&nbsp;count = 4;<br />5: &nbsp;&nbsp;}<br />6: &nbsp;&nbsp;public static void main(String[] args) {<br />7: &nbsp;&nbsp;&nbsp;Salmon s = new Salmon();<br />8: &nbsp;&nbsp;&nbsp;System.out.println(s.count);<br />9: } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (262,98,'0',true,'У этого класса конструктор по умолчанию (а не void Salmon()), поэтому у поля count - значение по умолчанию.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (263,98,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (264,98,'Compilation fails on line 3.',false,'<p>У класса <em>может</em> быть метод, совпадающий по имени с конструктором.</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (265,98,'Compilation fails on line 4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (266,98,'Compilation fails on line 7.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (267,98,'Compilation fails on line 8.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (99,4,1,'Which of the following are true statements? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (272,99,'Java is an object-oriented language.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (273,99,'Java is a functional programming language.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (268,99,'Java allows operator overloading.',false,'Позволяется перезагрузка <strong>методов</strong>, а не <strong>операторов</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (269,99,'Java code compiled on Windows can run on Linux.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (270,99,'Java has pointers to specific locations in memory.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (271,99,'Java is a procedural language.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (100,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (274,100,'<strong>javac</strong> compiles a <strong>.class</strong> file into a <strong>.java</strong> file.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (275,100,'<strong>javac</strong> compiles a <strong>.java</strong> file into a <strong>.bytecode</strong> file.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (276,100,'<strong>javac</strong> compiles a <strong>.java</strong> file into a <strong>.class</strong> file.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (277,100,'Java takes the name of the class as a parameter.',true,'параметр - имя класса, а не имя файла');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (278,100,'Java takes the name of the <strong>.bytecode</strong> file as a parameter.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (279,100,'Java takes the name of the <strong>.class</strong> file as a parameter.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (101,4,0,'В Java имеются унарные, бинарные и тернарные операторы');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (102,4,0,'Если у нескольких рядом стоящих операторов в выражении одинаковый уровень приоритета, то они выполняются слева направо.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (103,4,2,'Назовите операторы Java в порядке убывания приоритета.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (280,103,'1) Постфиксный инкремент и декремент: <strong>expression++, expression--<br /></strong>2) Префиксный инкремент и декремент:<strong> ++expression, --expression</strong><br />3) Прочие унарные операторы:<strong> +</strong>,<strong> -</strong>,<strong> !, ~<br /></strong>4) Умножение/деление/остаток: <strong>*</strong>, <strong>/</strong>, <strong>%<br /></strong>5) Сложение/вычитание: <strong>+</strong>, <strong>-<br /></strong>6) Побитовый сдвиг: <strong>&lt;&lt;</strong>, <strong>&gt;&gt;</strong>, <strong>&gt;&gt;&gt;<br /></strong>7) Сравнение: <strong>&lt;</strong>, <strong>&gt;</strong>, <strong>&lt;=</strong>, <strong>&gt;=</strong>, <strong>instanceof<br /></strong>8) Равенство: <strong>==</strong>, <strong>!=<br /></strong>9) Логические операторы: <strong>&amp;</strong>, <strong>^</strong>, |<br />10) Логические операторы короткого действия: <strong>&amp;&amp;</strong>, <strong>||<br /></strong>11) Тернарный оператор: <strong>boolean expression ? expression1 : expression2<br /></strong>12) Присваивание: =, <strong>+=</strong>, <strong>-=</strong>, <strong>*=</strong>, <strong>/=</strong>, <strong>%=</strong>, <strong>&amp;=</strong>, <strong>^=</strong>, |<strong>=</strong>, <strong>&lt;&lt;=</strong>, <strong>&gt;&gt;=</strong>, <strong>&gt;&gt;&gt;=</strong>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (104,4,2,'Назовите арифметические операторы Java и к каким операндам они применимы');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (281,104,'Сложение +, вычитание -, умножение *, деление /, остаток %.<br />Применинимы ко всем примитивным типам, кроме boolean.<br /><br />+ и += также применимы к String.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (105,4,0,'Остаток (%) можно брать не только от деления положительных целых чисел, но и от отрицательных, а также от вещественных. Например, остаток от деления отрицательного целого <strong>x</strong> на положительное целое <strong>y</strong> лежит в диапазоне (-y +1)..0 (на экзамене OCA I не требуется).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (106,4,2,'Назовите правила имплицитного преобразования типов операндов бинарных операторов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (282,106,'1. Если у двух значений разные типы данных, идет преобразование к большему из типов.<br />2. Если один операнд целочисленный, а второй вещественный, идет преобразование к вещественному.<br />3. byte, short и chart в арифметических выражениях преобразовываются к int.<br />4. Результирующее значение имеет тип данных, к которому были приведены все операнды.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (107,4,1,'Какой тип данных у выражения <strong>x * y</strong>, если<br />int x = 1;<br />long y = 33;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (291,107,'Код не скомпилируется.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (283,107,'int',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (284,107,'long',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (285,107,'double',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (108,4,1,'Какой тип данных у выражения <strong>x + y</strong>, если<br />double x = 39.21;<br />float y = 2.1;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (288,108,'int',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (289,108,'long',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (290,108,'Код не скомпилируется.',true,'Переменной float присваивается литерал double');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (286,108,'double',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (287,108,'float',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (109,4,1,'Какой тип данных у выражения <strong>x / y</strong>, если<br />short x = 10;<br />short y = 3;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (292,109,'short',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (293,109,'int',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (294,109,'long',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (295,109,'float',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (110,4,1,'Какой тип данных у выражения <strong>x * y / z</strong>, если<br />short x = 14;<br />float y = 13;<br />double z = 30;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (296,110,'short',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (297,110,'float',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (298,110,'int',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (299,110,'double',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (300,110,'Код не скомпилируется.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (111,4,2,'Перечислите унарные операторы Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (301,111,'<strong>+</strong> - означает, что число положильное, не оказывает влияния на значение выражения;<br />- - означает, что число отрицательное, меняет знак выражения;<br /><strong>++</strong> - инкремент;<br />-- - декремент;<br /><strong>!</strong> - инвертирует булево значение',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (112,4,0,'Если применить смену знака к <strong>char</strong> (char c = ''f''; someMethod(-f)), то получится <strong>int</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (113,4,0,'Если добавить число к переменной типа <strong>char</strong>, то она будет ссылаться на другой символ Unicode. Но такое добавление может произойти только посредством инкремента/декремента или короткого сложения/вычитания:<br /><br />char x=''A'';<br />x+=1;<br />x++;<br />x = x+1; //DOESN''T COMPILE');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (114,4,2,'Чем отличаются пре-инкремент и пост-инкремент?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (302,114,'Если использовать пре-инкремент в выражении, то значение операнда сначала изменяется, а потом подставляется в выражение. В случае пост-инкремента в выражение подставляется оригинальное значение переменной, и только потом происходит изменение.<br /><strong>Важно</strong>! Если в выражение имеется несколько инкрементов одной переменной, то изменение значения происходит при каждом использовании (до или сразу после подстановки, в зависимости от пре/пост).<br />Если инкремент идет как самостоятельное выражение, то разницы нет.<br />Аналогично для декремента.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (115,4,2,'Укажите, чему равны <strong>x</strong> и <strong>y</strong> после выполнения следующей программы.<br /><br />
<p align="LEFT">int x = 3;</p>
<p align="LEFT">int y = ++x * 5 / x-- + --x;</p>
<p align="LEFT">System.out.println("x is " + x);</p>
<p>System.out.println("y is " + y);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (303,115,'x = 2<br />y = 7',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (116,4,0,'Явный кастинг требуется всегда, когда больший числовой тип присваивается меньшему, или когда вещественный тип присваивается целочисленному.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (117,4,2,'Что такое <strong>overflow</strong> и <strong>underflow</strong> применительно к присваиванию числовых типов?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (304,117,'<em>Overflow</em> происходит, когда большему значению присваивается меньшее (с кастингом либо через короткое сложение/инкремент):<br /><br />byte bb = (byte)129;<br />System.out.println(bb);<br />// -127<br />bb = 127;<br />bb += 10;<br />System.out.println(bb);<br />// -119<br /><br />Также если работаем с int, этот эффект проявляется при сложении литералов:<br />
<p>System.out.print(2147483647+1); // -2147483648</p>
<br />Суть в том, что компилятор "упирается" в верхнюю границу диапазона данного типа и перескакивает к нижней границе, продолжая расчет от нее.<br /><br />Аналогично для <em>underflow</em> и вычитания.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (118,4,0,'Операторы сокращенного присваивания (+=, -=, *= и т.д.) называются <em>compound assignment operators</em>. На экзамене OCA потребуется знание только первых двух.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (119,4,2,'Назовите преимущества операторов сокращенного присваивания.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (305,119,'1) Более удобный синтаксис.<br />2) Не нужно явно указывать кастинг.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (120,4,0,'Присваивание является выражением, имеющим значение:<br /><br />
<p align="LEFT">long x = 5;<br />long y = (x=3);<br />System.out.println(x); // Outputs 3<br />System.out.println(y); // Also, outputs 3</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (121,4,0,'В операторах сравнения (relational operators, &lt;,&lt;=,&gt;,&gt;=) идет преобразование типов аналогично бинарным арифметическим операциях');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (122,4,0,'Оператор <strong>instanceof</strong> тоже считается оператором сравнения (relational).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (123,4,2,'Перечислите логические <span style="text-decoration: underline;">бинарные</span> операторы Java и типы операндов, к которым они применяются.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (306,123,'Логическое "и": &amp;<br />Логическое "или" (включающее, inclusive): <strong>|</strong><br />Логическое "или" (исключающее, exclusive): <strong>^</strong><br /><br />Применяются к булевым операндам, а также к числовым (в этом случае называются <em>bitwise operators</em>, в OCA не рассматриваются)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (124,4,0,'Одно из достоинств условных операторов короткого действия, помимо улучшения производительности, заключается в удобстве проверки на null:<br />if(x != null &amp;&amp; x.getValue() &lt; 5) {<br />&nbsp; // Do something<br />}<br /><br />Если бы в вышеприведенном примере кода использовался обычный оператор &amp;, то выдавалась бы Runtime-ошибка NullPointerException');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (125,4,2,'Каков вывод следующего фрагмента кода:<br /><br />int x = 6;<br />boolean y = (x &gt;= 6) || (++x &lt;= 7);<br />System.out.println(x);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (307,125,'6.&nbsp;&nbsp;Вторая часть выражения не вычисляется, т.к. первая равна true',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (126,4,0,'Операторы проверки равенства (equality operators, !=, ==) ведут к преобразованию числовых операндов аналогично арифметическим бинарным операторам.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (127,4,0,'В операторах проверки равенства нельзя смешивать разные типы операндов. Если сравниваются объекты, то они должны быть из одной иерархии наследования.<br /><br />boolean x = true == 3; // DOES NOT COMPILE<br />boolean y = false != "Giraffe"; // DOES NOT COMPILE<br />boolean z = 3 == "Kangaroo"; // DOES NOT COMPILE<br /><br />String s1 = "java";<br />StringBuilder s2 = new StringBuilder("java");<br />boolean s = s1 == s2; //DOES NOT COMPILE<br /><br /><br />Следует обращать пристальное внимание на типы данных, когда в экзаменационной задаче присутствует оператор проверки равенства.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (128,4,1,'Какой результат получится в результате выполнения кода:<br /><br />boolean y = false;<br />boolean x = (y = true);<br />System.out.println(x);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (308,128,'true',true,'во второй строке имеет место присваивание y (=), а не проверка равенства (==)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (309,128,'false',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (129,4,2,'Когда сравнение объектов (==) возвращает true?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (310,129,'Тогда и только тогда, когда обе ссылки указывают на один и тот же объект, либо обе ссылки равны null.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (130,4,0,'Инструкция Java (<em>statement</em>) - часть кода, которая заканчивается точкой с запятой <strong>;</strong>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (131,4,0,'На экзамене часто пытаются запутать экзаменуемого отступами. Например, в примере<br /><br />if(hourOfDay &lt; 11)<br />&nbsp; System.out.println("Good Morning");<br />&nbsp;&nbsp;morningGreetingCount++;<br /><br />может показаться, что инкремент выполнится только при выполнении условия, хотя на самом деле он выполняется всегда.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (132,4,2,'Скомпилируется ли следующий код, и если нет, то почему?<br /><br />if(hourOfDay &lt; 15) {<br />&nbsp;System.out.println("Good Afternoon");<br />} else if(hourOfDay &lt; 11) {<br />&nbsp;System.out.println("Good Morning");<br />} else {<br />&nbsp;System.out.println("Good Evening");<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (311,132,'Скомпилируется. Несмотря на то, что условие во втором if никогда не выполнится (оно поглощено условием в первом if), компилятор не возьмет на себя смелость детектировать недостижимый код.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (133,4,0,'Выражения в тернарном операторе должны возвращать значения:<br /><br />int hourOfDay = 9;<br />System.out.println(hourOfDay &lt; 15 ? 4 : "bbb");<br />System.out.println(hourOfDay &lt; 15 ?&nbsp;System.out.println() : "bbb"); //DOESN''T COMPILE');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (134,4,0,'<p>В тернарном операторе вычисляется только то выражение, которому передается выполнение исходя из условия:<br /><br />int y = 1;<br />int z = 1;<br />final int x = y&lt;10 ? y++ : z++;<br />System.out.println(y+","+z); // Outputs 2,1</p>
<p>int y = 1;<br />int z = 1;<br />final int x = y&gt;=10 ? y++ : z++;<br />System.out.println(y+","+z); // Outputs 1,2</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (135,4,2,'Какие типы допустимы для переменной в конструкции switch?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (312,135,'1) Все целочисленные, кроме long<br />2) Перечислимые<br />3) Строки<br />4) Целочисленные классы обертки, кроме Long',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (136,4,2,'Какие значения могут участвовать в <strong>case</strong>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (313,136,'Только константы, рассчитываемые на этапе компиляции, причем того же типа, что и выражение в switch:<br />1) литералы<br />2) константы перечислимых типов<br />3) константы с&nbsp;модификатором final',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (137,4,0,'final-константа - это переменная с модификатором <strong>final</strong>, инициализированная литералом в том же выражении, где объявлена.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (138,4,0,'В конструкции <strong>switch</strong> блок <strong>default</strong> может быть в любом месте (не обязательно в конце). Важно понимать, что выполнится он <span style="text-decoration: underline;">только</span> в том случае, если не подойдет ни одно значение из <strong>case</strong>. Однако если он не в конце и не имеет инструкции <strong>break</strong>, то выполнение после него перейдет следующему за ним <strong>case</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (139,4,0,'В конструкциях while, do-while, for (включая for-each), как и в if, если тело цикла состоит из одного выражения, фигурные скобки можно опустить.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (140,4,2,'Опишите синтаксис цикла do-while');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (314,140,'do {<br />&nbsp; //body<br />} while (expression);',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (141,4,2,'Каково содержательное отличие циклов while и do-while?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (315,141,'В цикле do-while тело цикла выполнится по крайней мере 1 раз.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (142,4,2,'Опишите синтаксис простого цикла for');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (316,142,'for (initialization; booleanExpression; updateStatement) {<br />&nbsp;&nbsp; //body<br />}<br /><br />initialization и updateStatement могут состоять из нескольких выражений, разделенных запятыми',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (143,4,0,'Будьте внимательны, когда переменная, объявленная и инициализированная в заголовке цикла for, используется за пределами цикла - она там уже не видна.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (144,4,0,'Переменная, объявленная <span style="text-decoration: underline;">до</span> цикла for и инициализированная в заголовке цикла, остается видимой за пределами цикла.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (145,4,1,'Какие из нижеследующих фрагментов скомпилируются?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (320,145,'for (long y = 0, int x = 4; x &lt; 5 &amp;&amp; y&lt;10; x++, y++) { <br />&nbsp;&nbsp;&nbsp; System.out.print(x + " ");<br />}',false,'Все переменные в блоке инициализации цикла должны быть одного типа, <span style="text-decoration: underline;">если они там же и объявляются</span>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (321,145,'for (long y = 0, x = 4; x &lt; 5 &amp;&amp; y &lt; 10; x++, y++) {<br />&nbsp;&nbsp;&nbsp; System.out.print(y + " ");<br />}<br />System.out.print(x);',false,'Попытка за пределами цикла обратиться к переменной, которая была объявлена в блоке инициализации цикла.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (317,145,'for ( ; ; ) {<br />&nbsp;&nbsp;&nbsp; System.out.println("Hello World");<br />}',true,'Способ&nbsp;организовать бесконечный цикл.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (318,145,'int x = 0;<br />for (long y = 0, z = 4; x &lt; 5 &amp;&amp; y &lt; 10; x++, y++) {<br />&nbsp;&nbsp;&nbsp; System.out.print(y + " ");<br />}<br />System.out.print(x);',true,'в секциях заголовка цикла for может использоваться более одной переменной');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (319,145,'int x = 0;<br />for (long y = 0, x = 4; x &lt; 5 &amp;&amp; y &lt; 10; x++, y++) {<br />&nbsp;&nbsp;&nbsp; System.out.print(x + " ");<br />}',false,'Переменная <strong>x</strong> уже была объявлена до цикла, а в&nbsp;блоке инициализации&nbsp;цикла она опять объявляется.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (146,4,2,'Опишите синтаксис цикла for-each');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (322,146,'for(datatype instance : iterable collection) {<br />&nbsp;&nbsp;&nbsp; //body<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (147,4,0,'На экзамене OCA из всего Collections Framework требуется знание только List и ArrayList');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (148,0,2,'Какой код можно можно будет увидеть после компиляции и декомпиляции следующего кода, если <strong>names</strong> - массив String?<br /><br />for(String name : names) {<br />&nbsp;&nbsp;&nbsp; System.out.print(name + ", ");<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (323,148,'for(int i=0; i &lt; names.length; i++) {<br />&nbsp;&nbsp;&nbsp; String name = names[i];<br />&nbsp;&nbsp;&nbsp; System.out.print(name + ", ");<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (149,0,2,'Какой код можно можно будет увидеть после компиляции и декомпиляции следующего кода, если <strong>values</strong>- это List?<br /><br />for(int value : values) {<br />&nbsp;&nbsp;&nbsp; System.out.print(value + ", ");<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (324,149,'for(java.util.Iterator&lt;Integer&gt; i = values.iterator(); i.hasNext(); ) {<br />&nbsp;&nbsp;&nbsp; int value = i.next();<br />&nbsp;&nbsp;&nbsp; System.out.print(value + ", ");<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (150,4,0,'Одним из недостатков цикла for-each является то, что он скрывает переменную-итератор, поэтому некоторые задачи&nbsp;решать с помощью таких циклов оказывается не так удобно. Примеры:<br /><br />1) разделение запятыми элементов коллекции&nbsp;(нельзя определить, где начало и конец перебора).<br />2) обращение во время одной итерации к нескольким элементам коллекции (нельзя обратиться по индексу)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (151,4,2,'Что такое метка в Java?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (325,151,'Метка (<em>label</em>) - это опциональный указатель в начале Java-инструкции, который позволяет потоку приложения "перепрыгнуть" к определенному месту программы или прервать программу с определенного места. Правила именования такие же, как для переменных. Используются только при работе с вложенными циклами. Общепринятая практика именования - заглавные буквы, разделенные подчеркиванием.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (152,4,2,'Опишите синтаксис цикла while с метками и выражением <em>break</em>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (326,152,'optionalLabel: while(booleanExpression) {<br />&nbsp;&nbsp;&nbsp; //body<br />&nbsp;&nbsp;&nbsp; //somewhere in loop<br />&nbsp;&nbsp;&nbsp; break optionalLabel;<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (153,4,2,'Чем <em>continue</em> отличается от <em>break</em>? А чем похоже?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (327,153,'<em>break</em> прерывает цикл, на который ссылается (либо текущий, если метка не указана).<br /><em>continue</em> передает управление&nbsp;проверке условия выполнения цикла, на который ссылается (либо текущего цикла, если метка не указана). Фактически, <em>continue</em> прерывает текущую итерацию цикла.<br />Сходство состоит в том, что синтаксис использования <em>break</em> и <em>continue </em>одинаковый, так же как и логика выбора адресного цикла в зависимости от наличия/отсутствия метки.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (154,4,2,'<p>Где могут быть использованы метки, <em>break</em>, <em>continue</em>?</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (328,154,'Метки допустимы перед любой Java-инструкцией, в том числе перед блоком&nbsp;(но использовать их не надо).<br /><em>break</em> с меткой допустим внутри блока, если&nbsp;какой-то из окружающих блоков (либо управляющая конструкция, открывающая блок) помечен этой меткой.<br /><em>break</em> без метки допустим внутри цикла или <em>switch</em>.<br /><em>continue</em> допустим внутри цикла.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (155,4,1,'Which of the following Java operators can be used with boolean variables? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (329,155,'==',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (330,155,'+',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (331,155,'--',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (332,155,'!',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (333,155,'%',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (334,155,'&lt;=',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (156,4,1,'What data type (or types) will allow the following code snippet to compile? (Choose all that apply)<br /><br />byte x = 5;<br />byte y = 10;<br />_____ z = x + y;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (336,156,'long',true,'Сумма x+y имеет тип int. Может быть автоматически преобразовано к long.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (337,156,'boolean',false,'нельзя положить число в boolean');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (338,156,'double',true,'Сумма x+y имеет тип int. Может быть автоматически преобразовано к double');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (339,156,'short',false,'Сумма x+y имеет тип int. Для преобразования к short требуется явный кастинг');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (340,156,'byte',false,'Сумма x+y имеет тип int. Для преобразования к byte требуется явный кастинг');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (335,156,'int',true,'Сумма x+y имеет тип int.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (157,4,1,'<p>What is the output of the following application?</p>
<p>1: public class CompareValues {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int x = 0;<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while(x++ &lt; 10) {}<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String message = x &gt; 10 ? "Greater than" : false;<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(message+","+x);<br />7:&nbsp;&nbsp;&nbsp;&nbsp; }<br />8: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (341,157,'Greater than,10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (342,157,'false,10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (343,157,'Greater than,11',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (344,157,'false,11',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (345,157,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (346,157,'The code will not compile because of line 5.',true,'false не может быть присвоено переменной типа String.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (158,4,1,'<p>What change would allow the following code snippet to compile? (Choose all that apply)</p>
<p>3: long x = 10;<br />4: int y = 2 * x;</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (352,158,'Change the data type of y on line 4 to long.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (347,158,'No change; it compiles as is.',false,'не получится; операнды в бинарном арифметическом операторе (равно как и значение всего выражения) приводятся к максимальному из них');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (348,158,'Cast x on line 4 to int.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (349,158,'Change the data type of x on line 3 to short.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (350,158,'Cast 2 * x on line 4 to int.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (351,158,'Change the data type of y on line 4 to short.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (159,4,1,'What is the output of the following code snippet?<br /><br />3: java.util.List&lt;Integer&gt; list = new java.util.ArrayList&lt;Integer&gt;();<br />4: list.add(10);<br />5: list.add(14);<br />6: for(int x : list) {<br />7:&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(x + ", ");<br />8:&nbsp;&nbsp;&nbsp;&nbsp; break;<br />9: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (353,159,'10, 14,',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (354,159,'10, 14',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (355,159,'10,',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (356,159,'The code will not compile because of line 7.',false,'На самом деле код скомпилируется, так как если один из операндов сложения является строкой, то происходит конкатенация');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (357,159,'The code will not compile because of line 8.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (358,159,'The code contains an infinite loop and does not terminate.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (160,4,1,'<p>What is the output of the following code snippet?</p>
<p>3: int x = 4;<br />4: long y = x * 4 - x++;<br />5: if(y&lt;10) System.out.println("Too Low");<br />6: else System.out.println("Just Right");<br />7: else System.out.println("Too High");</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (359,160,'Too Low',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (360,160,'Just Right',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (361,160,'Too High',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (362,160,'Compiles but throws a NullPointerException.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (363,160,'The code will not compile because of line 6.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (364,160,'The code will not compile because of line 7.',true,'одинокий else');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (161,4,1,'<p>What is the output of the following code?</p>
<p>1: public class TernaryTester {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int x = 5;<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(x &gt; 2 ? x &lt; 4 ? 10 : 8 : 7);<br />5: }}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (368,161,'8',true,'Вложенные тернарные операторы не требуют скобок');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (369,161,'7',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (370,161,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (365,161,'5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (366,161,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (367,161,'10',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (162,4,1,'<p>What is the output of the following code snippet?</p>
<p>3: boolean x = true, z = true;<br />4: int y = 20;<br />5: x = (y != 10) ^ (z=false);<br />6: System.out.println(x+", "+y+", "+z);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (371,162,'true, 10, true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (372,162,'true, 20, false',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (373,162,'false, 20, true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (374,162,'false, 20, false',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (375,162,'The code will not compile because of line 5.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (163,4,1,'<p>How many times will the following code print "Hello World"?</p>
<p>3: for(int i=0; i&lt;10 ; ) {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; i = i++;<br />5:&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Hello World");<br />6: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (376,163,'9',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (377,163,'10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (378,163,'11',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (379,163,'The code will not compile because of line 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (380,163,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (381,163,'The code contains an infinite loop and does not terminate.',true,'Очень хитро здесь работает инкремент. 1) сначала он берется старый 2) потом инкрементируется на единицу и 3!!!) ранее взятое старое значение кладется в переменную, тем самым отменяя инкремент!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (164,4,1,'<p>What is the output of the following code?</p>
<p>3: byte a = 40, b = 50;<br />4: byte sum = (byte) a + b;<br />5: System.out.println(sum);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (384,164,'90',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (385,164,'The code will not compile because of line 4.',true,'Оператор кастинга имеет наивысший приоритет, поэтому он&nbsp;приводит&nbsp;к byte&nbsp;только a.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (386,164,'An undefined value.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (382,164,'40',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (383,164,'50',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (165,4,1,'What is the output of the following code?<br /><br />1: public class ArithmeticSample {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int x = 5 * 4 % 3;<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(x);<br />5: }}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (387,165,'2',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (388,165,'3',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (389,165,'5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (390,165,'6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (391,165,'The code will not compile because of line 3.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (166,4,1,'What is the output of the following code snippet?<br /><br />3: int x = 0;<br />4: String s = null;<br />5: if(x == s) System.out.println("Success");<br />6: else System.out.println("Failure");');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (392,166,'Success',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (393,166,'Failure',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (394,166,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (395,166,'The code will not compile because of line 5.',true,'Нельзя сравнивать объектный тип с примитивным.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (167,4,1,'What is the output of the following code snippet?<br /><br />3: int x1 = 50, x2 = 75;<br />4: boolean b = x1 &gt;= x2;<br />5: if(b = true) System.out.println("Success");<br />6: else System.out.println("Failure");');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (396,167,'Success',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (397,167,'Failure',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (398,167,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (399,167,'The code will not compile because of line 5.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (168,4,1,'What is the output of the following code snippet?<br /><br />3: int c = 7;<br />4: int result = 4;<br />5: result += ++c;<br />6: System.out.println(result);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (400,168,'8',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (401,168,'11',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (402,168,'12',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (403,168,'15',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (404,168,'16',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (405,168,'The code will not compile because of line 5.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (169,4,1,'What is the output of the following code snippet?<br /><br />3: int x = 1, y = 15;<br />4: while x &lt; 10<br />5:&nbsp;&nbsp;&nbsp;&nbsp; y&ndash;&ndash;;<br />6:&nbsp;&nbsp;&nbsp;&nbsp; x++;<br />7: System.out.println(x+", "+y);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (406,169,'10, 5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (407,169,'10, 6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (408,169,'11, 5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (409,169,'The code will not compile because of line 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (410,169,'The code will not compile because of line 4.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (411,169,'The code contains an infinite loop and does not terminate.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (170,4,1,'What is the output of the following code snippet?<br /><br />3: do {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; int y = 1;<br />5:&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(y++ + " ");<br />6: } while(y &lt;= 10);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (416,170,'The code contains an infinite loop and does not terminate.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (412,170,'1 2 3 4 5 6 7 8 9',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (413,170,'1 2 3 4 5 6 7 8 9 10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (414,170,'1 2 3 4 5 6 7 8 9 10 11',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (415,170,'The code will not compile because of line 6.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (171,4,1,'What is the output of the following code snippet?<br /><br />3: boolean keepGoing = true;<br />4: int result = 15, i = 10;<br />5: do {<br />6:&nbsp;&nbsp;&nbsp;&nbsp; i--;<br />7:&nbsp;&nbsp;&nbsp;&nbsp; if(i==8) keepGoing = false;<br />8:&nbsp;&nbsp;&nbsp;&nbsp; result -= 2;<br />9: } while(keepGoing);<br />10: System.out.println(result);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (417,171,'7',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (418,171,'9',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (419,171,'10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (420,171,'11',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (421,171,'15',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (422,171,'The code will not compile because of line 8.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (172,4,1,'What is the output of the following code snippet?<br /><br />3: int count = 0;<br />4: ROW_LOOP: for(int row = 1; row &lt;=3; row++)<br />5:&nbsp;&nbsp;&nbsp;&nbsp; for(int col = 1; col &lt;=2 ; col++) {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(row * col % 2 == 0) continue ROW_LOOP;<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count++;<br />8:&nbsp;&nbsp;&nbsp;&nbsp; }<br />9: System.out.println(count);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (423,172,'1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (424,172,'2',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (425,172,'3',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (426,172,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (427,172,'6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (428,172,'The code will not compile because of line 6.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (173,4,1,'What is the result of the following code snippet?<br /><br />3: int m = 9, n = 1, x = 0;<br />4: while(m &gt; n) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; m--;<br />6:&nbsp;&nbsp;&nbsp;&nbsp; n += 2;<br />7:&nbsp;&nbsp;&nbsp;&nbsp; x += m + n;<br />8: }<br />9: System.out.println(x);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (432,173,'36',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (433,173,'50',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (434,173,'The code will not compile because of line 7.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (429,173,'11',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (430,173,'13',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (431,173,'23',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (174,4,1,'<p>What is the result of the following code snippet?</p>
<p>3: final char a = ''A'', d = ''D'';<br />4: char grade = ''B'';<br />5: switch(grade) {<br />6:&nbsp;&nbsp;&nbsp;&nbsp; case a:<br />7:&nbsp;&nbsp;&nbsp;&nbsp; case ''B'': System.out.print("great");<br />8:&nbsp;&nbsp;&nbsp;&nbsp; case ''C'': System.out.print("good"); break;<br />9:&nbsp;&nbsp;&nbsp;&nbsp; case d:<br />10:&nbsp;&nbsp;&nbsp;case ''F'': System.out.print("not good");<br />11: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (435,174,'great',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (436,174,'greatgood',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (437,174,'The code will not compile because of line 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (438,174,'The code will not compile because of line 6.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (439,174,'The code will not compile because of lines 6 and 9.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (175,4,2,'Назовите основные принципы использования оператора "+" с точки зрения конкатенации.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (440,175,'1. Если оба операнда числовые, то + обозначает сложение.<br />2. Если хотя бы один операнд - строка, + обозначает конкатенацию.<br />3. Выражение вычисляется слева направо. Например:<br /><br />System.out.println(1 + 2 + "c"); // 3c',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (176,4,2,'Каков будет вывод следующего кода?<br /><br />int three = 3;<br />String four = "4";<br />System.out.println(1 + 2 + three + four);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (441,176,'64',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (177,4,2,'Каков будет результат работы следующего кода?<br /><br />4: String s = "1";<br />5: s += "2";<br />6: s += 3;<br />7: System.out.println(s);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (442,177,'123',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (178,4,2,'Каким должен быть неизменяемый (immutable) класс?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (443,178,'1) иметь только геттеры<br />2) быть объявленным final (чтобы наследники не могли изменить неизменяемое поведение)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (179,4,2,'Что выведет следующий код?<br /><br />String s1 = "1";<br />String s2 = s1.concat("2");<br />s2.concat("3");<br />System.out.println(s2);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (444,179,'12<br /><br />поскольку строки - неизменяемые, а результат конкатенации в 3-й строке не присваивается переменной s2 (т.е. теряется)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (180,4,2,'Что такое строковый пул (<em>string pool</em>)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (445,180,'Строковый пул хранит часто используемые строки в целях экономии памяти, преимущественно строковые литералы.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (181,4,2,'Какая разница между двумя строками?<br /><br />1) String name = "Fluffy";<br />2) String name = new String("Fluffy");');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (446,181,'В первом случае строка попадет в строковый пул (либо будет взята оттуда, если уже имеется в нем).<br />Во втором случае будет создан новый строковый объект, который не попадет в пул и будет доступен для сборщика мусора, когда потеряет все ссылки.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (182,4,0,'<span style="text-decoration: underline;"><em>String<br /></em></span><strong><br /></strong>int<strong> length()<br /><br /></strong>возвращает длину строки.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (183,4,0,'<span style="text-decoration: underline;"><em>String<br /></em></span><strong><br /></strong>char&nbsp;<strong>charAt</strong>(int <em>index</em>)<br /><br />возвращает символ строки по указанному индексу. Если такого индекса в строке не существует, выдается ошибка:<br /><br />java.lang.StringIndexOutOfBoundsException: String index out of range');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (184,4,0,'<span style="text-decoration: underline;"><em>String<br /></em></span><strong><br /></strong>int&nbsp;<strong>indexOf</strong>(int <em>ch</em>)<br />int&nbsp;<strong>indexOf</strong>(int <em>ch</em>, int <em>fromIndex</em>)<br />int&nbsp;<strong>indexOf</strong>(String <em>str</em>)<br />int&nbsp;<strong>indexOf</strong>(String <em>str</em>, int <em>fromIndex</em>)<br /><br />возвращает индекс первого вхождения символа/строки, -1 в случае отсутствия<br /><br />На экзамене передаваться в этот метод будут только параметры char (которые имплицитно кастятся в int)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (185,4,2,'Что будет напечано в результате выполнения следующего кода?<br /><br />String string = "animals";<br />System.out.println(string.indexOf(''a''));<br />System.out.println(string.indexOf("al"));<br />System.out.println(string.indexOf(''a'', 4));<br />System.out.println(string.indexOf("al", 5));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (447,185,'0<br />4<br />4<br />-1',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (186,4,0,'<span style="text-decoration: underline;"><em>String<br /></em></span><strong><br /></strong>String&nbsp;<strong>substring</strong>(int <em>beginIndex</em>)<br />String&nbsp;<strong>substring</strong>(int <em>beginIndex, int endIndex</em>)<br /><br />возвращает подстроку. <em>beginIndex</em> включается, <em>endIndex</em> не включается.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (187,4,0,'Поскольку символ, соответствующий второму параметру в методе String.<strong>substring</strong>(beginIndex, endIndex), не включается в возвращаемое значение, значение этого параметра может превышать на единицу максимальный индекс строки (что тождественно опусканию этого параметра). Если же второй параметр превысит максимальный индекс строки более чем на единицу, то будет Runtime Exception:<br /><br />Exception in thread "main" java.lang.StringIndexOutOfBoundsException: String index out of range');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (188,4,2,'Какие ограничения накладываются на параметры в вызове метода String.substring(int, [int])?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (448,188,'1) Оба параметра могут принимать значение [0..maxIndex+1]<br />2) второй не может быть больше первого',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (189,4,0,'<em><span style="text-decoration: underline;">String</span></em><br /><br />String <strong>toLowerCase</strong>()<br />String <strong>toUpperCase</strong>()<br /><br />Методы преобразуют все заглавные/строчные символы к строчным/заглавным. Все прочие символы остаются без изменений. Исходная строка, разумеется,&nbsp;не изменяется.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (190,4,0,'<em><span style="text-decoration: underline;">String</span></em><br /><br />boolean <strong>equals</strong>(Object <em>obj</em>)<br />boolean <strong>equalsIgnoreCase</strong>(String <em>obj</em>)<br /><br />проверка равенства содержимого двух строк.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (191,4,0,'<span style="text-decoration: underline;"><em>String</em></span><br /><br />boolean <strong>startsWith</strong>(String <em>prefix</em>)<br />boolean <strong>endsWith</strong>(String <em>suffix</em>)<br /><br />проверка начала/окончания строки. Методы чувствительны к регистру.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (192,4,0,'<em><span style="text-decoration: underline;">String</span></em><br /><br />boolean <strong>contains</strong>(String <em>str</em>)<br /><br />проверяет вхождение подстроки в строку (чувствительно к регистру)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (193,4,0,'<em><span style="text-decoration: underline;">String</span></em><br /><br />String <strong>replace</strong>(char <em>oldChar</em>, char <em>newChar</em>)<br />String <strong>replace</strong>(CharSequence <em>oldSeq</em>, CharSequence <em>newSeq</em>)<br /><br />глобальная замена символов/подстрок<br />');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (194,4,0,'<strong>CharSequence</strong> - общий интерфейс, представляющий несколько классов, в т.ч. <strong>String</strong> и <strong>StringBuilder</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (195,4,0,'<em><span style="text-decoration: underline;">String</span></em><br /><br />String <strong>trim</strong>()<br /><br />удаляет пробельные символы с начала и с конца строки: \t (tab), \n (newline), \r (возврат каретки), пробелы:ъ<br /><br />System.out.println("\t a b c\n".trim()); // a b c');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (196,4,2,'Что будет выводом следующего кода?<br /><br />5: String a = "abc";<br />6: String b = a.toUpperCase();<br />7: b = b.replace("B", "2").replace(''C'', ''3'');<br />8: System.out.println("a=" + a);<br />9: System.out.println("b=" + b);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (449,196,'a=abc<br />b=A23',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (197,4,0,'Методы StringBuilder.<strong>append</strong> возвращают ссылку на сам объект <strong>StringBuilder</strong>, поэтому удобно строить цепочки методов!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (198,4,2,'Каков будет результат работы следующего кода?<br /><br />4: StringBuilder a = new StringBuilder("abc");<br />5: StringBuilder b = a.append("de");<br />6: b = b.append("f").append("g");<br />7: System.out.println("a=" + a);<br />8: System.out.println("b=" + b);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (450,198,'a=abcdefg<br />b=abcdefg<br /><br /><strong>a</strong> и <strong>b</strong> указывают на один и тотже объект StringBuilder',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (199,4,2,'Назовите 4 способа создать объект <strong>StringBuilder</strong>. (посредством конструктора)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (451,199,'1) new StringBuilder()<br />2) new StringBuilder(CharSequence seq)<br />3) new StringBuilder(String str)<br />4) new StringBuilder(int capacity)<br /><br />по умолчанию capacity=16, увеличивается, если содержимое растет',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (200,4,0,'Методы <strong>charAt</strong>(), <strong>indexOf</strong>(), <strong>length</strong>(), <strong>substring</strong>() класса <strong>StringBuilder</strong> по аргументам и возвращаемым типам аналогичны таковым класса <strong>String</strong>. <br /><strong>substring</strong>() <span style="text-decoration: underline;">не меняет</span> исходный объект.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (201,4,2,'Каким будет вывод следующего кода?<br /><br />StringBuilder sb = new StringBuilder("animals");<br />String sub = sb.substring(sb.indexOf("a"), sb.indexOf("al"));<br />int len = sb.length();<br />char ch = sb.charAt(6);<br />System.out.println(sub + " " + len + " " + ch);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (452,201,'anim 7 s',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (202,4,0,'Существует более 10 перезагрузок метода <strong>StringBuilder</strong>.<em>append</em>():<br /><br />StringBuilder&nbsp;append(boolean b)<br />StringBuilder&nbsp;append(char c)<br />StringBuilder&nbsp;append(char[] str)<br />StringBuilder&nbsp;append(char[] str, int offset, int len)<br />StringBuilder&nbsp;append(CharSequence s)<br />StringBuilder&nbsp;append(CharSequence s, int start, int end)<br />StringBuilder&nbsp;append(double d)<br />StringBuilder&nbsp;append(float f)<br />StringBuilder&nbsp;append(int i)<br />StringBuilder&nbsp;append(long lng)<br />StringBuilder&nbsp;append(Object obj)<br />StringBuilder&nbsp;append(String str)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (203,4,0,'<em><span style="text-decoration: underline;">StringBuilder</span></em><br /><br />StringBuilder <strong>insert</strong>(int <em>offset</em>, String <em>str</em>) (<em>и еще более 10 перезагрузок</em>)<br /><br />Метод вставляет символы в последовательность и возвращает ссылку на тот же объект.<br /><br />Как и в случае с <strong>substring</strong>, <em>offset</em> может принимать значение от 0 до [длина последовательности, т.е. maxIndex+1], иначе Exception');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (204,4,0,'<em><span style="text-decoration: underline;">StringBuilder</span><br /><br /></em>StringBuilder <strong>delete</strong>(int <em>start</em>, int <em>end</em>)<br />StringBuilder <strong>deleteCharAt</strong>(int <em>index</em>)<br /><br />удаление части последовательности или символа.<br /><br /><em>start</em> и <em>end</em> используются с теми же принципами и ограничениями, что и <strong>substring</strong>,&nbsp;<em>index</em> должен соответствовать реальному индексу.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (205,4,0,'<em><span style="text-decoration: underline;">StringBuilder</span></em><br /><br />StringBuilder <strong>reverse</strong>()<br /><br />переворачивает&nbsp;последовательность и возвращает ссылку на тот же объект.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (206,4,2,'Перечислите методы класса <strong>String</strong>, отобранные для использования на экзамене OCA.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (453,206,'length()<br />charAt()<br />indexOf()<br />substring()<br />toLowerCase()<br />toUpperCase()<br />equals()<br />equalsIgnoreCase()<br />startsWith()<br />endsWith()<br />contains()<br />replace()<br />trim()<br /><br />',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (207,4,2,'Перечислите методы класса <strong>StringBuilder</strong>, отобранные для использования на экзамене OCA.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (454,207,'charAt()<br />indexOf()<br />length()<br />substring()<br />append()<br />insert()<br />delete()<br />deleteCharAt()<br />reverse()<br />toString()',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (208,4,0,'Класс <strong>StringBuffer</strong> делает приблизительно то же самое, что и <strong>StringBuilder</strong>, но он старше (появился до Java 5) и медленнее, так как является thread-safe. На экзамене OCA встретиться не должен, но кто знает...');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (209,4,0,'Если класс не переопределяет <strong>equals</strong>, то при вызове этого метода используется ==.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (210,4,2,'Какой будет результат следующего кода?<br /><br />String x = "Hello World";<br />String y = "Hello World";<br />System.out.println(x == y);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (455,210,'Скорее всего, <strong>true</strong>. Литералы должны складываться виртуальной машиной в пул и извлекаться оттуда. Однако 100% нет.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (211,4,2,'Каким будет результат следующего кода?<br /><br />String x = "Hello World";<br />String z = " Hello World".trim();<br />System.out.println(x == z);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (456,211,'Однозначно, <strong>false</strong>. Строки, вычисляемые в runtime, никогда не берутся из пула - всегда создается новый объект.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (212,4,2,'Каким будет результат следующего кода?<br /><br />String x = new String("Hello World");<br />String y = "Hello World";<br />System.out.println(x == y);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (457,212,'Однозначно, <strong>false</strong>. Строки, создаваемые через ключевое слово <strong>new</strong>,&nbsp;никогда не берутся из пула.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (213,4,0,'Никогда не используйте == для сравнения строк - иметь с этим дело Вам доведется только на экзамене.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (214,4,0,'Класс StringBuilder не имплементирует <strong>equals</strong>().');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (215,4,2,'Что будет результатом следующего кода?<br /><br />1: public class Tiger {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; String name;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tiger t1 = new Tiger();<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tiger t2 = new Tiger();<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tiger t3 = t1;<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(t1 == t1);<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(t1 == t2);<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(t1.equals(t2));<br />10: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (458,215,'true<br />false<br />false',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (216,4,2,'Как создать массив в Java?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (459,216,'1) пустой массив:<br />&lt;type&gt;[] var = new &lt;type&gt;[&lt;size&gt;]<br />e.g.<br />int[] numbers = new int[3]<br /><br />2) массив со значениями<br />&lt;type&gt;[] var = new &lt;type&gt; {val1, val2, ... valN}<br />e.g.<br />int[] numbers2 = new int[] {42,55,99}<br /><br />2.1) сокращенная запись массива со значениями:<br />int[] numbers2 = {42,55,99}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (217,4,0,'При создании массива все элементы заполняются дефолтными значениями.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (218,4,0,'Массив, создаваемый');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (219,4,0,'Массив, создаваемый только с помощью фигурных скобок, называется анонимным. Однако такой синтаксис работает только при <span style="text-decoration: underline;">объявлении</span> и присваивании переменной, иначе компилятор не сможет понять, какого типа данный массив. Если надо создать и сразу использовать инициализированный массив, то необходимо использовать конструкцию с new:<br />System.out.println(new int[]{1,2,3}.length);');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (220,4,2,'Укажите все возможные варианты объявить переменную массива.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (460,220,'int[] var;<br />int [] var;<br />int var[];<br />int&nbsp;var [];<br />--<br />new int[5]<br />new int [5]',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (221,4,0,'Перед и после dot-оператора могут быть пробелы!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (222,4,2,'Какие типы будут объявлены следующими строками?<br /><br />int[] ids1, types1;<br />int ids2[], types2;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (461,222,'ids1, types1, ids2 - массивы int.<br />types2 - int.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (223,4,0,'Метод <strong>equals</strong>() на массивах не переопределен, поэтому такое сравнение будет аналогично ==.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (224,0,0,'Начиная с Java 5, появился удобный метод Arrays.toString(array)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (225,4,1,'Что можно сказать про следующий код?<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String[] strings = {"aaa","bbb"};<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Object[] objects = strings;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; objects[0] = new Object();');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (464,225,'Не скомпилируется.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (462,225,'Скомпилируется и выполнится нормально.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (463,225,'Скомпилируется, но выдаст ошибку времени выполнения',true,'элемент массива objects - объект (и строка), но сам массив objects по своему устройству является массивом строк и знает об этом. Соответственно, в него нельзя помещать элементы, не являющиеся строками, иначе будет ArrayStoreException');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (226,4,1,'Что можно сказать про следующий код?<br /><br />String[] strings = { "stringValue" };<br />Object[] objects = strings;<br />String[] againStrings = (String[]) objects;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (465,226,'Скомпилируется и выполнится нормально.',true,'Если возможен кастинг одного типа к другому, то возможен и кастинг их массивов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (466,226,'Скомпилируется, но выдаст ошибку времени выполнения.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (467,226,'Не скомпилируется.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (227,4,0,'<em>java.util.<span style="text-decoration: underline;">Arrays</span></em><br /><br />static void <strong>sort</strong>(some Comparable)<br /><br />сортирует массив по возрастанию.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (228,4,0,'<em>java.util.<span style="text-decoration: underline;">Arrays</span></em><br /><br />static int <strong>binarySearch</strong>(Comparable, искомое_значение, [Comparator])<br /><br />Возвращает индекс искомого значение, если найдено, (-(insertion point) - 1), если не найдено.<br />Массив должен быть предварительно отсортирован в соответствии с используемым компаратором, иначе результаты будут непредсказуемы.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (229,4,0,'Если есть попытка запустить binarySearch по несортированному массиву, надо сразу искать пункт "unpredictable output".');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (230,4,0,'Если аргумент в методе определен как <strong>vararg</strong>:<br /><br />main(String... args)<br /><br />то его можно использовать как обычный массив.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (231,4,0,'Примеры объявления многомерных массивов:<br /><br />int[][] vars1; // 2D array<br />int vars2 [][]; // 2D array<br />int[] vars3[]; // 2D array<br />int[] vars4 [], space [][]; // a 2D&nbsp;and a 3D array');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (232,4,2,'Что будет создано при выполнении строки<br /><br />String [][] rectangle = new String[3][2];');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (468,232,'Будет создана ссылка на двумерный массив, т.е.&nbsp;3 одномерных массива по 2 элемента в каждом',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (233,4,2,'Как создать двумерный массив, чтобы в массивах внешнего уровня было разное число элементов?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (469,233,'Способ 1. Задать массив литералом:<br /><br />int[][] differentSize = {{1, 4}, {3}, {9,8,7}};<br />&nbsp;&nbsp;&nbsp; или<br />int[][] differentSize;<br />differentSize = new int[][]{{1, 4}, {3}, {9,8,7}};<br /><br /><br />Способ 2. Создать только внутренний массив, а внешние задавать отдельно<br /><br />int[][] differentSize = new int[4][];<br />for (int i = 0; i &lt; differentSize.length; i++) {<br />&nbsp;&nbsp; differentSize[i] = new int[...]<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (234,4,2,'Напишите алгоритм перебора двумерного массива с помощью for-each');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (470,234,'<p>int[][] twoD = new int[3][2];</p>
<p>for (int[] inner : twoD) {<br />&nbsp;&nbsp;&nbsp; for (int num : inner)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(num + " ");<br />&nbsp;&nbsp;&nbsp; System.out.println();<br />}</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (235,4,2,'Укажите 3 способа создать объект ArrayList. (посредством конструктора)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (471,235,'ArrayList list1 = new ArrayList(); // пустой<br />ArrayList list2 = new ArrayList(10); //10 пустых элементов<br />ArrayList list3 = new ArrayList(list2); //копия массива',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (236,4,2,'Укажите два способа создать пустой ArrayList:');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (472,236,'ArrayList&lt;String&gt; list4 = new ArrayList&lt;String&gt;();<br />ArrayList&lt;String&gt; list5 = new ArrayList&lt;&gt;(); // начиная с Java 7',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (237,4,0,'ArrayList реализует toString(), так что его содержимое удобно печатать.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (238,4,0,'java.util.<em><span style="text-decoration: underline;">ArrayList</span></em><br /><br />boolean <strong>add</strong>(E <em>element</em>)<br />void <strong>add</strong>(int <em>index</em>, E <em>element</em>)<br /><br />boolean возвращается, поскольку это&nbsp;имплементированный метод интерфейса <strong>Collection</strong>. В случае ArrayList - всегда true. (с Set''ами будет false). <br /><br />вставка с индексом помещает элемент на указанный индекс. Допустимый диапазон параметра индекс - [0..array.length]');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (239,4,1,'Что будет результатом работы следующего кода?<br /><br />ArrayList list = new ArrayList();<br />list.add("hawk");<br />list.add(true);<br />System.out.println(list);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (473,239,'"hawk", true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (474,239,'[hawk, true]',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (475,239,'["hawk", true]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (476,239,'Код не скомпилируется.',false,'На самом деле, скомпилируется, поскольку произойдет autobox к Boolean/');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (240,4,1,'Что будет напечатано после выполнения следующего кода?<br /><br />ArrayList&lt;String&gt; list = new ArrayList&lt;&gt;();<br />list.add("sparrow");<br />list.add(Boolean.TRUE);<br />System.out.println(list);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (480,240,'Код не скомпилируется.',true,'Нельзя положить Boolean в коллекцию &lt;String&gt;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (477,240,'"sparrow", true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (478,240,'[sparrow, true]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (479,240,'["sparrow", true]',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (241,4,0,'java.util.<em><span style="text-decoration: underline;">ArrayList</span></em><br /><br />boolean <strong>remove</strong>(Object <em>object</em>)<br />E <strong>remove</strong>(int <em>index</em>)<br /><br />методы удаляют элемент по равенству или по индексу. Первый метод возвращает true, если удаление было успешным. По равенству удаляется <span style="text-decoration: underline;">только один</span> элемент (даже если их несколько одинаковых).<br /><br />Индекс должен указываться существующий, иначе исключение!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (242,4,1,'Что будет напечатано после выполнения следующего кода?<br /><br />3: List&lt;String&gt; birds = new ArrayList&lt;&gt;();<br />4: birds.add("hawk");<br />5: birds.add("hawk");<br />6: birds.remove("cardinal");<br />7: birds.remove("hawk");<br />8: System.out.println(birds);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (481,242,'Код не скомпилируется.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (482,242,'[]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (483,242,'[hawk]',true,'Удаляется только одно из совпадений.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (484,242,'["hawk"]',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (243,4,0,'java.util.<em><span style="text-decoration: underline;">ArrayList</span></em><br /><br />E <strong>set</strong>(int <em>index</em>, E <em>newElement</em>)<br /><br />устанавливает элемент коллекции на месте выбранного индекса. Использование несуществующего индекса вызывает исключение.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (244,4,0,'java.util.<em><span style="text-decoration: underline;">ArrayList</span></em><br /><br />boolean <strong>isEmpty</strong>()<br />int <strong>size</strong>()<br /><br />информация о состоянии коллекции');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (245,4,0,'java.util.<em><span style="text-decoration: underline;">ArrayList</span></em><br /><br />void <strong>clear</strong>()<br /><br />Очистка коллекции.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (246,4,0,'java.util.<em><span style="text-decoration: underline;">ArrayList</span></em><br /><br />boolean <strong>contains</strong>(Object <em>object</em>)<br /><br />Проверяет наличие элемента в массиве. Критерий проверки - метод equals().');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (247,4,0,'java.util.<em><span style="text-decoration: underline;">ArrayList</span></em><br /><br />boolean <strong>equals</strong>(Object <em>object</em>)<br /><br />Сравнение двух списков. Сравнение идет по equals элементов с учетом их порядка.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (248,4,2,'Укажите примеры конструкторов для классов обертки.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (485,248,'new Boolean(true)<br />new Byte((byte) 2)<br />new Short((short) 2)<br />new Integer(2)<br />new Long(2)<br />new Float(2.0) / new Float(2) / new Float(''c'')<br />new Double(2.0) / new Double(2) / new Double(''c'')<br />new Character(''c'')',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (249,4,0,'У объектов оберток есть стандартные методы, позволяющие извлечь примитивные значения как есть или приведенные:<br /><strong>intValue</strong>(), <strong>byteValue</strong>(), <strong>doubleValue</strong>() и т.д. (наборы могут отличаться). Однако практической ценности от них немного, т.к. работает автобоксинг. На экзамене такой код может встретиться, но без ловушек.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (250,4,2,'Укажите методы, которые используются обертками для парсинга строк, и особенности их использования.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (487,250,'<p>int primitive = Integer.<strong>parseInt</strong>("123");<br />Integer wrapper = Integer.<strong>valueOf</strong>("123");</p>
<p>float primitive = Float.<strong>parseFloat</strong>("5.67");<br />Float wrapper = Float.<strong>valueOf</strong>("5.67");</p>
<p>boolean primitive = Boolean.<strong>parseBoolean</strong>("false");<br />Boolean wrapper = Boolean.<strong>valueOf</strong>("false");</p>
<p>и.т.д.</p>
<p>Если строка не конвертируется в требуемый числовой тип - будет исключение (NumberFormatException). У Boolean проще - если не конвертируется, то false.</p>
<p>У класса Character нет подобных методов, так как для строки можно воспользоваться <strong>charAt</strong>().</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (251,4,2,'Объясните, что такое <em>autoboxing</em> и приведите примеры использования.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (488,251,'Autoboxing - автоматическое преобразование типов при работе с классами обертки.<br /><br />примеры использования:<br /><br />1) списки:<br /><br />методы <strong>add</strong>() и <strong>remove</strong>() преобразуют примитивы в объекты обертки:<br /><br />List&lt;Double&gt; weights = new ArrayList&lt;&gt;();<br />weights.add(50.5);<br /><br />метод <strong>get</strong>() возвращает примитив:<br /><br />double first = weights.get(0);<br /><br />//TODO. <em><strong>Найти еще примеры и добавить в вопрос!</strong></em>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (252,4,1,'Что будет напечатано при выполнении следующего кода?<br /><br />List&lt;Integer&gt; numbers = new ArrayList&lt;&gt;();<br />numbers.add(1);<br />numbers.add(2);<br />numbers.remove(1);<br />System.out.println(numbers);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (489,252,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (490,252,'1',true,'Метод с сигнатурой remove(int) уже определен в коллекции и удаляет элемент по заданному индексу. Чтобы вызвать перезагруженный метод remove(E), нужно прокинуть объект обертки: remove(new Integer(1))');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (253,4,2,'Приведите пример конвертации списка в массив и отметьте особенности использования.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (491,253,'<p>List&lt;String&gt; list = new ArrayList&lt;&gt;();<br />list.add("hawk");<br />list.add("robin");<br />Object[] objectArray = list.toArray();<br />String[] stringArray = list.toArray(new String[0]);</p>
<p>В последней строке если подаваемый массив имеет достаточный размер, объекты списка будут размещены прямо в нем. В противном случае будет созданный новый массив подходящей размерности. Если подаваемый массив имеет больший размер, чем надо, то в него будут помещены элементы списка, а элемент, следующий за последним из помещенных объектов, станет null (это позволяет определить, где закончилась вставка).</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (254,4,2,'Объясните, как преобразовать массив в список, и укажите особенности использования.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (492,254,'<p>1) Создаем список через конструктор:<br /><br />String dfd [] = {"aaa", "bbb", "ccc"};<br />List&lt;String&gt; lstr = new ArrayList&lt;String&gt;(Arrays.asList(dfd));<br /><br />В этом случае список никак не связан с массивом.<br /><br />2) Создаем связанный (backed) список:<br /><br />String[] array = { "hawk", "robin" };<br />List&lt;String&gt; list = Arrays.asList(array);<br /><br />- этот список меняется синхронно с массивом (а массив - со списком)<br />- в списке <span style="text-decoration: underline;"><strong>можно</strong> </span>менять существующие элементы:<br />&nbsp;&nbsp;&nbsp; list.set(1, "test");<br />- в список <span style="text-decoration: underline;"><strong>нельзя</strong> </span>добавлять или удалять элементы:<br />&nbsp;&nbsp;&nbsp; list.remove(1); // throws UnsupportedOperation Exception<br /><br /></p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (255,4,0,'Arrays.<strong>asList</strong>() может принимать в качестве аргумента varargs, это удобно для быстрого создания списков в тестовых целях:<br /><br />List&lt;String&gt; list = Arrays.asList("one", "two");');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (256,4,0,'java.util.<em><span style="text-decoration: underline;">Collections</span></em><br /><br />static <strong>sort</strong>(List <em>lst</em>)<br /><br />самый простой пример сортировки');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (257,4,2,'Перечислите основные классы пакета java.time.* и опишите их отличия. Создайте экземпляры.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (493,257,'<strong>LocalDate</strong> - только дата<br /><strong>LocalTime</strong> - только время<br /><strong>LocalDateTime</strong> - дата и время<br /><strong>ZonedDateTime</strong> - дата и время с часовым поясом<br /><br />Простое создание экземпляров:<br /><br />System.out.println(LocalDate.now());<br />System.out.println(LocalTime.now());<br />System.out.println(LocalDateTime.now());<br />System.out.println(ZonedDateTime.now());',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (258,4,2,'укажите методы создания Local Date/Time классов, соответствующие произвольные датам и временам.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (494,258,'import java.time.*<br /><br />public static LocalDate <strong>of</strong>(int <em>year</em>, int <em>month</em>, int <em>dayOfMonth</em>)<br />public static LocalDate <strong>of</strong>(int <em>year</em>, Month <em>month</em>, int <em>dayOfMonth</em>)<br /><br />Month - это enum, пакет тот же.<br /><br />public static LocalTime <strong>of</strong>(int <em>hour</em>, int <em>minute</em>)<br />public static LocalTime <strong>of</strong>(int <em>hour</em>, int <em>minute</em>, int <em>second</em>)<br />public static LocalTime <strong>of</strong>(int <em>hour</em>, int <em>minute</em>, int <em>second</em>, int <em>nanos</em>)<br /><br />public static LocalDateTime <strong>of</strong>(int year, int month, int dayOfMonth, int hour, int minute)<br />public static LocalDateTime <strong>of</strong>(int year, int month, int dayOfMonth, int hour, int minute, int second)<br />public static LocalDateTime <strong>of</strong>(int year, int month, int dayOfMonth, int hour, int minute, int second, int nanos)<br />public static LocalDateTime <strong>of</strong>(int year, Month month, int dayOfMonth, int hour, int minute)<br />public static LocalDateTime <strong>of</strong>(int year, Month month, int dayOfMonth, int hour, int minute, int second)<br />public static LocalDateTime <strong>of</strong>(int year, Month month, int dayOfMonth, int hour, int minute, int second, int nanos)<br />public static LocalDateTime <strong>of</strong>(LocalDate date, LocalTime time)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (259,4,1,'Отметьте фрагменты кода, которые скомпилируются и запустятся без проблем.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (496,259,'LocalDate date = LocalDate.of(2015, Month.JANUARY, 32);',false,'скомпилируется, но упадет в runtime - неверный номер дня');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (497,259,'LocalTime time = LocalTime.of(6, 15, 30, 200);',true,'нормальный способ создать экземпляр с миллисекундами');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (498,259,'LocalDate date = LocalDate.of(2015, Month.JANUARY, 20);',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (499,259,'LocalDateTime dateTime = LocalDateTime.of(LocalDate.now(), LocalTime.now());',true,'...хотя проще вызвать LocalDateTime.now()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (495,259,'LocalDate&nbsp;date = new LocalDate();',false,'конструкторы классов в java.time приватны.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (260,0,0,'Основной API для работы с java.util.<strong>Calendar</strong>.<br /><br />//текущие дата и время<br />Date d = new Date(); <br /><br />//создание заданной даты<br />Calendar c = Calendar.getInstance();<br />c.set(2015, Calendar.JANUARY, 1);<br />Date jan = c.getTime();<br /><br />или<br /><br />Calendar c = new GregorianCalendar(2015, Calendar.JANUARY, 1);<br />Date jan = c.getTime();<br /><br />или<br /><br />Calendar c = Calendar.getInstance();<br />c.set(2015, 0, 1); //январь<br />Date jan = c.getTime();<br /><br />//сдвиг на один день<br /><br />public Date subtractDay(Date date) {<br />&nbsp;&nbsp;&nbsp; Calendar cal = Calendar.getInstance();<br />&nbsp;&nbsp;&nbsp; cal.setTime(date);<br />&nbsp;&nbsp;&nbsp; cal.add(Calendar.DATE, -1);<br />&nbsp;&nbsp;&nbsp; return cal.getTime();<br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (261,4,0,'Классы в java.time - неизменяемые!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (262,4,2,'Укажите методы относительного сдвига в классах даты/времени.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (500,262,'plusYears/minusYears<br />plusMonths/minusMonths<br />plusWeeks/minusWeeks<br />plusDays/minusDays<br />plusHours/minusHours<br />plusMinutes/minusMinutes<br />plusSeconds/minusSeconds<br />plusNanos/minusNanos<br /><br />Все они определены на тех классах, где имеют смысл.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (263,4,0,'Удобно использовать method chaining при работе с датой/временем:<br /><br />LocalDate date = LocalDate.of(2020, Month.JANUARY, 20);<br />LocalTime time = LocalTime.of(5, 15);<br />LocalDateTime dateTime = LocalDateTime.of(date2, time)<br />&nbsp;&nbsp;&nbsp; .minusDays(1).minusHours(10).minusSeconds(30);');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (264,4,2,'Что напечатается после выполнения следующего кода?<br /><br />LocalDate date = LocalDate.of(2020, Month.JANUARY, 20);<br />date.plusDays(10);<br />System.out.println(date);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (501,264,'2020-01-20<br /><br />дата не изменится, так как неизменяемая',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (265,4,0,'java.time.<em><span style="text-decoration: underline;">LocalDate</span></em><br />java.time.<em><span style="text-decoration: underline;">LocalDateTime<br /></span></em><br />boolean <strong>isBefore</strong>(ChronoLocalDate <em>other</em>)<br />boolean <strong>isAfter</strong>(ChronoLocalDate <em>other</em>)<br />');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (266,4,0,'java.time.<em><span style="text-decoration: underline;">LocalDate</span></em><br /><br />long <strong>toEpochDay</strong>()<br /><br />прошло дней с 01.01.1970<br /><br />===<br /><br />java.time.<em><span style="text-decoration: underline;">LocalDateTime</span></em><br /><br />long <strong>toEpochSecond</strong>()<br /><br />прошло&nbsp;секунд с 01.01.1970');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (267,4,2,'Укажите, как создать и использовать экземпляры класса Period.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (502,267,'<p>Period period = Period.ofMonths(1);<br />Period period = Period.ofYears(1);<br />Period period = Period.ofWeeks(1);<br />Period period = Period.ofDays(1);<br /><br />Period period = Period.of(<em>years</em>, <em>months</em>, <em>days</em>);</p>
<p>LocalDate start = LocalDate.of(2015, Month.JANUARY, 1);<br />start = start.plus(period); // adds the period<br /><br />(с LocalDateTime тоже можно, добавляется объект интерфейса TemporalAmount)</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (268,4,1,'Каким будет результат работы следующего кода?<br /><br />LocalDate date = LocalDate.of(2018, Month.MARCH, 22);<br />Period period = Period.ofYears(1).ofWeeks(1);<br />System.out.println(date.plus(period));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (503,268,'Код не скомпилируется.',false,'Скомпилируется, т.к. мы можем вызывать статичные методы (ofWeeks(1)) с экземпляра.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (504,268,'Код скомпилируется, но выдаст ошибку времени выполнения.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (505,268,'2019-03-29',false,'Period.ofYears(1).ofWeeks(1) - это то же самое, что<br />Period.ofWeeks(1). Чтобы получился такой ответ, код должен был бы выглядеть так:<br />System.out.println(date.plus(Period.ofYears(1))<br />&nbsp; .plus(Period.ofWeeks(1)));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (506,268,'2018-03-29',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (270,4,0,'<p>class java.time.<em><span style="text-decoration: underline;">Duration</span></em></p>
<p>All Implemented Interfaces:Serializable, Comparable&lt;Duration&gt;, TemporalAmount<br /><br />static Duration <strong>ofDays</strong>(long <em>days</em>)<br />static Duration <strong>ofHours</strong>(long <em>hours</em>)<br />static Duration <strong>ofMillis</strong>(long <em>millis</em>)<br />static Duration <strong>ofMinutes</strong>(long <em>minutes</em>)<br />static Duration <strong>ofNanos</strong>(long <em>nanos</em>)<br />static Duration <strong>ofSeconds</strong>(long <em>seconds</em>)<br />Duration <strong>plus</strong>(Duration <em>duration</em>)</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (271,4,0,'К объектам LocalTime нельзя методом plus добавлять&nbsp;временные отрезки класса Period - будет выдано UnsupportedTemporalTypeException. Duration.ofDays(1) можно, а Period.ofDays(1) - нельзя...');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (272,4,0,'java.time.<em><span style="text-decoration: underline;">LocalDate</span></em><br /><br />int <strong>getDayOfMonth</strong>()<br />DayOfWeek&nbsp;<strong>getDayOfWeek</strong>()<br />int <strong>getDayOfYear</strong>()<br />Month&nbsp;<strong>getMonth</strong>()<br />int <strong>getMonthValue</strong>() //номер месяца в году<br />int <strong>getYear</strong>()');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (273,4,0,'java.time.<em><span style="text-decoration: underline;">LocalTime</span></em><br /><br />int <strong>getHour</strong>()<br />int <strong>getMinute</strong>()<br />int <strong>getNano</strong>()<br />int <strong>getSecond</strong>()');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (274,4,0,'java.time.<em><span style="text-decoration: underline;">LocalDateTime</span></em><br /><br />int&nbsp;<strong>getDayOfMonth</strong>()<br />DayOfWeek <strong>getDayOfWeek</strong>()<br />int&nbsp;<strong>getDayOfYear</strong>()<br />int&nbsp;<strong>getHour</strong>()<br />int&nbsp;<strong>getMinute</strong>()<br />Month <strong>getMonth</strong>()<br />int&nbsp;<strong>getMonthValue</strong>()<br />int&nbsp;<strong>getNano</strong>()<br />int&nbsp;<strong>getSecond</strong>()<br />int&nbsp;<strong>getYear</strong>()');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (275,4,0,'java.time.format.<em><span style="text-decoration: underline;">DateTimeFormatter</span></em><br /><br />Класс, осуществляющий форматирование даты/времени.<br /><br />Имеет несколько констант с экземплярами, например<br /><br /><strong>ISO_LOCAL_DATE</strong> (''2011-12-13'')<br /><strong>ISO_LOCAL_TIME </strong>(''10:15'' или ''10:15:30'')<strong><br />ISO_LOCAL_DATE_TIME</strong> (''2011-12-13T10:15:30'')<br /><br />используется в форматировании следующим образом:<br /><br />LocalDate date = LocalDate.of(2020, Month.JANUARY, 20);<br />LocalTime time = LocalTime.of(11, 12, 34);<br />LocalDateTime dateTime = LocalDateTime.of(date, time);<br />System.out.println(date.format(DateTimeFormatter.ISO_LOCAL_DATE));<br />System.out.println(time.format(DateTimeFormatter.ISO_LOCAL_TIME));<br />System.out.println(dateTime.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (276,4,0,'java.time.format.<em><span style="text-decoration: underline;">DateTimeFormatter</span></em><br /><br />static <strong>ofLocalizedDate</strong>(FormatStyle s<em>tyle</em>)<br />static <strong>ofLocalizedTime</strong>(FormatStyle s<em>tyle</em>)<br />static <strong>ofLocalizedDateTime</strong>(FormatStyle s<em>tyle</em>)<br /><br />FormatStyle - это enum.<br /><br />Методы возвращают форматтеры, специфичные для локали.<br /><br />если локаль надо задать жестко, то можно вызвать метод <strong>withLocale</strong>(Locale) на результате этих методов.<br /><br />Примеры:<br /><br />DateTimeFormatter shortDate =<br />&nbsp;&nbsp;&nbsp; DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT);<br />System.out.println(shortDate.format(dateTime)); // 1/20/20<br />System.out.println(shortDate.format(date)); // 1/20/20<br />System.out.println(shortDate.format(time)); // UnsupportedTemporalTypeException');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (277,4,0,'<p>На форматтере есть метод <strong>format</strong>, принимающий дату/время.<br />На дате/времени есть метод <strong>format</strong>, принимающий форматтер!<br />Результаты одинаковые.<br /><br />DateTimeFormatter shortDateTime =<br />&nbsp;&nbsp;&nbsp; DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT);</p>
<p>System.out.println(shortDateTime.format(dateTime));<br />System.out.println(dateTime.format(shortDateTime));</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (278,4,1,'Укажите примеры кода, которые выполнятся без ошибок.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (512,278,'<p>LocalDateTime localDateTime = LocalDateTime.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedDateTime(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localDateTime));</p>',true,'Покажет весь объект.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (513,278,'<p>LocalTime localTime = LocalTime.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedDateTime(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localTime));</p>',false,'Runtime Exception');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (514,278,'<p>LocalDate localDate = LocalDate.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedTime(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localDate));</p>',false,'Runtime Exception');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (515,278,'<p>LocalDateTime localDateTime = LocalDateTime.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedTime(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localDateTime));</p>',true,'Покажет только время.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (516,278,'<p>LocalTime localTime = LocalTime.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedTime(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localTime));</p>',true,'Покажет весь объект.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (508,278,'<p>LocalDate localDate = LocalDate.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedDate(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localDate));</p>',true,'Покажет весь объект.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (509,278,'<p>LocalDateTime localDateTime = LocalDateTime.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedDate(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localDateTime));</p>',true,'Покажет только дату.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (510,278,'<p>LocalTime localTime = LocalTime.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedDate(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localTime));</p>',false,'Runtime Exception');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (511,278,'<p>LocalDate localDate = LocalDate.now();</p>
<p>DateTimeFormatter f = DateTimeFormatter<br />&nbsp;&nbsp;&nbsp; .ofLocalizedDateTime(FormatStyle.SHORT);</p>
<p>System.out.println(f.format(localDate));</p>',false,'Runtime Exception');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (279,4,0,'java.time.format.<em><span style="text-decoration: underline;">FormatStyle</span></em><br /><br />Две константы, которые могут быть на экзамене:<br /><br /><strong>SHORT </strong>(1/20/20 11:12 AM)<br /><strong>MEDIUM </strong>(Jan 20, 2020 11:12:34 AM)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (280,4,2,'Приведите пример кода, форматирующего дату и время с помощью FormatStyle.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (517,280,'LocalDateTime ldt = LocalDateTime.now();<br />DateTimeFormatter dtf = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM);<br />System.out.println(ldt.format(dtf));',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (281,4,0,'java.time.format.<em><span style="text-decoration: underline;">DateTimeFormatter</span></em><br /><br />static DateTimeFormatter <strong>ofPattern</strong>(String <em>pattern</em>);<br /><br />пользовательский формат вывода даты/времени.<br /><br />Некоторые управляющие символы:<br /><br /><span style="text-decoration: underline;">Месяц</span>:<br /><strong>M</strong>: 1<br /><strong>MM</strong>: 01<br /><strong>MMM</strong>: Jan<br /><strong>MMMM</strong>: January<br /><br /><span style="text-decoration: underline;">День</span>:<br /><strong>d</strong>: 2, 23<br /><strong>dd</strong>: 02, 23<br /><br /><span style="text-decoration: underline;">Год</span>:<br /><strong>y</strong>: 2018<br /><strong>yy</strong>: 18<br /><strong>yyy</strong>: 2018<br /><strong>yyyy</strong>: 2018<br /><br /><span style="text-decoration: underline;">Час</span>:<br /><strong>h</strong>: 1, 10<br /><strong>hh</strong>: 01, 10<br /><br /><span style="text-decoration: underline;">Минута</span>:<br /><strong>m</strong>: 0, 25<br /><strong>mm</strong>: 00, 25<br /><br /><span style="text-decoration: underline;">Секунда</span>:<br /><strong>s</strong>: 3,12<br /><strong>ss</strong>: 03,12<br /><br /><br />DateTimeFormatter f = DateTimeFormatter.ofPattern("MMMM dd, yyyy, hh:mm");<br />System.out.println(dateTime.format(f)); // January 20, 2020, 11:12');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (282,4,0,'Пример форматирования прежних дат.<br /><br />Date d = new Date();<br />SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");<br />System.out.println(sdf.format(d));');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (283,4,1,'Какая строка нижеследующего кода вызовет runtime exception?<br /><br />4: DateTimeFormatter f = DateTimeFormatter.ofPattern("hh:mm");<br />5: f.format(dateTime);<br />6: f.format(date);<br />7: f.format(time);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (518,283,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (519,283,'5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (520,283,'6',true,'потому что нельзя вычислить информацию о времени из объекта чистой даты');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (521,283,'7',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (284,4,0,'java.time.<em><span style="text-decoration: underline;">LocalDate</span></em><br />java.time.<em><span style="text-decoration: underline;">LocalTime</span></em><br />java.time.<em><span style="text-decoration: underline;">LocalDateTime</span></em><br /><br />static Local... <strong>parse</strong>(String <em>str</em>)<br />static Local... <strong>parse</strong>(String <em>str</em>, DateTimeFormatter <em>dtf</em>)<br /><br />парсинг строк.<br /><br />DateTimeFormatter f = DateTimeFormatter.ofPattern("MM dd yyyy");<br />LocalDate date = LocalDate.parse("01 02 2015", f);<br />LocalTime time = LocalTime.parse("11:22");<br />System.out.println(date); // 2015-01-02<br />System.out.println(time); // 11:22<br /><br />Общий подход такой: если что-то не получается распарсить (не тот формат строки, неверная дата и т.п.), то будет runtime exception.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (285,4,1,'<p>What is output by the following code? (Choose all that apply)</p>
<p>1: public class Fish {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int numFish = 4;<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String fishType = "tuna";<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String anotherFish = numFish + 1;<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(anotherFish + " " + fishType);<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(numFish + " " + 1);<br />8: } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (528,285,'The code does not compile.',true,'в строке 5 int присваивается строке');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (522,285,'4 1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (523,285,'41',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (524,285,'5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (525,285,'5 tuna',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (526,285,'5tuna',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (527,285,'51tuna',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (286,4,0,'Если при присваивании&nbsp; целочисленным типам значение может быть вычислено на этапе компиляции (арифметическое выражение с литералами, не результат вызова метода!)&nbsp;и входит в диапазон соответствующего типа, кастинг не требуется:<br /><br />byte b;<br />b = 10*5; //нормально<br />b = 100*5; //ошибка компиляции');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (287,4,1,'<p>Which of the following are output by this code? (Choose all that apply)</p>
<p>3: String s = "Hello";<br />4: String t = new String(s);<br />5: if ("Hello".equals(s)) System.out.println("one");<br />6: if (t == s) System.out.println("two");<br />7: if (t.equals(s)) System.out.println("three");<br />8: if ("Hello" == s) System.out.println("four");<br />9: if ("Hello" == t) System.out.println("five");</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (529,287,'one',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (530,287,'two',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (531,287,'three',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (532,287,'four',true,'строковый объект из пула сравнивается сам с собой');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (533,287,'five',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (534,287,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (288,4,1,'Which are true statements? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (535,288,'An immutable object can be modified.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (536,288,'An immutable object cannot be modified.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (537,288,'An immutable object can be garbage collected.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (538,288,'An immutable object cannot be garbage collected.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (539,288,'String is immutable.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (540,288,'StringBuffer is immutable.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (541,288,'StringBuilder is immutable.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (289,4,1,'<p>What is the result of the following code?</p>
<p>7: StringBuilder sb = new StringBuilder();<br />8: sb.append("aaa").insert(1, "bb").insert(4, "ccc");<br />9: System.out.println(sb);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (544,289,'bbaaaccc',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (545,289,'bbaaccca',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (546,289,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (547,289,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (542,289,'abbaaccc',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (543,289,'abbaccca',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (290,4,1,'<p>What is the result of the following code?</p>
<p>2: String s1 = "java";<br />3: StringBuilder s2 = new StringBuilder("java");<br />4: if (s1 == s2)<br />5:&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("1");<br />6: if (s1.equals(s2))<br />7:&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("2");</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (548,290,'1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (549,290,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (550,290,'12',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (551,290,'No output is printed.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (552,290,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (553,290,'The code does not compile.',true,'нельзя сравнивать по ссылке объекты разных иерархий');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (291,4,1,'<p>What is the result of the following code?</p>
<p>public class Lion {<br />&nbsp;&nbsp;&nbsp; public void roar(String roar1, StringBuilder roar2) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; roar1.concat("!!!");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; roar2.append("!!!");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String roar1 = "roar";<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; StringBuilder roar2 = new StringBuilder("roar");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Lion().roar(roar1, roar2);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(roar1 + " " + roar2);<br />} }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (554,291,'roar roar',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (555,291,'roar roar!!!',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (556,291,'roar!!! roar',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (557,291,'roar!!! roar!!!',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (558,291,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (559,291,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (292,4,1,'<p>Which are the results of the following code? (Choose all that apply)</p>
<p>String letters = "abcdef";<br />System.out.println(letters.length());<br />System.out.println(letters.charAt(3));<br />System.out.println(letters.charAt(6));</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (560,292,'5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (561,292,'6',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (562,292,'с',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (563,292,'d',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (564,292,'An exception is thrown.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (565,292,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (293,4,1,'Which are the results of the following code? (Choose all that apply)<br /><br />String numbers = "012345678";<br />System.out.println(numbers.substring(1, 3));<br />System.out.println(numbers.substring(7, 7));<br />System.out.println(numbers.substring(7));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (566,293,'12',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (567,293,'123',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (568,293,'7',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (569,293,'78',true,'Метод substring() может принимать на вход один аргумент, в этом случае подстрока берется с указанного индекса и до конца строки.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (570,293,'A blank line.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (571,293,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (572,293,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (294,4,1,'<p>What is the result of the following code?</p>
<p>3: String s = "purr";<br />4: s.toUpperCase();<br />5: s.trim();<br />6: s.substring(1, 3);<br />7: s += " two";<br />8: System.out.println(s.length());</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (576,294,'10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (577,294,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (578,294,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (573,294,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (574,294,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (575,294,'8',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (295,4,1,'<p>What is the result of the following code? (Choose all that apply)</p>
<p>13: String a = "";<br />14: a += 2;<br />15: a += ''c'';<br />16: a += false;<br />17: if ( a == "2cfalse") System.out.println("==");<br />18: if ( a.equals("2cfalse")) System.out.println("equals");</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (579,295,'Compile error on line 14.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (580,295,'Compile error on line 15.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (581,295,'Compile error on line 16.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (582,295,'Compile error on another line.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (583,295,'==',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (584,295,'equals',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (585,295,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (296,4,1,'<p>What is the result of the following code?</p>
<p>4: int total = 0;<br />5: StringBuilder letters = new StringBuilder("abcdefg");<br />6: total += letters.substring(1, 2).length();<br />7: total += letters.substring(6, 6).length();<br />8: total += letters.substring(6, 5).length();<br />9: System.out.println(total);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (586,296,'1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (587,296,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (588,296,'3',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (589,296,'7',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (590,296,'An exception is thrown.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (591,296,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (297,4,1,'<p>What is the result of the following code? (Choose all that apply)</p>
<p>StringBuilder numbers = new StringBuilder("0123456789");<br />numbers.delete(2, 8);<br />numbers.append("-").insert(2, "+");<br />System.out.println(numbers);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (592,297,'01+89&ndash;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (593,297,'012+9&ndash;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (594,297,'012+&ndash;9',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (595,297,'0123456789',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (596,297,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (597,297,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (298,4,1,'What is the result of the following code?<br /><br />StringBuilder b = "rumble";<br />b.append(4).deleteCharAt(3).delete(3, b.length() - 1);<br />System.out.println(b);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (598,298,'rum',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (599,298,'rum4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (600,298,'rumb4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (601,298,'rumble4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (602,298,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (603,298,'The code does not compile.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (299,4,1,'<p>Which of the following can replace line 4 to print "avaJ"? (Choose all that apply)</p>
<p>3: StringBuilder puzzle = new StringBuilder("Java");<br />4: // INSERT CODE HERE<br />5: System.out.println(puzzle);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (608,299,'None of the above.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (604,299,'puzzle.reverse();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (605,299,'puzzle.reverse().append("vaJ$").substring(0, 4);',false,'substring не меняет объект StringBuilder, так что puzzle останется avaJvaJ$');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (606,299,'puzzle.append("vaJ$").delete(0, 3).deleteCharAt(puzzle.length() - 1);',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (607,299,'puzzle.append("vaJ$").delete(0, 3).deleteCharAt(puzzle.length());',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (300,4,1,'Which of these array declarations is not legal? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (609,300,'int[][] scores = new int[5][];',false,'можно опускать размерность последующих уровней, но первый уровень мнгогоуровневого массива долже быть задан');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (610,300,'Object[][][] cubbies = new Object[3][0][5];',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (611,300,'String beans[] = new beans[6];',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (612,300,'java.util.Date[] dates[] = new java.util.Date[2][];',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (613,300,'int[][] types = new int[];',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (614,300,'int[][] java = new int[][];',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (301,4,1,'<p>Which of these compile when replacing line 8? (Choose all that apply)</p>
<p>7: char[]c = new char[2];<br />8: // INSERT CODE HERE</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (615,301,'int length = c.capacity;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (616,301,'int length = c.capacity();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (617,301,'int length = c.length;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (618,301,'int length = c.length();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (619,301,'int length = c.size;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (620,301,'int length = c.size();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (621,301,'None of the above.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (302,4,1,'<p>17. Which of these compile when replacing line 8? (Choose all that apply)</p>
<p>7: ArrayList l = new ArrayList();<br />8: // INSERT CODE HERE</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (624,302,'int length = l.length;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (625,302,'int length = l.length();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (626,302,'int length = l.size;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (627,302,'int length = l.size();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (628,302,'None of the above.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (622,302,'int length = l.capacity;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (623,302,'int length = l.capacity();',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (303,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (629,303,'An array has a fixed size.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (630,303,'An ArrayList has a fixed size.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (631,303,'An array allows multiple dimensions.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (632,303,'An array is ordered.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (633,303,'An ArrayList is ordered.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (634,303,'An array is immutable.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (635,303,'An ArrayList is immutable.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (304,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (640,304,'None of the above.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (636,304,'Two arrays with the same content (incl. order)&nbsp;are equal.',false,'массивы не переопределяют equals(), так что равенство будет только по идентичности объекта');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (637,304,'Two ArrayLists with the same content (incl. order) are equal.',true,'Списки переопределяют equals и смотрят на содержимое.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (638,304,'If you call remove(0) using an empty ArrayList object, it will compile successfully.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (639,304,'If you call remove(0) using an empty ArrayList object, it will run successfully.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (305,4,1,'<p>What is the result of the following statements?</p>
<p>6: List&lt;String&gt; list = new ArrayList&lt;String&gt;();<br />7: list.add("one");<br />8: list.add("two");<br />9: list.add(7);<br />10: for(String s : list) System.out.print(s);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (641,305,'onetwo',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (642,305,'onetwo7',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (643,305,'onetwo followed by an exception',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (644,305,'Compiler error on line 9.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (645,305,'Compiler error on line 10.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (306,4,1,'<p>What is the result of the following statements?</p>
<p>3: ArrayList&lt;Integer&gt; values = new ArrayList&lt;&gt;();<br />4: values.add(4);<br />5: values.add(5);<br />6: values.set(1, 6);<br />7: values.remove(0);<br />8: for (Integer v : values) System.out.print(v);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (646,306,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (647,306,'5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (648,306,'6',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (649,306,'46',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (650,306,'45',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (651,306,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (652,306,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (307,4,1,'<p>What is the result of the following?</p>
<p>int[] random = { 6, -4, 12, 0, -10 };<br />int x = 12;<br />int y = Arrays.binarySearch(random, x);<br />System.out.println(y);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (656,307,'The result is undefined.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (657,307,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (658,307,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (653,307,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (654,307,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (655,307,'6',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (308,4,1,'<p>What is the result of the following?</p>
<p>4: List&lt;Integer&gt; list = Arrays.asList(10, 4, -1, 5);<br />5: Collections.sort(list);<br />6: Integer array[] = list.toArray(new Integer[4]);<br />7: System.out.println(array[0]);<br /><br /></p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (659,308,'-1',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (660,308,'10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (661,308,'Compiler error on line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (662,308,'Compiler error on line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (663,308,'Compiler error on line 6.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (664,308,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (309,4,1,'<p>What is the result of the following?</p>
<p>6: String [] names = {"Tom", "Dick", "Harry"};<br />7: List&lt;String&gt; list = names.asList();<br />8: list.set(0, "Sue");<br />9: System.out.println(names[0]);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (665,309,'Sue',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (666,309,'Tom',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (667,309,'Compiler error on line 7.',true,'нет метода asList() у объекта массива');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (668,309,'Compiler error on line 8.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (669,309,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (310,4,1,'<p>What is the result of the following?</p>
<p>List&lt;String&gt; hex = Arrays.asList("30", "8", "3A", "FF");<br />Collections.sort(hex);<br />int x = Collections.binarySearch(hex, "8");<br />int y = Collections.binarySearch(hex, "3A");<br />int z = Collections.binarySearch(hex, "4F");<br />System.out.println(x + " " + y + " " + z);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (672,310,'2 1 &ndash;2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (673,310,'2 1 &ndash;3',true,'Если в сортированном списке не находится искомый элемент, а virtual_index - это его предполагаемый индекс (т.е. где бы он находился, если бы присутствовал в списке), то binarySearch вернет значение -virtual_index - 1.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (674,310,'None of the above.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (675,310,'The code doesn&rsquo;t compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (670,310,'0 1 &ndash;2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (671,310,'0 1 &ndash;3',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (311,4,1,'<p>Which of the following are true statements about the following code? (Choose all that apply)</p>
<p>4: List&lt;Integer&gt; ages = new ArrayList&lt;&gt;();<br />5: ages.add(Integer.parseInt("5"));<br />6: ages.add(Integer.valueOf("6"));<br />7: ages.add(7);<br />8: ages.add(null);<br />9: for (int age : ages) System.out.print(age);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (676,311,'The code compiles.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (677,311,'The code throws a runtime exception.',true,'в цикле null будет приводиться к int и от этого упадет');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (678,311,'Exactly one of the add statements uses autoboxing.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (679,311,'Exactly two of the add statements use autoboxing.',true,'Integer.parseInt возвращает int, поэтому автобоксинг');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (680,311,'Exactly three of the add statements use autoboxing.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (312,4,2,'Чем отличаются методы Integer.parseInt(String) и Integer.valueOf(String)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (681,312,'Integer.parseInt(String) - возвращает int<br />Integer.valueOf(String) - возвращает Integer',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (313,4,1,'<p>What is the result of the following?</p>
<p>List&lt;String&gt; one = new ArrayList&lt;String&gt;();<br />one.add("abc");<br />List&lt;String&gt; two = new ArrayList&lt;&gt;();<br />two.add("abc");<br />if (one == two)<br />&nbsp;&nbsp;&nbsp; System.out.println("A");<br />else if (one.equals(two))<br />&nbsp;&nbsp;&nbsp; System.out.println("B");<br />else<br />&nbsp;&nbsp;&nbsp; System.out.println("C");</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (682,313,'A',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (683,313,'B',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (684,313,'C',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (685,313,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (686,313,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (314,4,1,'<p>Which of the following can be inserted into the blank to create a date of June 21, 2014?<br />(Choose all that apply)</p>
<p>import java.time.*;<br />public class StartOfSummer {<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LocalDate date = ____________________________<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (688,314,'new LocalDate(2014, 6, 21);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (689,314,'LocalDate.of(2014, 5, 21);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (690,314,'LocalDate.of(2014, 6, 21);',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (691,314,'LocalDate.of(2014, Calendar.JUNE, 21);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (692,314,'LocalDate.of(2014, Month.JUNE, 21);',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (687,314,'new LocalDate(2014, 5, 21);',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (315,4,1,'<p>What is the output of the following code?</p>
<p>LocalDate date = LocalDate.parse("2018-04-30", DateTimeFormatter.ISO_LOCAL_DATE);<br />date.plusDays(2);<br />date.plusHours(3);<br />System.out.println(date.getYear() + " " + date.getMonth() + " "<br />+ date.getDayOfMonth());</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (693,315,'2018 APRIL 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (694,315,'2018 APRIL 30',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (695,315,'2018 MAY 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (696,315,'The code does not compile.',true,'Объект LocalDate не имеет компонента времени, у него нет метода plusHours()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (697,315,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (316,4,1,'<p>What is the output of the following code?</p>
<p>LocalDate date = LocalDate.of(2018, Month.APRIL, 40);<br />System.out.println(date.getYear() + " " + date.getMonth() + " "<br />+ date.getDayOfMonth());</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (698,316,'2018 APRIL 4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (699,316,'2018 APRIL 30',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (700,316,'2018 MAY 10',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (701,316,'Another date.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (702,316,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (703,316,'A runtime exception is thrown.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (317,4,1,'<p>What is the output of the following code?</p>
<p>LocalDate date = LocalDate.of(2018, Month.APRIL, 30);<br />date.plusDays(2);<br />date.plusYears(3);<br />System.out.println(date.getYear() + " " + date.getMonth() + " "<br />+ date.getDayOfMonth());</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (704,317,'2018 APRIL 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (705,317,'2018 APRIL 30',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (706,317,'2018 MAY 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (707,317,'2021 APRIL 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (708,317,'2021 APRIL 30',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (709,317,'2021 MAY 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (710,317,'&nbsp;A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (318,4,1,'<p>What is the output of the following code?</p>
<p>LocalDateTime d = LocalDateTime.of(2015, 5, 10, 11, 22, 33);<br />Period p = Period.of(1, 2, 3);<br />d = d.minus(p);<br />DateTimeFormatter f = DateTimeFormatter.ofLocalizedTime(FormatStyle.SHORT);<br />System.out.println(d.format(f));</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (711,318,'3/7/14 11:22 AM',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (712,318,'5/10/15 11:22 AM',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (713,318,'3/7/14',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (714,318,'5/10/15',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (715,318,'11:22 AM',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (716,318,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (717,318,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (319,4,1,'<p>What is the output of the following code?</p>
<p>LocalDateTime d = LocalDateTime.of(2015, 5, 10, 11, 22, 33);<br />Period p = Period.ofDays(1).ofYears(2);<br />d = d.minus(p);<br />DateTimeFormatter f = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.SHORT);<br />System.out.println(f.format(d));</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (720,319,'5/9/14',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (721,319,'5/10/14',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (722,319,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (723,319,'A runtime exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (718,319,'5/9/13 11:22 AM',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (719,319,'5/10/13 11:22 AM',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (320,4,2,'Назовите составляющие метода Java (начиная с объявления)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (724,320,'1) Модификатор доступа (access modifier) (e.g. <strong>public</strong>)<br />2) Дополнительный модификатор(ы) (optional specifier) (e.g. <strong>final</strong>)<br />3) Тип возвращаемого значения (return type) (e.g. <strong>void</strong>) - <em>required<br /></em>4) имя метода (e.g. <strong>nap</strong>) - <em>required</em><br />5) список аргументов (e.g. <strong>int minutes</strong>) или пустые скобки - <em>required</em><br />6) список исключений (e.g. <strong>throws InterruptedException</strong>)<br />7) тело метода в фигурных скобках - <em>required, если не abstract и не interface</em>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (321,4,0,'Дополнительные модификаторы метода в Java могут идти в любом порядке (но не все комбинации допустимы)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (322,4,2,'Перечислите дополнительные модификаторы метода в Java');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (725,322,'static<br />abstract<br />final<br />synchronized<br />native<br />strictfp',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (323,4,0,'Java позволяет дополнительным модификаторам появляться перед модификаторами доступа.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (324,4,1,'Укажите, какие строки скомпилируются.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (726,324,'<p>public void walk1() {}</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (727,324,'<p>public final void walk2() {}</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (728,324,'<p>public static final void walk3() {}</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (729,324,'<p>public final static void walk4() {}</p>',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (730,324,'<p>public modifier void walk5() {}</p>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (731,324,'<p>public void final walk6() {}</p>',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (732,324,'<p>final public void walk7() {}</p>',true,'доп. модификаторы могут быть перед модификаторами доступа');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (325,4,1,'Какие строчки из нижеприведенных скомпилируются?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (736,325,'public String walk4() { }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (737,325,'public walk5() { }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (738,325,'String walk6(int a) { if (a == 4) return ""; }',false,'return внутри условия, поэтому есть вероятность, что он не выполнится. Компилятор&nbsp;отслеживает такую ситуацию');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (733,325,'public void walk1() { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (734,325,'public void walk2() { return; }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (735,325,'public String walk3() { return ""; }',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (326,4,1,'Какие строки из нижеследующих скомпилируются?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (739,326,'public void walk1() { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (740,326,'public void walk2 { }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (741,326,'public void walk3(int a) { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (742,326,'public void walk4(int a; int b) { }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (743,326,'public void walk5(int a, int b) { }',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (327,4,2,'Приведите пример метода, который может породить исключения');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (744,327,'public void twoExceptions() throws <br />&nbsp;&nbsp;&nbsp; IllegalArgumentException, InterruptedException { }',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (328,4,2,'Какие ограничения накладываются на аргументы типа vararg?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (745,328,'1) только один аргумент такого типа в сигнатуре метода<br />2) располагается строго на последнем месте',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (329,4,1,'Какие строки из нижеперечисленных скомпилируются?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (746,329,'public void walk1(int... nums) { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (747,329,'public void walk2(int start, int... nums) { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (748,329,'public void walk3(int... nums, int start) { }',false,'варарг должен быть только один&nbsp; и на последнем месте');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (749,329,'public void walk4(int... start, int... nums) { }',false,'варарг должен быть только один&nbsp; и на последнем месте');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (330,4,2,'Что позволяет осуществить тип аргумента vararg?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (750,330,'<strong>1</strong>) позволяет подать в метод массив:<strong><br /><br /></strong>void walk(int start, int... nums) {}<br />...<br />walk(1, new int[]{6,7}); // start = 1, nums = [6,7]<br /><strong><br />2</strong>) позволяет вместо массива отправить в метод произвольное число элементов массива:<br /><br />void walk(int start, int... nums) {}<br />...<br />walk(1, 2, 3, 4, 5); // start = 1, nums = [2,3,4,5]<br /><br /><strong>3</strong>) позволяет вообще не указывать vararg-аргумент:<br /><br />void walk(int start, int... nums) {}<br />...<br />walk(1); // start = 1, nums = []<br /><br /><strong>4</strong>) позволяет передавать <strong>null</strong>. В этом случае при вызове метода возможен RuntimeException',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (331,4,2,'<p>Назовите принципы доступа к protected-членам класса.</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (751,331,'<p>1) код в классе имеет доступ ко всем <span style="text-decoration: underline;">собственным</span> (this) членам, которые объявлены <strong>protected</strong> в классе-предке.<br /><br />2) общее правило: если в коде класса (в т.ч. в static-методах) используется объект, доступный по ссылке типа данного класса, то имеется доступ ко всем членам объекта, к которым был бы доступ на уровне this.<br /><br />3) если в коде класса есть ссылка на объект-потомок данного класса, то есть доступ к protected-членам, но, естественно, нет доступа к членам, которые объявлены private в данном классе (поскольку сам объект-потомок не имеет к ним доступ).<br /><br /><br />package pond.swan;<br />import pond.shore.Bird;<br />public class Swan extends Bird { //subclass of bird</p>
<p>&nbsp;private String privTest;<br />&nbsp;<br />&nbsp;public void swim() {<br />&nbsp;&nbsp;floatInWater(); // floatInWater() is protected in superclass<br />&nbsp;&nbsp;System.out.println(text); // text is protected in superclass<br />&nbsp;&nbsp;System.out.println(privTest); // own private field<br />&nbsp;}</p>
<p>&nbsp;public void helpOtherSwanSwim() {<br />&nbsp;&nbsp;Swan other = new Swan();<br />&nbsp;&nbsp;other.floatInWater(); <br />&nbsp;&nbsp;System.out.println(other.text);<br />&nbsp;&nbsp;System.out.println(other.privTest);<br />&nbsp;}</p>
<p>&nbsp;public void helpOtherBirdSwim() {<br />&nbsp;&nbsp;Bird other = new Bird();<br />&nbsp;&nbsp;other.floatInWater(); // DOES NOT COMPILE<br />&nbsp;&nbsp;System.out.println(other.text); // DOES NOT COMPILE<br />&nbsp;}</p>
<p>&nbsp;public void helpChild() {<br />&nbsp;&nbsp;BlackSwan bs = new BlackSwan();<br />&nbsp;&nbsp;bs.floatInWater(); <br />&nbsp;&nbsp;System.out.println(bs.text);<br />&nbsp;&nbsp;System.out.println(bs.privTest); // DOES NOT COMPILE - private in Swan<br />&nbsp;&nbsp;System.out.println(bs.ownPrivateFiled); // DOES NOT COMPILE - private in BlackSwan<br />&nbsp;}<br />}</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (332,4,2,'Каковы основные общие выгоды от использования static-методов и полей?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (752,332,'1) Возможность выполнять код, который не требует создания объекта (например, разнообразные утилиты)<br />2) Возможность иметь некоторую конфигурацию состояния, доступ к которой есть у всех экземпляров класса (например, счетчики).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (333,4,0,'Чтобы вызвать static-метод, можно использовать не только имя класса, но и любую ссылку типа данного класса. Содержимое ссылки значения не имеет.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (334,4,1,'Каким будет вывод следующего кода?<br /><br />public class Koala {<br />&nbsp;public static int count = 0; // static variable<br />}<br />...<br />Koala k = new Koala();<br />System.out.println(k.count);<br />k = null;<br />System.out.println(k.count);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (753,334,'0<br />0',true,'для обращения к статичным членам класса важен только тип ссылки, а ее содержимое');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (754,334,'0<br />null',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (755,334,'0<br />&lt;RuntimeException&gt;',false,'исключения не будет, т.к. идет обращение к статичному полю класса, которое не зависит от объекта, на котором вызывается.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (756,334,'Код не скомпилируется.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (335,4,2,'Каков будет результат работы следующего кода?<br /><br />public class Koala {<br />&nbsp;public static int count = 0;<br />}<br />...<br />Koala.count = 4;<br />Koala koala1 = new Koala();<br />Koala koala2 = new Koala();<br />koala1.count = 6;<br />koala2.count = 5;<br />System.out.println(Koala.count);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (757,335,'5<br />count - статическая переменная класса, а не поле экземпляра',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (336,4,0,'Доступ к членам экземпляра отсутствует из static-методов:<br /><br />public class Static {<br />&nbsp;private String name = "Static class";<br />&nbsp;public static void first() { }<br />&nbsp;public static void second() { }<br />&nbsp;public void third() { System.out.println(name); }<br />&nbsp;public static void main(String args[]) {<br />&nbsp;&nbsp;first();<br />&nbsp;&nbsp;second();<br />&nbsp;&nbsp;third(); // DOES NOT COMPILE<br />&nbsp;} <br />}<br /><br />а вот доступ к статичным членам из методов экземпляра имеется:<br /><br />public class Test {<br />&nbsp;&nbsp;&nbsp; public static void main(String... args) {}<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; public void test() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; main("asd");<br />&nbsp;&nbsp;&nbsp; }<br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (337,4,0,'Обычный пример использования статичных полей - подсчет числа экземпляров.<br /><br />public class Counter {<br />&nbsp; private static int count;<br />&nbsp; public Counter() { count++; }<br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (338,4,2,'Можно ли объявить статичную переменную как final и не присвоить ей значение?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (758,338,'Да, если присвоить значение в static initializer. Иначе - ошибка компиляции.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (339,4,1,'Какие строки из нижеприведенного примера НЕ скомпилируются?<br /><br />14: private static int one;<br />15: private static final int two;<br />16: private static final int three = 3;<br />17: private static final int four;<br />18: static {<br />19:&nbsp;&nbsp;&nbsp;&nbsp; one = 1;<br />20:&nbsp;&nbsp;&nbsp;&nbsp; two = 2;<br />21:&nbsp;&nbsp;&nbsp;&nbsp; three = 3;<br />22:&nbsp;&nbsp;&nbsp;&nbsp; two = 4;<br />23: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (759,339,'Все скомпилируются.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (760,339,'14',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (761,339,'17',true,'финальная переменная объявлена, но нигде не присваивается');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (762,339,'16',false,'присваивание при объявлении - корректно');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (763,339,'21',true,'финальная переменная уже была присвоена при объявлении');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (764,339,'22',true,'финальная переменная уже была присвоена двумя строкам выше');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (340,4,0,'Замечания по использованию инициализаторов в классе.<br /><br />1) instance initizlizer не надо использовать <span style="text-decoration: underline;">никогда</span>. Это резко снижает читаемость кода, при том что с помощью конструкторов можно сделать все то же самое, что и с помощью инициализатора.<br /><br />2) static initializer надо использовать только в одном случае: когда инициализация какого-либо статического поля занимает более одной строки (например, инициализация коллекции). Кроме того, если в классе появляется static initializer, надо для удобства перенести в него всю инициализацию статических полей; это, по меньшей мере, сделает очевидным порядок инициализации.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (341,4,2,'Каков смысл статического импорта? Приведите синтаксис и примеры применения.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (765,341,'<p>Статический импорт (static import) нужен, чтобы импортировать статические члены какого-либо класса и использовать их напрямую, без имени класса.<br /><br />Синтаксис:<br />import static package.ClassName.methodName<br />import static package.ClassName.fieldName<br />import static package.ClassName.*<br /><br />Пример:<br /><br />import java.util.List;<br />import static java.util.Arrays.<strong>asList</strong>;</p>
<p>public class StaticImports {<br />&nbsp;public static void main(String[] args) {<br />&nbsp;&nbsp;List&lt;String&gt; list = <strong>asList</strong>("one", "two");<br />&nbsp;} <br />}<br /><br />Часто static import используется для импорта большого количества констант какого-либо класса.</p>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (342,4,0,'Static imports надо использовать с осторожностью. В&nbsp;крупном проекте большое количество импортов приводит к тому, что начинается путаница, из какого класса какой метод импортируетсяю');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (343,4,1,'Что произойдет, если объявлен import static некоторого метода, причем метод с таким же именем объявлен в коде класса?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (768,343,'Будет выполняться метод, объявленный&nbsp;в классе.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (766,343,'Ошибка компиляции',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (767,343,'Будет выполняться импортированный метод.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (344,4,1,'Что можно сказать о следующем коде?<br /><br />1: import static java.util.Arrays.asList;<br />2: static import java.util.Arrays.*;<br />3: public class BadStaticImports {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arrays.asList("one");<br />6:&nbsp;&nbsp;&nbsp;&nbsp; } <br />7: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (769,344,'Скомпилируется без проблем.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (770,344,'Ошибка компиляции в строке 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (771,344,'Ошибка компиляции в строках 2 и 5.',true,'Ошибка в строке 2 - из-за неверного порядка ключевых слов static и import.<br /><br />Ошибка в строке 5 - из-за того, что явно указывается класс Arrays, который не был импортирован. Если бы вызывалось просто asList, то ошибки бы не было.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (345,4,0,'Как говорит учебник:<br />В конструкции import static, так же как в обычном импорте, нельзя явно импортировать два метода/поля с одинаковым именем.<br /><br />Как на практике:<br />- Импортировать два статичных метода или две статичных переменных с одним именем - МОЖНО!<br />- если переменные, то при попытке использования - ошибка компиляции<br />- если wildcard, то при попытке использования переменной - ошибка компиляции<br />- если методы, то при попытке использования - берется первый из указанных<br />- если wildcard, то при попытке использования метода - берется первый из указанных');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (346,4,0,'Java использует передачу по значению (pass-vy-value), а не по ссылке. Это означает, что при передаче переменной в метод создается ее копия, которая ссылается на тот же объект или на такой же примитив. Таким образом, если в метод передается примитив, то переменной в вызывающем методе ничего не угрожает, а если передается объект, то ссылка в вызывающем методе будет продолжать указывать на тот же объект, что бы ни&nbsp;случилось. Однако само состояние объекта может измениться.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (347,4,0,'Запрещено иметь в одном классе несколько методов с одинаковыми именем и сигнатурой. Даже если при этом имеются массовые отличия в модификаторах/возвращаемых типах.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (348,4,2,'Можно ли сделать перезагруженные методы, один из которых принимает на вход массив, а другой - vararg?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (772,348,'Нельзя, будет ошибка компиляции. Хотя байт-код, в который компилируются методы, принимающие массив и vararg, различается,&nbsp;список аргументов&nbsp;в контексте перезагрузки считается одинаковым.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (349,4,2,'Что будет, если в перегруженных методах набор аргументов одинаковый, но их порядок разный?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (773,349,'Такая перегрузка корректна.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (350,4,2,'Что будет, если есть два перегруженных метода, один из которых принимает примитивный аргумент, а второй - обертку?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (774,350,'Код скомпилируется нормально. При вызове этих методов запустится тот из них, который соответствует поданному аргументу. Если бы метода для примитивного типа в коде не было, то запустился бы метод с объектом обертки (посредством autoboxing).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (351,4,2,'Что напечатается после выполнения следующего кода?<br /><br />public class ReferenceTypes {<br />&nbsp;&nbsp;&nbsp; public void fly(String s) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("string ");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public void fly(Object o) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("object ");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ReferenceTypes r = new ReferenceTypes();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r.fly("test");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r.fly(56);<br />&nbsp;&nbsp;&nbsp; } <br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (775,351,'string object<br /><br />Первый вызов fly предсказуемо&nbsp;запускает метод fly(String).<br />Второй вызов пытается найти метод с сигнатурой int, не находит, производит autoboxing, ищет метод для Integer, не находит, ищет метод для класса-предка Integer, находит fly(Object) и запускает его.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (352,4,0,'Общий принцип, характерный для перегруженных методов: если несколько методов могут выполниться для заданного аргумента, выполнится тот, который ближе всего соответствует типу этого аргумента.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (353,4,1,'В каком порядке компилятор будет искать подходящий перегруженный метод для вызова glide(1,2)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (776,353,'public String glide(int i, int j) {}<br />public String glide(long i, long j) {}<br />public String glide(Integer i, Integer j) {}<br />public String glide(int... nums) {}',true,'vararg идет на последнем месте, т.к. он появился в языке сравнительно недавно, и из соображений обратной совместимости применяется в последнюю очередь');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (777,353,'public String glide(int... nums) {}<br />public String glide(int i, int j) {}<br />public String glide(long i, long j) {}<br />public String glide(Integer i, Integer j) {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (778,353,'public String glide(int i, int j) {}<br />public String glide(Integer i, Integer j) {}<br />public String glide(long i, long j) {}<br />public String glide(int... nums) {}',false,'более широкий примитивный тип с точки зрения компилятора "ближе" заданному аргументу, чем его обертка.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (779,353,'public String glide(long i, long j) {}<br />public String glide(int i, int j) {}<br />public String glide(Integer i, Integer j) {}<br />public String glide(int... nums) {}',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (354,4,2,'Какой результат будет у следующего кода?<br /><br />public class Glider2 {<br />&nbsp;&nbsp;&nbsp; public static String glide(String s) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "1";<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static String glide(String... s) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "2";<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static String glide(Object o) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "3";<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static String glide(String s, String t) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "4";<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(glide("a"));<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(glide("a", "b"));<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(glide("a", "b", "c"));<br />&nbsp;&nbsp;&nbsp; } <br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (780,354,'142',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (355,4,0,'В процессе подбора подходящего метода, если не нашлось идеального совпадения, &nbsp;Java делает только одно существенное преобразование поданного аргумента. Например, int можно преобразовать в Integer или в long, но нельзя в Long (для этого потребуется 2 преобразования):<br /><br />public class TooManyConversions {<br />&nbsp;&nbsp;&nbsp; public static void play(Long l) { }<br />&nbsp;&nbsp;&nbsp; public static void play(Long... l) { }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; play(4); // DOES NOT COMPILE<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; play(4L); // calls the Long version<br />&nbsp;&nbsp;&nbsp; } <br />}<br /><br />Подача Integer в метод с аргументом Object не требует отдельного преобразования, т.к. Integer уже является Object.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (356,4,2,'Какой Java-код был бы эквивалентом конструктору по умолчанию для класса ClassName?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (781,356,'public ClassName() {}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (357,4,0,'Конструктор по умолчанию генерируется, только если в коде класса явно не указано ни одного конструктора!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (358,4,1,'В каких классах из нижеуказанных генерируется конструктор по умолчанию?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (784,358,'class Rabbit3 {<br />&nbsp;&nbsp;&nbsp; public Rabbit3(boolean b) { }<br />}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (785,358,'class Rabbit4 {<br />&nbsp;&nbsp;&nbsp; private Rabbit4() { }<br />}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (782,358,'class Rabbit1 {<br />}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (783,358,'class Rabbit2 {<br />&nbsp;&nbsp;&nbsp; public Rabbit2() { }<br />}',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (359,4,0,'Конструктор с модификатором private используется, когда в классе имеются только статичные методы (создание экземпляров не нужно) или когда создание экзмепляров должно контролироваться только самим классом.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (360,4,2,'Скомпилируется ли следующий код?<br /><br />public class Hamster {<br />&nbsp;&nbsp;&nbsp; public Hamster(int weight) { <br />&nbsp;&nbsp;&nbsp;&nbsp; Hamster(weight, "brown");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public Hamster(int weight, String color) { }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (786,360,'Не скомпилируется. Конструктор нельзя вызывать подобно методу. Имя конструктора может идти только за ключевым словом <strong>new</strong>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (361,4,2,'Скомпилируется ли следующий код?<br /><br />public class Hamster {<br />&nbsp;&nbsp;&nbsp; public Hamster(int weight) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Hamster(weight, "brown");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public Hamster(int weight, String color) { }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (787,361,'скомпилируется, но смысла большого в себе не несет',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (362,4,2,'Как вызвать один конструктор из другого?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (788,362,'С помощью ключевого слова <strong>this</strong>.<br /><br />public class Hamster {<br />&nbsp;&nbsp;&nbsp; public Hamster(int weight) {&nbsp; <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this(weight, "brown");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public Hamster(int weight, String color) { }<br />}<br /><br />Однако для успешной компиляции конструкция с this() должна быть первым&nbsp;выражением в конструкторе (комментарии не в счет)! Из этого следует, что дважды this() вызвать не получится.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (363,4,0,'<p>Цепочка конструкторов (constructor chaining):<br /><br />public class Mouse {<br />&nbsp;&nbsp;&nbsp; private int numTeeth;<br />&nbsp;&nbsp;&nbsp; private int numWhiskers;<br />&nbsp;&nbsp;&nbsp; private int weight;</p>
<p>&nbsp;&nbsp;&nbsp; public Mouse(int weight) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this(weight, 16);<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public Mouse(int weight, int numTeeth) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this(weight, numTeeth, 6);<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public Mouse(int weight, int numTeeth, int numWhiskers) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.weight = weight;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.numTeeth = numTeeth;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.numWhiskers = numWhiskers;<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (364,4,0,'Финальные&nbsp;поля экземпляра могут быть присвоены в конструкторе.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (365,4,2,'Опишите порядок инициализации при создании экземпляра класса.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (789,365,'<strong>1</strong>. Если есть родительский класс - инициализировать сперва его.<br /><strong>2</strong>. Статические переменные&nbsp;и статические инициализаторы - в том порядке, в котором встречаются в файле.<br /><strong>3</strong>. Переменные экземпляра и инициализаторы экземпляра - в том порядке, в котором встречаются в файле.<br /><strong>4</strong>. Конструктор.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (366,4,0,'В классе может быть несколько&nbsp;инициализаторов - как статических, так и экземпляра!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (367,4,2,'Каким будет вывод следующего кода?<br /><br />public class InitializationOrderSimple {<br />&nbsp;&nbsp;&nbsp; private String name = "Torchie";<br />&nbsp;&nbsp;&nbsp; { System.out.println(name); }<br />&nbsp;&nbsp;&nbsp; private static int COUNT = 0;<br />&nbsp;&nbsp;&nbsp; static { System.out.println(COUNT); }<br />&nbsp;&nbsp;&nbsp; static { COUNT += 10; System.out.println(COUNT); }<br />&nbsp;&nbsp;&nbsp; public InitializationOrderSimple() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("constructor");<br />&nbsp;&nbsp;&nbsp; } <br />}<br />...<br />public class CallInitializationOrderSimple {<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; InitializationOrderSimple init = new InitializationOrderSimple();<br />&nbsp;&nbsp;&nbsp; } <br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (790,367,'0<br />10<br />Torchie<br />constructor',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (368,4,2,'Каким будет вывод следующего кода?<br /><br />public class InitializationOrder {<br />&nbsp;&nbsp;&nbsp; private String name = "Torchie";<br />&nbsp;&nbsp;&nbsp; { System.out.println(name); }<br />&nbsp;&nbsp;&nbsp; private static int COUNT = 0;<br />&nbsp;&nbsp;&nbsp; static { System.out.println(COUNT); }<br />&nbsp;&nbsp;&nbsp; { COUNT++; System.out.println(COUNT); }<br />&nbsp;&nbsp;&nbsp; public InitializationOrder() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("constructor");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("read to construct");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new InitializationOrder();<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (791,368,'0<br />read to construct<br />Torchie<br />1<br />constructor',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (369,4,2,'Каким будет вывод следующего кода?<br /><br />public class YetMoreInitializationOrder {<br />&nbsp;&nbsp;&nbsp; static { add(2); }<br />&nbsp;&nbsp;&nbsp; static void add(int num) { System.out.print(num + " "); }<br />&nbsp;&nbsp;&nbsp; YetMoreInitializationOrder() { add(5); }<br />&nbsp;&nbsp;&nbsp; static { add(4); }<br />&nbsp;&nbsp;&nbsp; { add(6); }<br />&nbsp;&nbsp;&nbsp; static { new YetMoreInitializationOrder(); }<br />&nbsp;&nbsp;&nbsp; { add(8); }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) { } <br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (792,369,'2 4 6 8 5',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (370,4,2,'Назовите основные правила для JavaBean.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (793,370,'- Все поля - private<br />- Геттер начинается с get. Для boolean более употребителен префикс is.<br />- Сеттер начинается с set.<br />- За префиксами геттера/сеттера - camelCase, причем первый символ имени поля - заглавный.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (371,4,0,'Самый простой способ сделать неизменяемый класс - это не объявлять в нем сеттеры и заполнять все поля при конструировании экземпляра.<br /><br />Однако если поля класса - объектные, то геттеры должны возвращать копию объекта либо неизменяемый объект, производный от исходного (например, toString() для StringBuilder).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (372,4,0,'Лямбда-выражение - это блок кода, который можно куда-либо передавать. Его можно рассматривать как анонимный метод, который имеет тело и параметры, но не имеет имени.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (373,4,2,'Как читается следующая лямда?<br /><br />a -&gt; a.canHop()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (794,373,'a - входной параметр<br /><br />a.canHop() - результат этого метода должен вернуться из лямбды.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (374,4,2,'Пусть мы имеем интерфейс:<br /><br />public interface CheckTrait {<br />&nbsp;&nbsp;&nbsp; boolean test(Animal a);<br />}<br /><br />&nbsp;и класс, его реализующий:<br /><br />public class CheckIfHopper implements CheckTrait {<br />&nbsp;&nbsp;&nbsp; public boolean test(Animal a) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return a.canHop();<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br />а также, печатающий метод:<br /><br />print(List&lt;Animal&gt; animals, CheckTrait checker)<br /><br />Как в этом случае следует интерпретировать следующее выражение?<br /><br />print(animals, a -&gt; a.canHop());');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (795,374,'Java полагается на контекст, в котором оказывается лямбда. В данном случае происходит маппинг лямбды на интерфейс CheckTrait, которого ожидает метод print. Метод интерфейса принимает на вход Animal, значит, <strong>a</strong> - это экземпляр Animal. Метод интерфейса возвращает boolean, значит, лямбда возвращает boolean.<br />Вероятно, компилятор генерит анонимный класс, идентичный по функциональности классу CheckIfHopper.<br /><br /><br />Важно! Интерфейс должен быть <strong>функциональным</strong>, иначе схема не сработает.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (375,4,2,'Укажите <span style="text-decoration: underline;">полный синтаксис</span> для простой лямбды, принимающей один параметр и возвращающей значение какого-либо метода этого параметра.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (796,375,'(Animal a) -&gt; { return a.canHop(); }',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (376,4,2,'Когда в лямбде могут быть опущены фигурные скобки, двоеточие и ключевое слово return?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (797,376,'Когда в&nbsp;&nbsp;в теле лямбды только одно выражение.<br />(скобки, двоеточие и return либо все присутствуют, либо все отсутствуют, частично опускать нельзя)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (377,4,0,'При написании лямбды разработчик не обязан использовать в теле все параметры.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (378,4,2,'Когда в лямбде могут быть опущены скобки вокруг параметров?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (798,378,'- Строго один параметр<br />- Тип параметра не указан<br />(скобки в этом случае можно и не опускать)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (379,4,1,'Укажите, какие из нижеприведенных лямбд корректны.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (800,379,'print(a -&gt; a.startsWith("test"));',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (801,379,'print((a) -&gt; a.startsWith("test"));',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (802,379,'print((String a) -&gt; a.startsWith("test"));',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (803,379,'print((a, b) -&gt; a.startsWith("test"));',true,'2 входных параметра. Можно не использовать все параметры.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (804,379,'print((String a, String b) -&gt; a.startsWith("test"));',true,'2 входных параметра. Можно не использовать все параметры.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (805,379,'print(a, b -&gt; a.startsWith("test"));',false,'нет скобок вокруг нескольких параметров');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (806,379,'print(a -&gt; { a.startsWith("test"); });',false,'нет ключевого слова return');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (807,379,'print(a -&gt; { return a.startsWith("test") });',false,'нет двоеточия перед фигурной скобкой');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (799,379,'print(() -&gt; true);',true,'Допустимо иметь 0 параметров. Данная лямбда будет всегда возвращать true.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (380,4,2,'К каким переменным есть доступ из кода лямбды?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (808,380,'- к статическим&nbsp;полям класса<br />- к полям экземпляра<br />- к финальным переменным - в т.ч. локальным и аргумантам метода.<br />- к аргументам метода и локальным переменным - <span style="text-decoration: underline;">если они не переприсваивались</span>!',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (381,4,2,'Скомпилируется ли следующая лямбда?<br /><br />(a, b) -&gt; { int a = 0; return 5;}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (809,381,'Нет, т.к. идет попытка переприсвоить переменную <strong>a</strong>. С т.з. Java это повторное объявление локальной переменной.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (382,4,2,'Что такое функциональный интерфейс (на уровне OCA)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (810,382,'Это интерфейс с единственным методом.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (383,4,2,'Что Вы можете рассказать об интерфейсе java.util.function.Predicate&lt;T&gt;?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (811,383,'Это функциональный интерфейс с методом test , возвращающим булево значение от одного аргумента).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (384,4,0,'<em>интерфейс java.util.Collection<span style="text-decoration: underline;">&lt;E&gt;</span></em><br /><br />default&nbsp;boolean <strong>removeIf</strong>(Predicate&lt;? super E&gt; <em>filter</em>)<br /><br />удаляет все элементы коллекции, удовлетворяющие заданному предикату.<br /><br />возвращает true, если было произведено хоть одно удаление<br />');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (385,4,2,'Напишите код в функциональном стиле, удаляющий из списка строк <strong>lines</strong> элементы, начинающиеся с символа ''1''');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (812,385,'lines.removeIf(s -&gt; s.charAt(0) == ''1'');',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (386,4,0,'На экзамене OCA будут только лямбды, использующие интерфейс Predicate.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (387,4,1,'<p>Which of the following can fill in the blank in this code to make it compile? (Choose all that apply)</p>
<p>public class Ant {<br />&nbsp;&nbsp;&nbsp; _____ void method() { }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (816,387,'Public',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (817,387,'String',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (818,387,'zzz:',false,'метки нельзя указывать перед методами');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (813,387,'default',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (814,387,'final',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (815,387,'private',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (388,4,1,'Which of the following compile? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (819,388,'final static void method4() { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (820,388,'public final int void method() { }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (821,388,'private void int method() { }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (822,388,'static final void method3() { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (823,388,'void final method() {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (824,388,'void public method() { }',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (389,4,1,'Which of the following methods compile? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (825,389,'public void methodA() { return;}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (826,389,'public void methodB() { return null;}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (827,389,'public void methodD() {}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (828,389,'public int methodD() { return 9;}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (829,389,'public int methodE() { return 9.0;}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (830,389,'public int methodF() { return;}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (831,389,'public int methodG()',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (390,4,1,'Which of the following compile? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (832,390,'public void moreA(int... nums) {}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (833,390,'public void moreB(String values, int... nums) {}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (834,390,'public void moreC(int... nums, String values) {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (835,390,'public void moreD(String... values, int... nums) {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (836,390,'public void moreE(String[] values, ...int nums) {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (837,390,'public void moreF(String... values, int[] nums) {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (838,390,'public void moreG(String[] values, int[] nums) {}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (391,4,1,'<p>Given the following method, which of the method calls return 2? (Choose all that apply)</p>
<p>public int howMany(boolean b, boolean... b2) {<br />&nbsp;&nbsp;&nbsp; return b2.length;<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (839,391,'howMany();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (840,391,'howMany(true);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (841,391,'howMany(true, true);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (842,391,'howMany(true, true, true);',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (843,391,'howMany(true, {true});',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (844,391,'howMany(true, {true, true});',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (845,391,'howMany(true, new boolean[2]);',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (392,4,2,'Что будет, если в vararg передать null?<br />Если ничего не передать?<br />Если несколько null-ов?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (846,392,'Если передать null, то vararg-аргумент будет равен null.<br />Если ничего не передать, то vararg-аргумент станет пустым массивом<br />Если передать несколько null-ов, то в случае с объектным vararg''ом будет массив null-ов, а с примитивным - ошибка компиляции.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (393,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (848,393,'A public class that has private fields and package private methods is not visible to classes outside the package.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (849,393,'You can use access modifiers so only some of the classes in a package see a particular package private class.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (850,393,'You can use access modifiers to allow read access to all methods, but not any instance variables.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (851,393,'You can use access modifiers to restrict read access to all classes that begin with the word Test.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (847,393,'Package private access is more lenient (мягкий, гибкий)&nbsp;than protected access.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (394,4,1,'<p>Given the following my.school.Classroom and my.city.School class definitions, which line numbers in main() generate a compiler error? (Choose all that apply)</p>
<p>1: package my.school;<br />2: public class Classroom {<br />3:&nbsp;&nbsp;&nbsp;&nbsp; private int roomNumber;<br />4:&nbsp;&nbsp;&nbsp;&nbsp; protected String teacherName;<br />5:&nbsp;&nbsp;&nbsp;&nbsp; static int globalKey = 54321;<br />6:&nbsp;&nbsp;&nbsp;&nbsp; public int floor = 3;<br />7:&nbsp;&nbsp;&nbsp;&nbsp; Classroom(int r, String t) {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; roomNumber = r;<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; teacherName = t; } }</p>
<p>1: package my.city;<br />2: import my.school.*;<br />3: public class School {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(Classroom.globalKey);<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Classroom room = new Classroom(101, "Mrs. Anderson");<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(room.roomNumber);<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(room.floor);<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(room.teacherName); } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (852,394,'None, the code compiles fine.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (853,394,'Line 5',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (854,394,'Line 6',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (855,394,'Line 7',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (856,394,'Line 8',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (857,394,'Line 9',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (395,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (858,395,'Encapsulation uses package private instance variables.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (859,395,'Encapsulation uses private instance variables.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (860,395,'Encapsulation allows setters.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (861,395,'Immutability uses package private instance variables.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (862,395,'Immutability uses private instance variables.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (863,395,'Immutability allows setters.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (396,4,1,'Which are methods using JavaBeans naming conventions for accessors and mutators? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (864,396,'public boolean getCanSwim() { return canSwim;}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (865,396,'public boolean canSwim() { return numberWings;}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (866,396,'public int getNumWings() { return numWings;}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (867,396,'public int numWings() { return numberWings;}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (868,396,'public void setCanSwim(boolean b) { canSwim = b;}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (397,4,1,'<p>What is the output of the following code?</p>
<p>1: package rope;<br />2: public class Rope {<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public static int LENGTH = 5;<br />4:&nbsp;&nbsp;&nbsp;&nbsp; static {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LENGTH = 10;<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7:&nbsp;&nbsp;&nbsp;&nbsp; public static void swing() {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("swing ");<br />9:&nbsp;&nbsp;&nbsp;&nbsp; }<br />10: }</p>
<p>1: import rope.*;<br />2: import static rope.Rope.*;<br />3: public class Chimp {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rope.swing();<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Rope().swing();<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(LENGTH);<br />8:&nbsp;&nbsp;&nbsp;&nbsp; }<br />9: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (869,397,'swing swing 5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (870,397,'swing swing 10',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (871,397,'Compiler error on line 2 of Chimp.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (872,397,'Compiler error on line 5 of Chimp.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (873,397,'Compiler error on line 6 of Chimp.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (874,397,'Compiler error on line 7 of Chimp.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (398,4,1,'<p>Which are true of the following code? (Choose all that apply)</p>
<p>1: public class Rope {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void swing() {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("swing ");<br />4:&nbsp;&nbsp;&nbsp;&nbsp; }<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public void climb() {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("climb ");<br />7:&nbsp;&nbsp;&nbsp;&nbsp; }<br />8:&nbsp;&nbsp;&nbsp;&nbsp; public static void play() {<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; swing();<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; climb();<br />11:&nbsp;&nbsp;&nbsp; }<br />12:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />13:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rope rope = new Rope();<br />14:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rope.play();<br />15:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rope rope2 = null;<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rope2.play();<br />17:&nbsp;&nbsp;&nbsp; }<br />18: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (880,398,'If the lines with compile errors are removed, the code throws a NullPointerException.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (875,398,'The code compiles as is.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (876,398,'There is exactly one compiler error in the code.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (877,398,'There are exactly two compiler errors in the code.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (878,398,'If the lines with compiler errors are removed, the output is climb climb.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (879,398,'If the lines with compiler errors are removed, the output is swing swing.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (399,4,1,'<p>What is the output of the following code?</p>
<p>import rope.*;<br />import static rope.Rope.*;<br />public class RopeSwing {<br />&nbsp;&nbsp;&nbsp; private static Rope rope1 = new Rope();</p>
<p>&nbsp;&nbsp;&nbsp; private static Rope rope2 = new Rope();<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(rope1.length);<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rope1.length = 2;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rope2.length = 8;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(rope1.length);<br />&nbsp;&nbsp;&nbsp; }<br />}</p>
<p>package rope;<br />public class Rope {<br />&nbsp;&nbsp;&nbsp; public static int length = 0;<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (881,399,'02',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (882,399,'08',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (883,399,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (884,399,'8',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (885,399,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (886,399,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (400,4,1,'<p>How many compiler errors are in the following code?</p>
<p>1: public class RopeSwing {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; private static final String leftRope;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; private static final String rightRope;<br />4:&nbsp;&nbsp;&nbsp;&nbsp; private static final String bench;<br />5:&nbsp;&nbsp;&nbsp;&nbsp; private static final String name = "name";<br />6:&nbsp;&nbsp;&nbsp;&nbsp; static {<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leftRope = "left";<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rightRope = "right";<br />9:&nbsp;&nbsp;&nbsp;&nbsp; }<br />10:&nbsp;&nbsp;&nbsp;&nbsp; static {<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name = "name";<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rightRope = "right";<br />13:&nbsp;&nbsp;&nbsp;&nbsp; }<br />14:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />15:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bench = "bench";<br />16:&nbsp;&nbsp;&nbsp;&nbsp; }<br />17: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (887,400,'0',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (888,400,'1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (889,400,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (890,400,'3',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (891,400,'4',true,'Ошибки: <br />- в строке 4: статическая финальная переменная должна быть инициализирована в момент объявления или в static-initializer<br />- в строке 11: name уже было инициализировано в момент объявления<br />- в строке 12: rightRope уже было инициализовано в&nbsp; первом static-initializer<br />- в строке 15: финальные переменные нельзя присвоить в методе.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (892,400,'5',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (401,4,1,'<p>Which of the following can replace line 2 to make this code compile? (Choose all that apply)</p>
<p>1: import java.util.*;<br />2: // INSERT CODE HERE<br />3: public class Imports {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; public void method(ArrayList&lt;String&gt; list) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sort(list);<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (896,401,'static import java.util.Collections;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (897,401,'static import java.util.Collections.*;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (898,401,'static import java.util.Collections.sort(ArrayList&lt;String&gt;);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (893,401,'import static java.util.Collections;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (894,401,'import static java.util.Collections.*;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (895,401,'import static java.util.Collections.sort(ArrayList&lt;String&gt;);',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (402,4,1,'<p>What is the result of the following statements?</p>
<p>1: public class Test {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public void print(byte x) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("byte");<br />4:&nbsp;&nbsp;&nbsp;&nbsp; }<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public void print(int x) {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("int");<br />7:&nbsp;&nbsp;&nbsp;&nbsp; }<br />8:&nbsp;&nbsp;&nbsp;&nbsp; public void print(float x) {<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("float");<br />10:&nbsp;&nbsp;&nbsp; }<br />11:&nbsp;&nbsp;&nbsp; public void print(Object x) {<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("Object");<br />13:&nbsp;&nbsp;&nbsp; }<br />14:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />15:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Test t = new Test();<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; short s = 123;<br />17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.print(s);<br />18:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.print(true);<br />19:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t.print(6.789);<br />20:&nbsp;&nbsp;&nbsp; }<br />21: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (899,402,'bytefloatObject',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (900,402,'intfloatObject',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (901,402,'byteObjectfloat',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (902,402,'intObjectfloat',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (903,402,'intObjectObject',true,'для true и 6.789 нет подходящих методов, поэтому они преобразуются в обертки и идут под метод, принимающий Object в качестве параметра');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (904,402,'byteObjectObject',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (403,4,1,'<p>What is the result of the following program?</p>
<p>1: public class Squares {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static long square(int x) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long y = x * (long) x;<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x = -1;<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return y;<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int value = 9;<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; long result = square(value);<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(value);<br />11: } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (905,403,'-1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (906,403,'9',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (907,403,'81',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (908,403,'Compiler error on line 9.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (909,403,'Compiler error on a different line.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (404,4,1,'<p>Which of the following are output by the following code? (Choose all that apply)</p>
<p>public class StringBuilders {<br />&nbsp;&nbsp;&nbsp; public static StringBuilder work(StringBuilder a,<br />StringBuilder b) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a = new StringBuilder("a");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b.append("b");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return a;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; StringBuilder s1 = new StringBuilder("s1");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; StringBuilder s2 = new StringBuilder("s2");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; StringBuilder s3 = work(s1, s2);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("s1 = " + s1);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("s2 = " + s2);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("s3 = " + s3);<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (912,404,'s2 = s2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (913,404,'s2 = s2b',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (914,404,'s3 = a',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (915,404,'s3 = null',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (916,404,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (910,404,'s1 = a',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (911,404,'s1 = s1',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (405,4,1,'Which of the following are true? (Choose 2)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (917,405,'this() can be called from anywhere in a constructor.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (918,405,'this() can be called from any instance method in the class.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (919,405,'this.variableName can be called from any instance method in the class.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (920,405,'this.variableName can be called from any static method in the class.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (921,405,'You must include a default constructor in the code if the compiler does not include one.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (922,405,'You can call the default constructor written by the compiler using this().',false,'если есть любой другой конструктор (в частности, тот, из которого мы вызываем this()), то конструктора по умолчанию компилятор уже не создаст');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (923,405,'You can access a private constructor with the main() method.',true,'имеется в виду private конструктор того же класса');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (406,4,1,'Which of these classes compile and use a default constructor? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (928,406,'public class Bird { Bird(String name) {} }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (929,406,'public class Bird { private Bird(int age) {} }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (930,406,'public class Bird { void Bird() { } }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (924,406,'public class Bird { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (925,406,'public class Bird { public bird() {} }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (926,406,'public class Bird { public bird(String name) {} }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (927,406,'public class Bird { public Bird() {} }',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (407,4,1,'<p>Which code can be inserted to have the code print 2?</p>
<p>public class BirdSeed {<br />&nbsp;&nbsp;&nbsp; private int numberBags;<br />&nbsp;&nbsp;&nbsp; boolean call;</p>
<p>&nbsp;public BirdSeed() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // LINE 1<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; call = false;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // LINE 2<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public BirdSeed(int numberBags) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.numberBags = numberBags;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BirdSeed seed = new BirdSeed();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(seed.numberBags);<br />} }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (931,407,'Replace line 1 with BirdSeed(2);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (932,407,'Replace line 2 with BirdSeed(2);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (933,407,'Replace line 1 with new BirdSeed(2);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (934,407,'Replace line 2 with new BirdSeed(2);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (935,407,'Replace line 1 with this(2);',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (936,407,'Replace line 2 with this(2);',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (408,4,1,'<p>Which of the following complete the constructor so that this code prints out 50? (Choose all that apply)</p>
<p>public class Cheetah {<br />&nbsp;&nbsp;&nbsp; int numSpots;<br />&nbsp;&nbsp;&nbsp; public Cheetah(int numSpots) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // INSERT CODE HERE<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(new Cheetah(50).numSpots);<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (937,408,'numSpots = numSpots;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (938,408,'numSpots = this.numSpots;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (939,408,'this.numSpots = numSpots;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (940,408,'numSpots = super.numSpots;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (941,408,'super.numSpots = numSpots;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (942,408,'None of the above.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (409,4,1,'<p>What is the result of the following?</p>
<p>1: public class Order {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; static String result = "";<br />3:&nbsp;&nbsp;&nbsp;&nbsp; { result += "c"; }<br />4:&nbsp;&nbsp;&nbsp;&nbsp; static<br />5:&nbsp;&nbsp;&nbsp;&nbsp; { result += "u"; }<br />6:&nbsp;&nbsp;&nbsp;&nbsp; { result += "r"; }<br />7: }</p>
<p>1: public class OrderDriver {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(Order.result + " ");<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(Order.result + " ");<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Order();<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Order();<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(Order.result + " ");<br />8:&nbsp;&nbsp;&nbsp;&nbsp; }<br />9: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (944,409,'ucrcr',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (945,409,'u ucrcr',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (946,409,'u u curcur',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (947,409,'u u ucrcr',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (948,409,'ur ur urc',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (949,409,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (943,409,'curur',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (410,4,1,'<p>What is the result of the following?</p>
<p>1: public class Order {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; String value = "t";<br />3:&nbsp;&nbsp;&nbsp;&nbsp; { value += "a"; }<br />4:&nbsp;&nbsp;&nbsp;&nbsp; { value += "c"; }<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public Order() {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value += "b";<br />7:&nbsp;&nbsp;&nbsp;&nbsp; }<br />8:&nbsp;&nbsp;&nbsp;&nbsp; public Order(String s) {<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value += s;<br />10:&nbsp;&nbsp;&nbsp; }<br />11:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Order order = new Order("f");<br />13:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; order = new Order();<br />14:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(order.value);<br />15: } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (950,410,'tacb',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (951,410,'tacf',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (952,410,'tacbf',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (953,410,'tacfb',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (954,410,'tacftacb',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (955,410,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (956,410,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (411,4,1,'<p>Which of the following will compile when inserted in the following code? (Choose all that apply)</p>
<p>public class Order3 {<br />&nbsp;&nbsp;&nbsp; final String value1 = "1";<br />&nbsp;&nbsp;&nbsp; static String value2 = "2";<br />&nbsp;&nbsp;&nbsp; String value3 = "3";<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // CODE SNIPPET 1<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; static {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // CODE SNIPPET 2<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (960,411,'value1 = "g"; instead of // CODE SNIPPET 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (961,411,'value2 = "h"; instead of // CODE SNIPPET 2',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (962,411,'value3 = "i"; instead of // CODE SNIPPET 2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (957,411,'value1 = "d"; instead of // CODE SNIPPET 1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (958,411,'value2 = "e"; instead of // CODE SNIPPET 1',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (959,411,'value3 = "f"; instead of // CODE SNIPPET 1',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (412,4,1,'<p>Which of the following are true about the following code? (Choose all that apply)</p>
<p>public class Create {<br />&nbsp;&nbsp;&nbsp; Create() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("1 ");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; Create(int num) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("2 ");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; Create(Integer num) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("3 ");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; Create(Object num) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("4 ");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; Create(int... nums) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("5 ");<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Create(100);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Create(100L);<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (963,412,'The code prints out 2 4 .',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (964,412,'The code prints out 3 4 .',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (965,412,'The code prints out 4 2 .',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (966,412,'The code prints out 4 4 .',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (967,412,'The code prints 3 4 if you remove the constructor Create(int num).',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (968,412,'The code prints 4 4 if you remove the constructor Create(int num).',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (969,412,'The code prints 5 4 if you remove the constructor Create(int num).',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (413,4,1,'What is the result of the following class?<br /><br />1: import java.util.function.*;<br />2:<br />3: public class Panda {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; int age;<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Panda p1 = new Panda();<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p1.age = 1;<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check(p1, p -&gt; p.age &lt; 5);<br />9:&nbsp;&nbsp;&nbsp;&nbsp; }<br />10:&nbsp;&nbsp;&nbsp; private static void check(Panda panda, Predicate&lt;Panda&gt; pred) {<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String result = pred.test(panda) ? "match" : "not match";<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(result);<br />13: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (970,413,'match',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (971,413,'not match',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (972,413,'Compiler error on line 8.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (973,413,'Compiler error on line 10.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (974,413,'Compiler error on line 11.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (975,413,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (414,4,1,'<p>What is the result of the following code?</p>
<p>1: interface Climb {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; boolean isTooHigh(int height, int limit);<br />3: }<br />4:<br />5: public class Climber {<br />6:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />7:&nbsp;&nbsp;&nbsp;&nbsp; check((h, l) -&gt; h.append(l).isEmpty(), 5);<br />8:&nbsp;&nbsp;&nbsp;&nbsp; }<br />9:&nbsp;&nbsp;&nbsp;&nbsp; private static void check(Climb climb, int height) {<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (climb.isTooHigh(height, 10))<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("too high");<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br />13:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("ok");<br />14:&nbsp;&nbsp;&nbsp; }<br />15: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (976,414,'ok',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (977,414,'too high',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (978,414,'Compiler error on line 7.',true,'Интерфейс Climb, на который мапится лямбда, принимает на вход два параметра int, а в лямбде на одном из параметров производится попытка выполнить метод append.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (979,414,'Compiler error on line 10.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (980,414,'Compiler error on a different line.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (981,414,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (415,4,1,'<p>Which of the following lambda expressions can fill in the blank? (Choose all that apply)</p>
<p>List&lt;String&gt; list = new ArrayList&lt;&gt;();<br />list.removeIf(___________________);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (982,415,'s -&gt; s.isEmpty()',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (983,415,'s -&gt; {s.isEmpty()}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (984,415,'s -&gt; {s.isEmpty();}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (985,415,'s -&gt; {return s.isEmpty();}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (986,415,'String s -&gt; s.isEmpty()',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (987,415,'(String s) -&gt; s.isEmpty()',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (416,4,1,'<p>Which lambda can replace the MySecret class to return the same value? (Choose all that apply)</p>
<p>interface Secret {<br />&nbsp;&nbsp;&nbsp; String magic(double d);<br />}</p>
<p>class MySecret implements Secret {<br />&nbsp;&nbsp;&nbsp; public String magic(double d) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "Poof";<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (992,416,'caller((e) -&gt; { String e = ""; return "Poof" });',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (993,416,'caller((e) -&gt; { String f = ""; return "Poof"; });',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (988,416,'caller((e) -&gt; "Poof");',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (989,416,'caller((e) -&gt; {"Poof"});',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (990,416,'caller((e) -&gt; { String e = ""; "Poof" });',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (991,416,'caller((e) -&gt; { String e = ""; return "Poof"; });',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (417,4,0,'Нельзя наследовать&nbsp;от класса с модификатором final.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (418,4,2,'Укажите общий синтаксис объявления класса (не внутреннего).');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (994,418,'[public] [abstract|final] class ClassName [extends OtherClass] {}<br /><br />модификатор доступа и опциональные модификаторы могут меняться местами',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (419,4,0,'Правила применения модификаторов доступа и принципов распределения по файлам идентичны для классов и интерфейсов.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (420,4,2,'От какого класса наследуют все остальные классы Java?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (995,420,'java.lang.Object',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (421,4,0,'В Java первой строкой <strong>любого</strong> конструктора идет либо <strong>this</strong>(...), либо <strong>super</strong>(...). Даже если в коде не видно super(), он незримо присутствует в байт-коде.<br /><br />Как и в случае с this(), super() может встречаться только однажды и только первой строкой конструктора.<br /><br />Если вызовы this() в конструкторах приводят к зацикливанию (рекурсии), то это отслеживается на этапе компиляции.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (422,4,0,'Если у родительского класса определено несколько конструкторов, доступных для потомков, то потомок может вызвать любой из этих конструкторов в своем конструкторе. Аргументы конструктора-потомка не обязаны соответствовать аргументам конструктора-родителя.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (423,4,2,'Напишите код произвольного класса (без конструкторов, методов и полей), который соответствует байт-коду.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (996,423,'public class Donkey {<br />&nbsp;&nbsp;&nbsp; public Donkey() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; super();<br />&nbsp;&nbsp;&nbsp; }<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (424,4,0,'Опасная ситуация на экзамене: если у родительского класса нет дефолтного конструктора, а дочерний класс объявлен без конструкторов (т.е. с дефолтным), будет ошибка компиляции.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (425,4,0,'В Java родительский конструктор всегда выполняется ДО дочернего.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (426,4,2,'<p>Каким будет вывод следующего кода?<br /><br />class Primate {<br />&nbsp;&nbsp;&nbsp; public Primate() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Primate");<br />&nbsp;&nbsp;&nbsp; }<br />}</p>
<p>class Ape extends Primate {<br />&nbsp;&nbsp;&nbsp; public Ape() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Ape");<br />&nbsp;&nbsp;&nbsp; }<br />}</p>
<p>public class Chimpanzee extends Ape {<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Chimpanzee();<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (997,426,'Primate<br />Ape',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (427,4,0,'Если родительский класс находится в том же пакете, что и дочерний, то у дочернего имеется доступ к package-private членам родительского.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (428,4,0,'Если некоторый член родительского класса не переопределен в дочернем, то к нему можно обращаться как через this, так и через super.<br /><br />Члены класса - как методы, так и поля, не "перетираются" при переопределении методов или при объявлении полей с такими же именами в&nbsp;дочернем классе.&nbsp;Если доступ позволяет, к ним можно обращаться через super.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (429,4,2,'Скомпилируется ли следующий конструктор?<br /><br />public Rabbit(int age) {<br />&nbsp;&nbsp;&nbsp; super();<br />&nbsp;&nbsp;&nbsp; super.setAge(10);<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (998,429,'Да. Первая строка вызывает конструктор родительского класса, значит, на момент выполнения второй строки объект родительского уже готов, и к его членам можно обращаться посредством <strong>super</strong>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (430,4,2,'Перечислите правила (ограничения) при переопределении/скрывании метода.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (999,430,'<strong>0</strong>. Метод не должен быть private.<strong><br />1</strong>. Метод в дочернем классе должен иметь такое же имя и сигнатуру, как и в родительском.<br /><strong>2</strong>. Метод в дочернем классе должен иметь такой же или более широкий модификатор доступа.<br /><strong>3</strong>. Проверяемые (checked) исключения, выбрасываемые методом в дочернем классе, должны совпадать с исключениями родительского класса, либо быть их потомками, либо вообще отсутствовать. Иными словами, список выбрасываемых методом-потомком исключений не может расширяться.<br /><strong>4</strong>. Если метод возвращает значение, оно должно быть того же типа, что и в родительском классе, или быть потомком этого типа (<em>covariant return types</em>). Внимание! Примитивные типы (например, short&gt;int&gt;long) не состоят в отношениях наследования и не могут быть ковариантами.<br /><strong>5</strong>. Методы с той же сигнатурой в родительском и дочернем классе должны быть либо оба <strong>static</strong>, либо оба non-<strong>static</strong>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (431,4,0,'Если метод в дочернем классе по имени и сигнатуре совпадает с методом родительского класса, но имеет другой возвращаемый тип, то будет ошибка компиляции.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (432,4,0,'Если метод явным образом выбрасывает исключение (посредством ключевого слова <strong>throw</strong>), то <strong>return</strong> указывать не нужно - и даже запрещено (<em>unreachable code</em>).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (433,4,0,'private-метод в родительском классе и non-private-метод с той же сигнатурой в дочернем не связаны никакими иерархическими отношениями.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (434,4,2,'Что такое <em>method hiding</em>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1000,434,'Это когда в дочернем классе определяется статичный метод с такой же сигнатурой, как и в родительском (<em>hidden method</em>). Скрывание метода похоже на переопределение.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (435,4,2,'Опишите отличие между переопределением (overriding) и скрыванием (hiding)/');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1001,435,'Переопределение возможно только для <span style="text-decoration: underline;">методов</span> <span style="text-decoration: underline;">экземпляра</span>. Если на объекте вызывается метод, то отработает его самая последняя переопределенная версия, даже если метод вызвался в контексте класса предка (например, из унаследованного, не переопределенного метода или по ссылке типа класса-предка). Единственное исключение - явный вызов родительской версии метода посредством ключевого слова <strong>super</strong>.<br />Скрывание говорит о том, что определенный в потомке&nbsp;метод "скрывает" родительский при вызове, но если контекст родительский, то и метод возьмется из родителя.<br />Опыт показывает, что для методов экземпляра характерно переопределение, а для переменных экземпляра, а также для любых статических членов - скрывание.<br />Однако есть и базовое отличие между скрыванием методов и полей - у последних допускается сужение доступа. Это может привести к тому, что потомок не сможет напрямую обратиться к полю, которое помечено public у его "деда", но заперто на private у "отца".',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (436,4,0,'Методы, помеченные final, нельзя переопределить. Или скрыть!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (437,4,0,'Через <strong>super</strong> можно обратиться не только к методу, но и к переменной родителя.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (438,4,0,'Не надо использовать скрывание переменных в практическом программировании.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (439,4,2,'Что такое абстрактный класс и абстрактный метод?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1002,439,'Абстрактный класс - это класс, который нельзя инстанциировать и который может (но не обязан) иметь абстрактные методы.<br />Абстрактный метод - это метод экземпляра без реализации, который должен переопределяться в потомках. Не имеет фигурных скобок, двоеточие ставится сразу за закрывающей круглой скобкой.<br />Абстрактные класс и метод помечаются модификатором <strong>abstract</strong>.<br />Статических абстрактных методов <span style="text-decoration: underline;">не бывает</span>. (ошибка компиляции)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (440,4,0,'Создатели экзамена&nbsp;очень любят вопросы, где в коде есть абстрактные методы в классах, не помеченных abstract. А еще они любят абстрактные методы с реализацией.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (441,4,0,'<strong>abstract</strong> и <strong>final</strong> - несовместимые модификаторы, так же как <strong>abstract</strong> и <strong>private</strong>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (442,4,2,'Что такое (concrete class)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1003,442,'<em>Concrete class</em> - это первый неабстрактный класс в иерархии. Т.е. в этом классе имплементированы все абстрактные методы.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (443,4,2,'<p>Скомпилируется ли следующий код?<br /><br />public abstract class Animal {<br />&nbsp;&nbsp;&nbsp; public abstract String getName();<br />}</p>
<p>public class Bird extends Animal { }</p>
<p>public class Flamingo extends Bird {<br />&nbsp;&nbsp;&nbsp; public String getName() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "Flamingo";<br />&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1004,443,'Нет. Класс Bird - это concrete class, он обязан имплементировать метод getName().',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (444,4,2,'<p>Скомпилируется ли следующий код?<br /><br />public abstract class Animal {<br />&nbsp;&nbsp;&nbsp; public abstract String getName();<br />}<br />public abstract class BigCat extends Animal {<br />&nbsp;&nbsp;&nbsp; public String getName() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return "BigCat";<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public abstract void roar();<br />}</p>
<p>public class Lion extends BigCat {<br />&nbsp;&nbsp;&nbsp; public void roar() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("The Lion lets out a loud ROAR!");<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1005,444,'Да. Concrete class не обязан имплементировать абстрактный метод, если это уже сделано в промежуточном абстрактном предке.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (445,4,2,'Можно ли объявить абстрактным метод, который имеет реализацию в родителе?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1006,445,'Да, можно.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (446,4,0,'При переопределении абстрактного метода ссылаться на родительскую версию посредством <strong>super</strong> - нельзя (как и на любой другой абстрактный метод в родителе).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (447,4,0,'5 законов абстрактных классов:<br /><br /><strong>1</strong>. Нельзя инстанциировать<br /><strong>2</strong>. Может содержать 0+ абстрактных методов<br /><strong>3</strong>. Не может быть protected, private (как любой класс), final.<br /><strong>4</strong>. Абстрактный наследник наследует все абстрактные методы родителя.<br /><strong>5</strong>. Первый неабстрактный класс в иерархии должен реализовать все абстрактные методы.<br /><br />5 законов абстрактных методов:<br /><br /><strong>1</strong>. Могут быть только в абстрактных классах<br /><strong>2</strong>. Не могут быть private или final<br /><strong>3</strong>. Не могут иметь имплементации (точка с запятой вместо фигурных скобок)<br /><strong>4</strong>. Подчиняются всем правилам переопределения: имя/сигнатура, запрет снижения видимости.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (448,4,2,'Что такое интерфейс?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1007,448,'Интерфейс это абстрактный тип данных, определяющий список абстрактных <span style="text-decoration: underline;">public</span>-методов, которые обязаны быть реализованы любым конкретным классом, имплементирующим интерфейс. (абстрактный класс не обязан делать реализацию)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (449,4,2,'Что может содержать интерфейс?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1008,449,'- определения методов экземпляра (все они abstract и public, даже если не указано явно)<br />- константы (все они public static final, даже если не указано явно)<br />- методы по умолчанию (default)<br />- статичные методы (public, даже если не указано явно)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (450,4,0,'Класс может имплементировать несколько интерфейсов - через запятую.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (451,4,0,'5 правил определения интерфейсов:<br /><br /><strong>1</strong>. Интерфейс не может быть инстанциирован напрямую.<br /><strong>2</strong>. Интерфейс не обязан иметь методы.<br /><strong>3</strong>. Интерфейс не может быть определен как final.<br /><strong>4</strong>. Интерфейсы верхнего уровня, как и классы, могут иметь модификатор доступа public или default. Автоматически имеют модификатор abstract, что не рекомендуется указывать явно.<br /><strong>5</strong>. Все non-default&nbsp; методы интерфейса не могут иметь мофидикаторов private, protected, final.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (452,4,2,'Каковы правила наследования интерфейсов?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1009,452,'1. Используется ключевое слово <strong>extends</strong>.<br />2. Можно наследовать нескольким интерфейсам (через запятую).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (453,4,0,'Если класс имплементирует два интерфейса с одинаковым методом, то ему достаточно реализовать этот метод.<br /><br />Если методы с одним именем, но разной сигнатурой - это расценивается как overloading.<br /><br />Если имя метода и сигнатура совпадают, но тип возвращаемого значения отличается - могут сработать ковариантные типы (если возвращаемые значения из одной иерархии). Тогда имплементирующий класс должен реализовать метод с более узким классом.<br /><br />Если типы несовместимы - ошибка компиляции');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (454,4,0,'<p>При наследовании интерфейсов ковариантные типы - работают!<br /><br />interface Int1 {<br />&nbsp;&nbsp;&nbsp; Object get();<br />}</p>
<p>interface Int2 extends Int1{<br />&nbsp;&nbsp;&nbsp; String get();<br />}<br /><br />Классу, имплементирующему оба интерфейса, достаточно будет реализовать String get().</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (455,4,0,'У класса, имплементирующего интерфейс и не&nbsp;реализующего хотя бы один абстрактный метод, будет ошибка компиляции в строке определения класса.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (456,4,0,'Поскольку переменные интерфейса всегда final, они должны быть определены в момент объявления.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (457,4,2,'Почему не скомпилируются строки данного интерфейса?<br /><br />public interface CanDig {<br />&nbsp;&nbsp;&nbsp; private int MAXIMUM_DEPTH = 100;<br />&nbsp;&nbsp;&nbsp; protected abstract boolean UNDERWATER = false;<br />&nbsp;&nbsp;&nbsp; public static String TYPE;<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1010,457,'1-я строка - потому что <strong>private.<br /></strong>2-я строка<strong> - </strong>потому что <strong>protected</strong> и <strong>abstract</strong>.<br />3-я строка - потому что не определена финальная переменная.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (458,4,2,'Что такое метод по умолчанию в интерфейсе?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1011,458,'Методы по умолчанию (default methods) - это методы, объявленные в интерфейсе с помощью ключевого слова default c обязательным наличием тела метода; это методы с реализацией по умолчанию, их можно переопределять. Они, разумеется, public.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (459,4,0,'Одно из оснований введения в Java интерфейсных методов по умолчанию - облегчение разработки и обеспечение оратной совместимости. Теперь в широко используемый интерфейс можно добавить метод с реализацией по умолчанию, и остальные разработчики не обязаны менять свой код, имплементируя новый метод.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (460,4,0,'4 правила методов по умолчанию:<br /><br /><strong>1</strong>. Может быть объявлен только внутри интерфейса.<br /><strong>2</strong>. Должен иметь модификатор <strong>default</strong> и тело метода.<br /><strong>3</strong>. Не может быть <strong>static</strong>, <strong>final</strong> или <strong>abstract</strong>.<br />4. Является <strong>public</strong> и не может быть помечен как <strong>private</strong> или <strong>protected</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (461,4,0,'У интерфейса не может быть статичных <span style="text-decoration: underline;">дефолтных</span> методов (а обычные могут быть статичными)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (462,4,2,'Можно ли помечать абстрактными унаследованные методы с реализацией?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1012,462,'Да. Если абстрактный класс наследует конкретный метод от другого класса или дефолтный метод от интерфейса, он может объявить его абстрактным. Аналогично интерфейс, наследующий дефолтный метод, может объявить его абстрактным.<br />',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (463,4,0,'Если класс реализует несколько интерфейсов с одинаковым методом, и хотя бы в одном метод абстрактный, то надо обеспечить его реализацию (дефолтные методы из других интерфейсов не подтянутся). Аналогично при наследовании абстрактного метода из абстрактного класса его придется переопределять даже при наличии дефолтного в интерфейсе.<br /><br />И еще . Нельзя имплементировать два интерфейса с одним и тем же дефолтным методом и не переопределить его. Либо упомянутые интерфейсы должны наследовать один от другого.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (464,4,0,'При наследовании интерфейсов ковариантные типы в дефолтных методах работают. (равно как и при реализации метода интерфейса).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (465,4,2,'Чем отличается статический метод в интерфейсе от статического метода в классе?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1013,465,'1. Всегда public.<br />2. Не наследуется классами, реализующими интерфейс - требуется явно ссылаться на имя интерфейса. Доступа к методу нет, даже если переменная типа интерфейса или если статический метод вызывается из метода экземпляра.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (466,4,0,'Переменные в интерфейсе доступны не только с имени интерфейса, но и с ссылки на объект, реализующий интерфейс.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (467,4,2,'Может ли один класс имплементировать два интерфейса, если в каждом из них оъявлен один и тот же статический метод?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1014,467,'Да. Статические методы интерфейсов не наследуются классами, поэтому конфликта не будет.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (468,4,2,'Опишите явление полиморфизма.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1015,468,'Полиморфизм - это, по сути, способность одного и то же объекта выступать в разных обличьях. Это значит, что ссылаться на один и тот же объект могут ссылки разных классов и интерфейсов, если они есть в дереве наследования/имплементации. Эти ссылки будут иметь доступ к тем членам класса, о которых они знают. Если при этом речь идет о методе экземпляра, то всегда будет вызываться последний переопределенный.<br /><br />Характерной чертой полиморфизма явлется способность присваивать объект ссылке, вышестоящей в иерархии (кастинг не нужен) или нижестоящей (кастинг требуется). С этой способностью связан принцип "полиморфных параметров", когда благодаря неявному кастингу мы можем подавать объект в метод, который ожидает тип суперкласса или интерфейса).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (469,4,0,'4 правила кастинга ссылочных типов:<br /><br /><strong>1</strong>. Кастинг объекта к вышестоящему классу происходит неявно.<br /><strong>2</strong>. Кастинг объекта к нижестоящему классу должен быть указан явно.<br /><strong>3</strong>. Кастинг объектов из разных ветвей иерархии (т.е. если попасть от одного к другому можно только, продвинувшись по дереву наследования вверх и вниз) не допускается компилятором.<br /><strong>4</strong>. Даже если код компилируется нормально, во время выполнения может быть ошибка применения кастинга.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (470,4,2,'Как обезопасить себя от ClassCastException в рантайме?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1016,470,'Использовать <strong>instanceof</strong>:<br /><br />if(rodent instanceof Capybara) {<br />&nbsp;&nbsp;&nbsp; Capybara capybara = (Capybara)rodent;<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (471,4,2,'Что такое виртуальные методы в Java?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1017,471,'Виртуальный метод (<em>virtual method</em>) - это метод, реализация которого не установлена до момента старта программы. Фактически - это все не-финальные, не-статические и не-приватные методы в Java. Компилятор не может предсказать, какой именно реализованный метод будет запущен при обращении к нему по ссылке. По факту - самый ближний переопределенный метод в классе.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (472,4,1,'What modifiers are implicitly applied to all interface methods? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1018,472,'protected',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1019,472,'public',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1020,472,'static',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1021,472,'void',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1022,472,'abstract',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1023,472,'default',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (473,4,1,'What is the output of the following code?<br /><br />1: class Mammal {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public Mammal(int age) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("Mammal");<br />4:&nbsp;&nbsp;&nbsp;&nbsp; }<br />5: }<br />6: public class Platypus extends Mammal {<br />7:&nbsp;&nbsp;&nbsp;&nbsp; public Platypus() {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("Platypus");<br />9:&nbsp;&nbsp;&nbsp;&nbsp; }<br />10:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Mammal(5);<br />12:&nbsp;&nbsp;&nbsp; }<br />13:}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1024,473,'Platypus',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1025,473,'Mammal',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1026,473,'PlatypusMammal',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1027,473,'MammalPlatypus',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1028,473,'The code will not compile because of line 7.',true,'У дочернего класса нет вызова конструктора родительского, в котором нет конструктора по умолчанию.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1029,473,'The code will not compile because of line 11.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (474,4,1,'Which of the following statements can be inserted in the blank line so that the code will compile successfully? (Choose all that apply)<br /><br />public interface CanHop {}<br />public class Frog implements CanHop {<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _________ frog = new TurtleFrog();<br />&nbsp;&nbsp;&nbsp; }<br />}<br />public class BrazilianHornedFrog extends Frog {}<br />public class TurtleFrog extends Frog {}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1030,474,'Frog',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1031,474,'TurtleFrog',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1032,474,'BrazilianHornedFrog',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1033,474,'CanHop',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1034,474,'Object',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1035,474,'Long',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (475,4,1,'Which statement(s) are correct about the following code? (Choose all that apply)<br /><br />public class Rodent {<br />&nbsp;&nbsp;&nbsp; protected static Integer chew() throws Exception {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Rodent is chewing");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br />&nbsp;&nbsp;&nbsp; }<br />}<br />public class Beaver extends Rodent {<br />&nbsp;&nbsp;&nbsp; public Number chew() throws RuntimeException {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Beaver is chewing on wood");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 2;<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1040,475,'It fails to compile because of a static modifier mismatch between the two methods.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1036,475,'It will compile without issue.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1037,475,'It fails to compile because the type of the exception the method throws is a subclass of the type of exception the parent method throws.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1038,475,'It fails to compile because the return types are not covariant.',true,'При скрывании метода действуют те же правила, что при переопределении: нельзя ослаблять доступ, должны быть ковариантные типы, нельзя выбрасывать больше исключений');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1039,475,'It fails to compile because the method is protected in the parent class and public in the subclass.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (476,4,1,'Which of the following may only be hidden and not overridden? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1041,476,'private instance methods',true,'private-члены считаются скрытыми изначально');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1042,476,'protected instance methods',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1043,476,'public instance methods',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1044,476,'static methods',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1045,476,'public variables',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1046,476,'private variables',true,'private-члены считаются скрытыми изначально');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (477,4,1,'Choose the correct statement about the following code:<br /><br />1: interface HasExoskeleton {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; abstract int getNumberOfSections();<br />3: }<br />4: abstract class Insect implements HasExoskeleton {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; abstract int getNumberOfLegs();<br />6: }<br />7: public class Beetle extends Insect {<br />8:&nbsp;&nbsp;&nbsp;&nbsp; int getNumberOfLegs() { return 6; }<br />9: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1047,477,'It compiles and runs without issue.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1048,477,'The code will not compile because of line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1049,477,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1050,477,'The code will not compile because of line 7.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1051,477,'It compiles but throws an exception at runtime.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (478,4,1,'Which of the following statements about polymorphism are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1056,478,'By defining a public instance method in the superclass, you guarantee that the specific method will be called in the parent class at runtime.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1052,478,'A reference to an object may be cast to a subclass of the object without an explicit cast.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1053,478,'If a method takes a superclass of three objects, then any of those classes may be passed as a parameter to the method.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1054,478,'A method that takes a parameter with type java.lang.Object will take any reference.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1055,478,'All cast exceptions can be detected at compile-time.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (479,4,1,'Choose the correct statement about the following code:<br /><br />1: public interface Herbivore {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; int amount = 10;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public static void eatGrass();<br />4:&nbsp;&nbsp;&nbsp;&nbsp; public int chew() {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 13;<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1057,479,'It compiles and runs without issue.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1058,479,'The code will not compile because of line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1059,479,'The code will not compile because of line 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1060,479,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1061,479,'The code will not compile because of lines 2 and 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1062,479,'The code will not compile because of lines 3 and 4.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (480,4,1,'Choose the correct statement about the following code:<br /><br />1: public interface CanFly {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; void fly();<br />3: }<br />4: interface HasWings {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public abstract Object getWindSpan();<br />6: }<br />7: abstract class Falcon implements CanFly, HasWings {<br />8: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1063,480,'It compiles without issue.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1064,480,'The code will not compile because of line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1065,480,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1066,480,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1067,480,'The code will not compile because of lines 2 and 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1068,480,'The code will not compile because the class Falcon doesn&rsquo;t implement the interface methods.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (481,4,1,'Which statements are true for both abstract classes and interfaces? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1072,481,'Both can contain default methods.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1073,481,'Both can contain static methods.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1074,481,'Neither can be instantiated directly.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1075,481,'Both inherit java.lang.Object.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1069,481,'All methods within them are assumed to be abstract.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1070,481,'Both can contain public static final variables.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1071,481,'Both can be extended using the extends keyword.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (482,4,1,'What modifiers are assumed for all interface variables? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1076,482,'public',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1077,482,'protected',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1078,482,'private',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1079,482,'static',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1080,482,'final',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1081,482,'abstract',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (483,4,1,'<p>What is the output of the following code?</p>
<p>1: interface Nocturnal {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; default boolean isBlind() { return true; }<br />3: }<br />4: public class Owl implements Nocturnal {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public boolean isBlind() { return false; }<br />6:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nocturnal nocturnal = (Nocturnal)new Owl();<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(nocturnal.isBlind());<br />9:&nbsp;&nbsp;&nbsp;&nbsp; }<br />10:}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1082,483,'true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1083,483,'false',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1084,483,'The code will not compile because of line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1085,483,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1086,483,'The code will not compile because of line 7.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1087,483,'The code will not compile because of line 8.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (484,4,1,'<p>What is the output of the following code?</p>
<p>1: class Arthropod {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public void printName(double input) { System.out<br />&nbsp;&nbsp;&nbsp; .print("Arthropod"); }<br />3: }<br />4: public class Spider extends Arthropod {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public void printName(int input) { System.out.print("Spider"); }<br />6:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Spider spider = new Spider();<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spider.printName(4);<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spider.printName(9.0);<br />10:&nbsp;&nbsp;&nbsp; }<br />11: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1088,484,'SpiderArthropod',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1089,484,'ArthropodSpider',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1090,484,'SpiderSpider',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1091,484,'ArthropodArthropod',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1092,484,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1093,484,'The code will not compile because of line 9.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (485,4,1,'<p>Which statements are true about the following code? (Choose all that apply)</p>
<p>1: interface HasVocalCords {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public abstract void makeSound();<br />3: }<br />4: public interface CanBark extends HasVocalCords {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public void bark();<br />6: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1094,485,'The CanBark interface doesn&rsquo;t compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1095,485,'A class that implements HasVocalCords must override the makeSound() method.',false,'Не обязан, т.к. может быть абстрактным.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1096,485,'A class that implements CanBark inherits both the makeSound() and bark() methods.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1097,485,'A class that implements CanBark only inherits the bark() method.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1098,485,'An interface cannot extend another interface.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (486,4,1,'Which of the following is true about a concrete subclass? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1099,486,'A concrete subclass can be declared as abstract.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1100,486,'A concrete subclass must implement all inherited abstract methods.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1101,486,'A concrete subclass must implement all methods defined in an inherited interface.',false,'Не обязан, т.к. методы интерфейса уже могли быть имплементированы в родительском классе; к тому же, у интерфейса есть дефолтные методы, которые не требуется переопределять.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1102,486,'A concrete subclass cannot be marked as final.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1103,486,'Abstract methods cannot be overridden by a concrete subclass.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (487,4,1,'<p>What is the output of the following code?</p>
<p>1: abstract class Reptile {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public final void layEggs() { System.out.println("Reptile laying eggs");<br />&nbsp;&nbsp; }<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Reptile reptile = new Lizard();<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reptile.layEggs();<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7: }<br />8: public class Lizard extends Reptile {<br />9:&nbsp;&nbsp;&nbsp;&nbsp; public void layEggs() { System.out.println("Lizard laying eggs"); }<br />10: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1104,487,'Reptile laying eggs',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1105,487,'Lizard laying eggs',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1106,487,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1107,487,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1108,487,'The code will not compile because of line 9.',true,'Нельзя переопределять финальный метод.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (488,4,1,'<p>What is the output of the following code?</p>
<p>1: public abstract class Whale {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public abstract void dive() {};<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Whale whale = new Orca();<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; whale.dive();<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7: }<br />8: class Orca extends Whale {<br />9:&nbsp;&nbsp;&nbsp;&nbsp; public void dive(int depth) { System.out.println("Orca diving"); }<br />10: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1109,488,'Orca diving',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1110,488,'The code will not compile because of line 2.',true,'у абстрактного метода не может быть тела');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1111,488,'The code will not compile because of line 8.',true,'класс не имплеметирует метод dive()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1112,488,'The code will not compile because of line 9.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1113,488,'The output cannot be determined from the code provided.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (489,4,1,'<p>What is the output of the following code? (Choose all that apply)</p>
<p>1: interface Aquatic {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public default int getNumberOfGills(int input) { return 2; }<br />3: }<br />4: public class ClownFish implements Aquatic {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public String getNumberOfGills() { return "4"; }<br />6:&nbsp;&nbsp;&nbsp;&nbsp; public String getNumberOfGills(int input) { return "6"; }<br />7:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(new ClownFish().getNumberOfGills(-1));<br />9:&nbsp;&nbsp;&nbsp;&nbsp; }<br />10: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1114,489,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1115,489,'4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1116,489,'6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1117,489,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1118,489,'The code will not compile because of line 6.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1119,489,'The code will not compile because of line 8.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (490,4,1,'<p>Which of the following statements can be inserted in the blank so that the code will compile successfully? (Choose all that apply)</p>
<p>public class Snake {}<br />public class Cobra extends Snake {}<br />public class GardenSnake {}<br />public class SnakeHandler {<br />&nbsp;&nbsp;&nbsp; private Snake snake;<br />&nbsp;&nbsp;&nbsp; public void setSnake(Snake snake) { this.snake = snake; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new SnakeHandler().setSnake(________);<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1120,490,'new Cobra()',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1121,490,'new GardenSnake()',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1122,490,'new Snake()',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1123,490,'new Object()',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1124,490,'new String("Snake")',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1125,490,'null',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (491,4,1,'<p>What is the result of the following code?</p>
<p>1: public abstract class Bird {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; private void fly() { System.out.println("Bird is flying"); }<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bird bird = new Pelican();<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bird.fly();<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7: }<br />8: class Pelican extends Bird {<br />9:&nbsp;&nbsp;&nbsp;&nbsp; protected void fly() { System.out.println("Pelican is flying"); }<br />10: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1126,491,'Bird is flying',true,'Метод fly() в Bird объявлен private, это означает, что его нельзя переопределить, только скрыть. А скрытие означает, что запустится тот метод, который актуален для контекста вызова (полиморфизм не работает). В данном случае контекст вызова - Bird, т.к. используется ссылка этого типа.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1127,491,'Pelican is flying',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1128,491,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1129,491,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1130,491,'The code will not compile because of line 9.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (492,4,0,'При написании кода мы решаем, что делать с исключительными ситуациями - разбираться с ними самостоятельно или предоставлять это вызывающему методу.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (493,4,0,'Исключение по сути своей - это событие, изменяющее ход выполнения программы. Все такие события восходят к классу java.lang.<span style="text-decoration: underline;"><em>Throwable</em></span>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (494,4,2,'Опишите общую иерархию классов исключений.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1131,494,'java.lang.<strong>Object</strong><br />-- java.lang.<strong>Throwable</strong><br />-- -- java.lang.<strong>Exception</strong><br />-- -- -- java.lang.<strong>RuntimeException</strong><br />-- -- java.lang.<strong>Error</strong>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (495,4,0,'java.lang.<strong>Error</strong> - это нечто столь ужасное, после чего программа уже не надеется восстановиться. В реальной жизни встречается редко.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (496,4,2,'Что такое проверяемое исключение?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1132,496,'Проверяемое исключение (<em>checked exception</em>) - это исключение, отражающее исключительную ситуацию, которую можно предвидеть на этапе написания кода и, соответственно, нужно обработать. Это java.lang.<strong>Exception</strong> и все его потомки, <span style="text-decoration: underline;">кроме java.lang.RuntimeException</span>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (497,4,2,'Что такое непроверяемое исключение?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1133,497,'Непроверяемое исключение (<em>unchecked exception</em>) - это исключение, которое невозможно было предвидеть на этапе написания кода. Отражает классическую программную ошибку (баг). Реализуется классом java.lang.<strong>RuntimeException</strong> и всеми его потомками.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (498,4,2,'Что представляет собой правило "обрабатывай или объявляй"?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1134,498,'Правило <em>handle or declare</em> говорит о том, что для <span style="text-decoration: underline;">проверяемых исключений</span> требуется либо написать обработчик, либо объявить в сигнатуре метода, что он может выдать такое исключение.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (499,4,2,'Каков синтаксис для выдачи исключений методом?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1135,499,'void fall() throws Exception1, Exception2 {<br />&nbsp;&nbsp;&nbsp; if (condition1)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; throw new Exception1();<br />&nbsp;&nbsp;&nbsp; else if (condition2)<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; throw new Exception2();<br />&nbsp;&nbsp;&nbsp; else<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //some code<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (500,4,0,'Существует мнение, что без проверяемых исключений вообще можно обойтись. Очень часто люди предпочитают не обрабатывать проверяемые исключения, а просто выдавать непроверяемые.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (501,4,0,'На экзамене OCA будут либо уже имеющиеся в Java исключения, либо придуманные специально для вопросов. Знать API и особенности существующих исключений не надо, вопросы будут только на синтаксис и иерархию.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (502,4,0,'При создании исключений посредством throw можно в конструкторе указывать текстовое сообщение:<br /><br />&nbsp;throw new Exception("Ow! I fell.");<br /><br />Это соглашение, а не правило. Можно представить ситуацию, что создатель класса-исключения не предусмотрит конструктора, принимающего произвольную строку.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (503,4,2,'Охарактеризуйте три основных разновидности Throwable с точки зрения<br />1) иерархии<br />2) возможности поймать<br />3) обязательности handle or declare');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1136,503,'I. Непроверяемые исключения<br />1) java.lang.RuntimeException и подклассы<br />2) можно поймать<br />3) не нужно handle or declare<br /><br />II. Проверяемые исключения<br />1) java.lang.Exception и подклассы, кроме RuntimeException<br />2) можно поймать<br />3) нужно handle or declare<br /><br />III. Ошибки<br />1) Error и подклассы<br />2) нельзя поймать<br />3) не нужно handle or declare',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (504,4,2,'Опишите синтаксис try-catch-finally');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1137,504,'<strong>try</strong> {<br />&nbsp;&nbsp;&nbsp; // блок кода, в котором может быть исключение<br />&nbsp;&nbsp;&nbsp; // (также называется protected code)<br />} <strong>catch</strong> (<span style="text-decoration: underline;">ExceptionType1</span> <em>exRef</em>) {<br />&nbsp;&nbsp;&nbsp; // код, обрабатывающий исключение<br />} [<strong>catch</strong> (<span style="text-decoration: underline;">ExceptionType2</span> <em>exRef</em>) {<br />&nbsp;&nbsp;&nbsp; // код, обрабатывающий исключение<br />}] <strong>finally</strong> {<br />&nbsp;&nbsp;&nbsp; // код, который выполняется всегда, независимо от того,<br />&nbsp;&nbsp;&nbsp; // встретилось ли исключение<br />}<br /><br />Фигурные скобки <span style="text-decoration: underline;">обязательны</span>.<br />Наличие catch и/или finally (только в таком порядке) <span style="text-decoration: underline;">обязательно</span>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (505,4,0,'<strong>try</strong> не может использоваться без <strong>catch</strong> или <strong>finally</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (506,4,1,'Отметьте примеры кода, которые скомпилируются.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1138,506,'try {<br />&nbsp;&nbsp;&nbsp; fall();<br />} finally {<br />&nbsp;&nbsp;&nbsp; System.out.println("all better");<br />} catch (Exception e) {<br />&nbsp;&nbsp;&nbsp; System.out.println("get up");<br />}',false,'неверный порядок catch/finally');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1139,506,'try {<br />&nbsp;&nbsp;&nbsp; fall();<br />}',false,'try без catch и/или finally');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1140,506,'try {<br />&nbsp;&nbsp;&nbsp; fall();<br />} finally {<br />&nbsp;&nbsp;&nbsp; System.out.println("all better");<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (507,4,2,'Каким будет результат работы следующего кода?<br /><br />String s = "";<br />try {<br />&nbsp;&nbsp;&nbsp; s += "t";<br />} catch(Exception e) {<br />&nbsp;&nbsp;&nbsp; s += "c";<br />} finally {<br />&nbsp;&nbsp;&nbsp; s += "f";<br />}<br />s += "a";<br />System.out.print(s);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1141,507,'tfa',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (508,4,0,'Если в блоках try или catch вызывается метод System.exit(int), то блок finally не отрабатывает.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (509,4,0,'Если имеется несколько блоков <strong>catch</strong>, то компилятор просматривает их в порядке появления. Если какой-либо из блоков <strong>catch</strong> недостижим (например, сначала ловится родительский класс, а потом дочерний) - будет ошибка компиляции');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (510,4,2,'Когда порядок исключений в блоках catch не важен?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1142,510,'Когда исключения не связаны иерархически.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (511,4,0,'В примере<br /><br />26: try {<br />27:&nbsp;&nbsp;&nbsp;&nbsp; throw new RuntimeException();<br />28: } catch (RuntimeException e) {<br />29:&nbsp;&nbsp;&nbsp;&nbsp; throw new RuntimeException();<br />30: } finally {<br />31:&nbsp;&nbsp;&nbsp;&nbsp; throw new Exception();<br />32: }<br /><br />происходит следующее. Блок <strong>catch</strong> выбрасывает исключение. Однако блок <strong>finally</strong> отрабатывает сразу после <strong>catch</strong> и выбрасывает собственное исключение. В результате исключение из <strong>catch</strong> теряется! Выход - обрабатывать исключения в коде <strong>finally</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (512,4,2,'Каким будет результат работы следующего кода?<br /><br />30: public String exceptions() {<br />31:&nbsp;&nbsp;&nbsp;&nbsp; String result = "";<br />32:&nbsp;&nbsp;&nbsp;&nbsp; String v = null;<br />33:&nbsp;&nbsp;&nbsp;&nbsp; try {<br />34:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />35:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result += "before";<br />36:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; v.length();<br />37:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result += "after";<br />38:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (NullPointerException e) {<br />39:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result += "catch";<br />40:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new RuntimeException();<br />41:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } finally {<br />42:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result += "finally";<br />43:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new Exception();<br />44:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />45:&nbsp;&nbsp;&nbsp;&nbsp; } catch (Exception e) {<br />46:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result += "done";<br />47:&nbsp;&nbsp;&nbsp;&nbsp; }<br />48:&nbsp;&nbsp;&nbsp;&nbsp; return result;<br />49: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1143,512,'beforecatchfinallydone',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (513,4,0,'Список наиболее популярных непроверяемых исключений:<br /><br /><strong>ArithmeticException</strong> <br />Порождается JVM при делении на ноль<br /><strong>ArrayIndexOutOfBoundsException</strong> <br />Порождается JVM при попытке обращению к массиву по несуществующему индексу<br /><strong>ClassCastException</strong> <br />Порождается JVM при попытке осуществить кастинг объекта в типу, которым тот не является<br /><strong>IllegalArgumentException</strong> <br />Порождается программистом при передаче в метод невалидного аргумента:<br />public void setNumberEggs(int numberEggs) {<br />&nbsp;&nbsp;&nbsp; if (numberEggs &lt; 0)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new IllegalArgumentException(<br />&nbsp;&nbsp;&nbsp; "# eggs must not be negative");<br />&nbsp;&nbsp;&nbsp; this.numberEggs = numberEggs;<br />}<br /><strong>NullPointerException</strong> <br />Порождается JVM при попытке обращения к методам пустой ссылки<br /><strong>NumberFormatException&nbsp;</strong>(подкласс IllegalArgumentException) <br />Порождается программистом при попытке преобразовать к числу строку в неверном формате.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (514,4,0,'<p>Часто встречающиеся проверяемые исключения:<br /><br /><strong>FileNotFoundException</strong> (подкласс IOException)<br />Порождаются программно, если код пытается обратиться к файлу, которого нет.<br /><strong>IOException</strong> <br />Порождаются программно, если при чтении из файла/записи в файл возникают проблемы.</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (515,4,0,'Часто встречающиеся <span style="text-decoration: underline;">ошибки</span>:<br /><br /><strong>ExceptionInInitializerError</strong> <br />Порождаются JVM, если в статическом инициализаторе возникает и не обрабатывается исключение. В этом случае класс нельзя использовать:<br />Exception in thread "main" java.lang.ExceptionInInitializerError<br />Caused by: java.lang.ArrayIndexOutOfBoundsException: -1<br /><strong>StackOverflowError</strong> <br />Порождаются JVM при бесконечной рекурсии<br /><strong>NoClassDefFoundError</strong> <br />Порождаются JVM, если класс, используемый кодом доступен на этапе компиляции, но не виден в рантайме.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (516,4,2,'Скомпилируется ли следующий код?<br /><br />class NoMoreCarrotsException extends Exception {}<br />public class Bunny {<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eatCarrot();<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; private static void eatCarrot() throws NoMoreCarrotsException {}<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1144,516,'Нет. В методе main проверяемое исключение должно либо обрабатываться:<br />public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp; try {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eatCarrot();<br />&nbsp;&nbsp;&nbsp; } catch (NoMoreCarrotsException e ) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("sad rabbit");<br />&nbsp;&nbsp;&nbsp; }<br />}<br />либо объявляться:<br />public static void main(String[] args) throws NoMoreCarrotsException {<br />&nbsp;&nbsp;&nbsp; eatCarrot();<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (517,4,2,'Скомпилируется ли следующий код?<br /><br />class NoMoreCarrotsException extends Exception {}<br />public class Bunny {<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; try {<br />&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; eatCarrot();<br />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; } catch (NoMoreCarrotsException e ) {<br />&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; System.out.print("sad rabbit");<br />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; private static void eatCarrot() {}<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1145,517,'Нет. В методе main производится попытка обработать <span style="text-decoration: underline;">проверяемое</span> исключение, которое не продуцируется методом eatCarrot(). Поэтому компилятор детектирует недостижимый код.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (518,4,2,'Скомпилируется ли следующий код?<br /><br />class CanNotHopException extends Exception { }<br />class Hopper {<br />&nbsp;&nbsp;&nbsp; public void hop() { }<br />}<br />class Bunny extends Hopper {<br />&nbsp;&nbsp;&nbsp; public void hop() throws CanNotHopException { }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1146,518,'Нет. Переопределенный метод не имеет права вводить новые или расширять имеющиеся в родительском методе исключения.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (519,4,2,'Скомпилируется ли следующий код?<br /><br />class CanNotHopException extends Exception { }<br />class Hopper {<br />&nbsp;&nbsp;&nbsp; public void hop() throws Exception { }<br />}<br />class Bunny extends Hopper {<br />&nbsp;&nbsp;&nbsp; public void hop() throws CanNotHopException { }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1147,519,'Да. Переопределенный класс имеет право порождать исключения, являющиеся подклассами исключений, порождаемых в родительском классе.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (520,4,2,'Скомпилируется ли следующий код?<br /><br />class Hopper {<br />&nbsp;&nbsp;&nbsp; public void hop() { }<br />}<br />class Bunny extends Hopper {<br />&nbsp;&nbsp;&nbsp; public void hop() throws IllegalStateException { }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1148,520,'Да. IllegalStateException - это проверяемое исключение, поэтому его не нужно специально декларировать/обрабатывать.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (521,4,2,'Назовите 3 способа печати исключения (например, при обработке):');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1149,521,'<strong>1</strong>. Просто напечатать в консоль:<br />System.out.println(ex);<br />По умолчанию должен напечататься тип исключение и сообщение об ошибке.<br /><strong><br />2</strong>. Напечатать в консоль только сообщение об ошибке:<br />System.out.println(ex.getMessage());<br /><strong><br />3</strong>. Напечатать в консоль всю доступную информацию, включая стек исключения:<br />ex.printStackTrace();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (522,4,1,'Which of the following statements are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1152,522,'You can declare only checked exceptions.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1153,522,'You can declare only unchecked exceptions.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1154,522,'You can handle only Exception subclasses.',false,'Можно обрабатывать и подклассы Error но это плохая идея.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1150,522,'Runtime exceptions are the same thing as checked exceptions.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1151,522,'Runtime exceptions are the same thing as unchecked exceptions.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (523,4,0,'Мы можем объявлять непроверяемое исключение, но обрабатывать его в вызывающем методе не обязаны.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (524,4,1,'<p>Which of the following pairs fill in the blanks to make this code compile? (Choose all that apply)</p>
<p>7: public void ohNo() _____ Exception {<br />8: _____________ Exception();<br />9: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1155,524,'On line 7, fill in throw',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1156,524,'On line 7, fill in throws',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1157,524,'On line 8, fill in throw',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1158,524,'On line 8, fill in throw new',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1159,524,'On line 8, fill in throws',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1160,524,'On line 8, fill in throws new',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (525,4,1,'When are you required to use a finally block in a regular try statement (not a try-withresources)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1161,525,'Never.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1162,525,'When the program code doesn&rsquo;t terminate on its own.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1163,525,'When there are no catch blocks in a try statement.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1164,525,'When there is exactly one catch block in a try statement.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1165,525,'When there are two or more catch blocks in a try statement.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (526,4,1,'<p>Which exception will the following throw?</p>
<p>Object obj = new Integer(3);<br />String str = (String) obj;<br />System.out.println(str);</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1168,526,'IllegalArgumentException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1169,526,'NumberFormatException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1170,526,'None of the above.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1166,526,'ArrayIndexOutOfBoundsException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1167,526,'ClassCastException',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (527,4,1,'Which of the following exceptions are thrown by the JVM? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1171,527,'ArrayIndexOutOfBoundsException',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1172,527,'ExceptionInInitializerError',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1173,527,'java.io.IOException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1174,527,'NullPointerException',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1175,527,'NumberFormatException',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (528,4,1,'What will happen if you add the statement System.out.println(5 / 0); to a working main() method?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1176,528,'It will not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1177,528,'It will not run.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1178,528,'It will run and throw an ArithmeticException.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1179,528,'It will run and throw an IllegalArgumentException.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1180,528,'None of the above.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (529,4,1,'<p>What is printed besides the stack trace caused by the NullPointerException from line 16?</p>
<p>1: public class DoSomething {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public void go() {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("A");<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stop();<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (ArithmeticException e) {<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("B");<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } finally {<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("C");<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("D");<br />12:&nbsp;&nbsp;&nbsp; }<br />13:&nbsp;&nbsp;&nbsp; public void stop() {<br />14:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("E");<br />15:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Object x = null;<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x.toString();<br />17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("F");<br />18:&nbsp;&nbsp;&nbsp; }<br />19:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />20:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new DoSomething().go();<br />21:&nbsp;&nbsp;&nbsp; }<br />22: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1184,529,'AECD',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1185,529,'No output appears other than the stack trace.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1181,529,'AE',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1182,529,'AEBCD',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1183,529,'AEC',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (530,4,1,'<p>What is the output of the following snippet, assuming a and b are both 0?</p>
<p>3: try {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; return a / b;<br />5: } catch (RuntimeException e) {<br />6:&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br />7: } catch (ArithmeticException e) {<br />8:&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br />9: } finally {<br />10:&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("done");<br />11: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1186,530,'-1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1187,530,'0',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1188,530,'done-1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1189,530,'done0',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1190,530,'The code does not compile.',true,'т.к. сначала ловится родительский класс, а потом дочерний');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1191,530,'An uncaught exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (531,4,1,'<p>What is the output of the following program?</p>
<p>1: public class Laptop {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public void start() {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("Starting up ");<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new Exception();<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (Exception e) {<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("Problem ");<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.exit(0);<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } finally {<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("Shutting down ");<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />12:&nbsp;&nbsp;&nbsp; }<br />13:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />14:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Laptop().start();<br />15: } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1192,531,'Starting up',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1193,531,'Starting up Problem',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1194,531,'Starting up Problem Shutting down',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1195,531,'Starting up Shutting down',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1196,531,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1197,531,'An uncaught exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (532,4,1,'<p>What is the output of the following program?</p>
<p>1: public class Dog {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public String name;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public void parseName() {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("1");<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("2");<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int x = Integer.parseInt(name);<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("3");<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (NumberFormatException e) {<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("4");<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />12:&nbsp;&nbsp;&nbsp; }<br />13:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />14:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Dog leroy = new Dog();<br />15:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leroy.name = "Leroy";<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leroy.parseName();<br />17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("5");<br />18: } }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1200,532,'1235',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1201,532,'124',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1202,532,'1245',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1203,532,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1204,532,'An uncaught exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1198,532,'12',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1199,532,'1234',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (533,4,1,'<p>What is the output of the following program?</p>
<p>1: public class Cat {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public String name;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public void parseName() {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("1");<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("2");<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int x = Integer.parseInt(name);<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("3");<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (NullPointerException e) {<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("4");<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("5");<br />13:&nbsp;&nbsp;&nbsp; }<br />14:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />15:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cat leo = new Cat();<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leo.name = "Leo";<br />17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; leo.parseName();<br />18:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("6");<br />19:&nbsp;&nbsp;&nbsp; }<br />20: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1205,533,'12, followed by a stack trace for a NumberFormatException',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1206,533,'124, followed by a stack trace for a NumberFormatException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1207,533,'12456',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1208,533,'1256, followed by a stack trace for a NumberFormatException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1209,533,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1210,533,'An uncaught exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (534,4,1,'What is printed by the following? (Choose all that apply)<br /><br />1: public class Mouse {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public String name;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public void run() {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("1");<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("2");<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name.toString();<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("3");<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (NullPointerException e) {<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("4");<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw e;<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />13:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("5");<br />14:&nbsp;&nbsp;&nbsp; }<br />15:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mouse jerry = new Mouse();<br />17:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jerry.run();<br />18:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("6");<br />19: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1216,534,'6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1217,534,'The stack trace for a NullPointerException',true,'Если программа заканчивается непойманным исключением, то печатается стек');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1211,534,'1',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1212,534,'2',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1213,534,'3',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1214,534,'4',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1215,534,'5',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (535,4,1,'Which of the following statements are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1218,535,'You can declare a method with Exception as the return type.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1219,535,'You can declare any subclass of Error in the throws part of a method declaration.',true,'объявлять можно все, что можно породить (throw). Породить можно все, что является Throwable');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1220,535,'You can declare any subclass of Exception in the throws part of a method declaration.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1221,535,'You can declare any subclass of Object in the throws part of a method declaration.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1222,535,'You can declare any subclass of RuntimeException in the throws part of a method declaration.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (536,4,0,'Класс <strong>Error</strong> и его потомков, объявленных в сигнатуре метода, вызывающий метод обрабатывать не обязан. <strong>Throwable</strong> и его потомков, кроме ветвей <strong>Error</strong> и <strong>RuntimeException</strong> - обязан.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (537,4,1,'Which of the following can be inserted on line 8 to make this code compile? (Choose all that apply)<br /><br />7: public void ohNo() throws IOException {<br />8:&nbsp;&nbsp;&nbsp;&nbsp; // INSERT CODE HERE<br />9: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1223,537,'System.out.println("it''s ok");',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1224,537,'throw new Exception();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1225,537,'throw new IllegalArgumentException();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1226,537,'throw new java.io.IOException();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1227,537,'throw new RuntimeException();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (538,4,1,'Which of the following are unchecked exceptions? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1232,538,'Any exception that extends RuntimeException',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1233,538,'&nbsp;Any exception that extends Exception',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1228,538,'ArrayIndexOutOfBoundsException',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1229,538,'IllegalArgumentException',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1230,538,'IOException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1231,538,'NumberFormatException',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (539,4,1,'Which scenario is the best use of an exception?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1234,539,'An element is not found when searching a list.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1235,539,'An unexpected parameter is passed into a method.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1236,539,'The computer caught fire.',false,'Бежать надо, а не исключения программировать');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1237,539,'You want to loop through a list.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1238,539,'You don&rsquo;t know how to code a method.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (540,4,1,'<p>Which of the following can be inserted into Lion to make this code compile? (Choose all that apply)</p>
<p>class HasSoreThroatException extends Exception {}<br />class TiredException extends RuntimeException {}<br />interface Roar {<br />&nbsp;&nbsp;&nbsp; void roar() throws HasSoreThroatException;<br />}<br />class Lion implements Roar {// INSERT CODE HERE<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1239,540,'public void roar(){}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1240,540,'public void roar() throws Exception{}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1241,540,'public void roar() throws HasSoreThroatException{}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1242,540,'public void roar() throws IllegalArgumentException{}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1243,540,'public void roar() throws TiredException{}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (541,4,1,'Which of the following are true? (Choose all that apply)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1248,541,'Runtime exceptions are allowed to be handled or declared.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1249,541,'Runtime exceptions are required to be handled or declared.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1244,541,'Checked exceptions are allowed to be handled or declared.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1245,541,'Checked exceptions are required to be handled or declared.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1246,541,'Errors are allowed to be handled or declared.',true,'...но это плохая практика');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1247,541,'Errors are required to be handled or declared.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (542,4,1,'<p>Which of the following can be inserted in the blank to make the code compile? (Choose all that apply)</p>
<p>public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp; try {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("work real hard");<br />&nbsp;&nbsp;&nbsp; } catch (_____________ e) {<br />&nbsp;&nbsp;&nbsp; } catch (RuntimeException e) {<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1250,542,'Exception',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1251,542,'IOException',false,'нельзя. System.out.println() не выбрасывает такого исключения, взяться ему неоткуда, так что получится недостижимый код.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1252,542,'IllegalArgumentException',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1253,542,'RuntimeException',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1254,542,'StackOverflowError',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1255,542,'None of the above.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (543,4,2,'Скомпилируется ли следующий код?<br /><br />try {<br />&nbsp;&nbsp;&nbsp; System.out.println(5);<br />} catch (Exception e) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1256,543,'Да. Хотя Exception - это непроверяемое исключение, а метод System.out.println() такого не выбрасывает, оно является родителем для проверяемых исключений, поэтому его можно ловить.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (544,4,2,'Скомпилируется ли следующий код?<br /><br />try {<br />&nbsp;&nbsp;&nbsp; System.out.println(5);<br />} catch (IOException e) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1257,544,'Нет. Метод System.out.println() не выбрасывает IOException, поэтому образуется недостижимый код.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (545,4,1,'<p>What does the output of the following contain? (Choose all that apply)</p>
<p>12: public static void main(String[] args) {<br />13:&nbsp;&nbsp;&nbsp; System.out.print("a");<br />14:&nbsp;&nbsp;&nbsp; try {<br />15:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("b");<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new IllegalArgumentException();<br />17:&nbsp;&nbsp;&nbsp; } catch (IllegalArgumentException e) {<br />18:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("c");<br />19:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new RuntimeException("1");<br />20:&nbsp;&nbsp;&nbsp; } catch (RuntimeException e) {<br />21:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("d");<br />22:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new RuntimeException("2");<br />23:&nbsp;&nbsp;&nbsp; } finally {<br />24:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print("e");<br />25:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new RuntimeException("3");<br />26:&nbsp;&nbsp;&nbsp; }<br />27: }</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1258,545,'abce',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1259,545,'abde',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1260,545,'An exception with the message set to "1"',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1261,545,'An exception with the message set to "2"',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1262,545,'An exception with the message set to "3"',true,'исключение из finally отменяет то, которое появилось в блоке catch');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1263,545,'Nothing; the code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (546,8,2,'Скомпилируется ли следующий код?<br /><br />
<div>package cat;</div>
<div>public class BigCat {</div>
<div>&nbsp; &nbsp; public String name = "cat";</div>
<div>&nbsp; &nbsp; protected boolean hasFur = true;</div>
<div>&nbsp; &nbsp; boolean hasPaws = true;</div>
<div>&nbsp; &nbsp; private int id;</div>
<div>}</div>
<div>&nbsp;</div>
<div>package cat.species;</div>
<div>import cat.BigCat;</div>
<div>public class Lynx extends BigCat {&nbsp;</div>
<div>&nbsp; &nbsp; public static void main(String[] args) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; BigCat cat = new Lynx();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(cat.name);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(cat.hasFur);</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1264,546,'Нет. К полю&nbsp;<strong>hasFur</strong> имеется доступ у ссылки типа&nbsp;Lynx (по <strong>protected</strong>), но нет доступа у ссылки типа <strong>BigCat</strong>, даже если реальный экземпляр имеет тип <strong>Lynx</strong>. То же самое было бы актуально для <strong>protected</strong>-метода.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (547,8,2,'Укажите приоритеты критериев, по которым&nbsp;Java выбирает, какой метод вызвать среди перезагруженных, если по аргументу подходят несколько.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1265,547,'1) точное соответствие по типу<br />2) соответствие по родительскому классу<br />3) соответствие по примитивному типу большей размерности<br />4) соответствие по классу обертки<br />5) варарги',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (548,8,1,'<div>К каким строкам нижеприведенного кода можно добавить модификатор <strong>static</strong>? (укажите все возможные варианты)<br /><br />1: abstract class Cat {</div>
<div>2: &nbsp; &nbsp; String name = "The Cat";</div>
<div>3: &nbsp; &nbsp; void clean() { }</div>
<div>4: }</div>
<div>5: class Lion extends Cat {</div>
<div>6: &nbsp; &nbsp; void clean() { }</div>
<div>7: }</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1266,548,'3 и 7',true,'методы с одинаковой сигнатурой &nbsp;могут быть статичными, хотя это не будет наследование');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1267,548,'3',false,'нельзя. переопределяемый метод не может быть static');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1268,548,'7',false,'<span style="line-height: 18.2000007629395px;">нельзя. переопределяющий метод не может быть static</span>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1269,548,'2',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (549,8,1,'<div>К каким строкам нижеприведенного кода можно добавить модификатор <strong>final</strong>? (укажите все возможные варианты)</div>
<div>&nbsp;</div>
<div>1: abstract class Cat {</div>
<div>2: &nbsp; &nbsp; String name = "The Cat";</div>
<div>3: &nbsp; &nbsp; void clean() { }</div>
<div>4: }</div>
<div>5: class Lion extends Cat {</div>
<div>6: &nbsp; &nbsp; void clean() { }</div>
<div>7: }</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1270,549,'2',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1271,549,'3',false,'в дочернем классе производится попытка переопределить этот метод, а он финальный');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1272,549,'1',false,'класс не может быть одновременно абстрактным и финальным');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1273,549,'6',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1274,549,'5',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (550,8,2,'Добавьте в нижеприведенный код блок import, чтобы исчезли ошибки компиляции.<br /><br />public class ListHelper {<br />&nbsp;&nbsp;&nbsp; public List &lt;String&gt; copyAndSortList(List &lt;String&gt; original) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List &lt;String&gt; list = new ArrayList &lt;String&gt;(original);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sort(list);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return list;<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1275,550,'import java.util.*<br />import static java.util.Collections.*<br /><br />или<br /><br />import java.util.List<br />import java.util.ArrayList<br />import static java.util.Collections.sort',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (551,8,2,'В каком случае instanceof будет всегда возвращать <strong>false</strong>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1276,551,'если сравнивается литерал <strong>null</strong> или null-ссылка:<br /><br />boolean b = null instanceof Object; // false<br /><br />Object o = null;<br />boolean b = o instanceof Object; //false',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (552,8,2,'Когда instanceof будет всегда возвращать <strong>true</strong>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1277,552,'Когда непустая объектная ссылка сравнивается с Object:<br /><br />boolean b = new String() instanceof Object; // true',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (553,8,1,'Что вернет <strong>instanceof</strong>, если ссылка определенного типа сравнивается с типом&nbsp;из другой ветви иерархии?<br /><br />boolean b = new String() instanceof&nbsp;ArrayList;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1280,553,'Ошибка компиляции',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1278,553,'true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1279,553,'false',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (554,8,1,'Что вернет <strong>instanceof</strong>, если ссылка определенного типа сравнивается с типом&nbsp;интерфейса, который не реализует?<br /><br />boolean b = new String() instanceof List;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1281,554,'true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1282,554,'false',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1283,554,'Ошибка компиляции',false,'<p>&nbsp;</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1284,554,'false, если класс не финальный, ошибка компиляции, если финальный.',true,'Для нефинального класса ошибки не будет, поскольку даже если класс не реализует интерфейс, в дальнейшем потомок этого класса, возможно, реализует интерфейс.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (555,8,0,'Одна из функций <strong>instanceof</strong> - предварять кастинг объектов.<br /><br />public void feedAnimal(Animal animal) {<br />&nbsp;&nbsp;&nbsp; if(animal instanceof Cow) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((Cow)animal).addHay();<br />&nbsp;&nbsp;&nbsp; } else if(animal instanceof Bird) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((Bird)animal).addSeed();<br />&nbsp;&nbsp;&nbsp; } else if(animal instanceof Lion) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ((Lion)animal).addMeat();<br />&nbsp;&nbsp;&nbsp; } else {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new RuntimeException("Unsupported animal");<br />&nbsp;&nbsp;&nbsp; } <br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (556,8,2,'Что такое <strong>virtual method invocation</strong>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1285,556,'Это определение в суперклассе метода, имплементация которого предполагается в дочерних классах. Это позволяет вызывать метод на ссылке типа суперкласса (например, при передаче такой ссылки в сервисный метод).<br /><br />В большинстве случаев вышеуказанный метод будет абстрактным.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (557,8,2,'Что будет напечатано после выполнения следующего кода?<br /><br />abstract class Animal {<br />&nbsp;&nbsp;&nbsp; String name = "???";<br />&nbsp;&nbsp;&nbsp; public void printName() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(name);<br />&nbsp;&nbsp;&nbsp; }<br />}<br />class Lion extends Animal {<br />&nbsp;&nbsp;&nbsp; String name = "Leo";<br />}<br />public class PlayWithAnimal {<br />&nbsp;&nbsp;&nbsp; public static void main(String... args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Animal animal = new Lion();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; animal.printName();<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1286,557,'???<br /><br />переменные экземпляра определяются по типу ссылки, а не по реальному типу объекта (т.е. ссылка Animal дает доступ к переменным (и статическим методам) экземпляра суперкласса, который инкапсулирован в экземпляр реального класса, созданного посредством <strong>new</strong>).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (558,8,2,'Что будет напечатано в результате выполнения следующего кода?<br /><br />abstract class Animal {<br />&nbsp;&nbsp;&nbsp; public void careFor() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; play();<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public void play() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("pet animal");<br />&nbsp;&nbsp;&nbsp; } <br />}<br />class Lion extends Animal {<br />&nbsp;&nbsp;&nbsp; public void play() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("toss in meat");<br />&nbsp;&nbsp;&nbsp; } <br />}<br />public class PlayWithAnimal {<br />&nbsp;&nbsp;&nbsp; public static void main(String... args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Animal animal = new Lion();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; animal.careFor();<br />&nbsp;&nbsp;&nbsp; } <br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1287,558,'toss in meat<br /><br />выполнится переопределенный метод реального класса',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (559,8,2,'Приведите пример использования аннотации <strong>@Override</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1288,559,'class Bobcat {<br />&nbsp;&nbsp;&nbsp; public void findDen() { }<br />}<br />class BobcatMother extends Bobcat {<br />&nbsp;&nbsp;&nbsp; @Override<br />&nbsp;&nbsp;&nbsp; public void findDen() { }<br />}<br /><br />или<br /><br />...<br />@Override public void findDen() { }<br />...',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (560,8,2,'Каков смысл и предназначение аннотации <strong>@Override</strong>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1289,560,'Эта аннотация не дает случайно ошибиться и перезагрузить метод вместо переопределения.<br /><br />Если&nbsp;в родительском классе интерфейсе нет метода с данной сигнатурой, то добавление @Overriden приведет к ошибке компиляции.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (561,8,0,'Методы toString(), equals(), hashCode() класса Object предполагаются для переопределения в большинстве реализуемых пользовательских классов (особенно JavaBean)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (562,8,0,'<strong>String</strong> переопределяет метод <strong>equals</strong>(), в то время как <strong>StringBuilder</strong> использует версию <strong>Object</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (563,8,2,'Приведите пример реализации элементарного <strong>equals</strong> (без hashCode) для класса:<br /><br />public class Lion {<br />&nbsp;&nbsp;&nbsp; private int idNumber;<br />&nbsp;&nbsp;&nbsp; public Lion(int idNumber) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.idNumber = idNumber;<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1290,563,'@Override public boolean equals(Object obj) {<br />&nbsp;&nbsp;&nbsp; if (!(obj instanceof Lion)) return false;<br />&nbsp;&nbsp;&nbsp; Lion otherLion = (Lion) obj;<br />&nbsp;&nbsp;&nbsp; return this.idNumber == otherLion.idNumber;<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (564,8,2,'Приведите основные правила ("контракт"), которым должен следовать грамотно написанный метод&nbsp; <strong>equals</strong>().');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1291,564,'1) <strong>Рефлексивность</strong>: x.equals(x) == true<br /><strong><br /></strong>2)<strong> Симметричность</strong>: x.equals(y) == y.equals(x)<br /><strong><br /></strong>3)<strong> Транзитивность</strong>: Если x.equals(y) == y.equals(z), то x.equals(z)<br /><strong><br /></strong>4)<strong> Консистентность</strong>: x.equals(y) возвращает одно и то же значение независимо от обстоятельств и количества проверок на равенство (<em>при условии, что свойства объектов, используемые в equals, не изменились</em>).<br /><br />5) x.equals(null) должно всегда давать false. (<em>а не продуцировать NPE</em>)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (565,8,2,'Что плохо в этом методе equals?<br /><br />public boolean equals(Lion obj) {<br />&nbsp;&nbsp;&nbsp; if (obj == null) return false;<br />&nbsp;&nbsp;&nbsp; return this.idNumber == obj.idNumber;<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1292,565,'неверная сигнатура. Этот метод не переопределяет Object.equals()',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (566,0,0,'Для быстрого написания <strong>equals</strong>() можно использовать EqualsBuilder из ApacheCommons:<br /><br />public boolean equals(Object obj) {<br />&nbsp;&nbsp;&nbsp; return EqualsBuilder.reflectionEquals(this, obj);<br />}<br /><br />Если сравнение нужно только по некоторым полям, то делается так:<br /><br />public boolean equals(Object obj) {<br />&nbsp;&nbsp;&nbsp; if ( !(obj instanceof Lion)) return false;<br />&nbsp;&nbsp;&nbsp; Lion other = (Lion) obj;<br />&nbsp;&nbsp;&nbsp; return new EqualsBuilder().appendSuper(super.equals(obj))<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(idNumber, other.idNumber)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .append(name, other.name)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .isEquals();<br />}<br /><br />Выглядит громоздко, зато не надо заморачиваться с обработкой null у объектных полей.<br /><br />NB! appendSuper - если надо обеспечить проверку и методом equals вышестоящего класса.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (567,8,0,'Если переопределяем <strong>equals</strong>(), надо переопределить и <strong>hashCode</strong>()');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (568,8,2,'Для чего нужен hashCode?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1293,568,'Хеш-код - это число, которое можно рассчитать для некоторого экземпляра некоторого класса и которое позволяет группировать экземпляры класса по некоторому конечному числу категорий - с тем, чтобы легче было искать нужный экземпляр при работе с хешированными структурами.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (569,8,0,'Поля экземпляра типов <strong>boolean</strong> и <strong>char</strong> обычно не включают в расчет <strong>hashCode</strong>().');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (570,8,2,'Каковы правила имплементации ("контракт") метода <strong>hashCode</strong>()?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1294,570,'<strong>1</strong>. Внутри программы результат <strong>hashCode</strong>() не должен меняться (т.е. у экземпляра не должны меняться поля, которые участвуют в расчете <strong>hashCode</strong>())<br /><strong>2</strong>. Если два объекта равны друг другу по <strong>equals</strong>(), их <strong>hashCode</strong>() также должен быть равным. (т.е. в расчете <strong>hashCode</strong>() должно участвовать подмножество полей, используемых в <strong>equals</strong>()).<br /><strong>3</strong>. Если два объекта не равны по <strong>equals</strong>(), <strong>hashCode</strong>() <span style="text-decoration: underline;">не обязан</span> быть отличным.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (571,8,1,'Какие имплементации <strong>hashCode</strong>() из нижеперечисленных валидны?<br /><br />public class Lion {<br />&nbsp;&nbsp;&nbsp; private int idNumber;<br />&nbsp;&nbsp;&nbsp; private int age;<br />&nbsp;&nbsp;&nbsp; public Lion(int idNumber, int age) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.idNumber = idNumber;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.age = age;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public boolean equals(Object obj) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( !(obj instanceof Lion)) return false;<br />&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; Lion otherLion = (Lion) obj;<br />&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return this.idNumber == otherLion.idNumber;<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1296,571,'public long hashcode() { return idNumber; }',false,'неверный тип возвращаемого значения (не скомпилируется), плюс hashcode неправильно написано');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1297,571,'public int hashCode() { return 6; }',true,'плохо, но по контракту допустимо');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1298,571,'public int hashCode() { return idNumber * 7 + age; }',false,'метод опирается на поле <strong>age</strong>, которое не используется в <strong>equals</strong>(),');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1295,571,'public int hashCode() { return idNumber; }',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (572,8,2,'Какой самый простой способ написать хороший <strong>hashCode</strong>()?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1299,572,'сложить хешкоды полей, предварительно умножая их на некоторое заранее выбранное простое число.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (573,8,2,'Что такое <em>enum</em> в Java?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1300,573,'<em>Enum</em>, или<em> перечислимый тип </em>- это класс, реализующий энумерацию, т.е. фиксированный набор констант. Преимущество этого типа в том, что любые ошибки в использовании констант отслеживаются на уровне компиляции.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (574,8,2,'Приведите синтаксис определения перечислимого типа, а также присванивание переменной');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1301,574,'public enum Season {<br />&nbsp;&nbsp;&nbsp; WINTER, SPRING, SUMMER, AUTUMN[;]<br />}<br />...<br />Season s = Season.WINTER;<br />(заглавные буквы в константах enum - это не требование компилятора, а соглашение)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (575,8,0,'Экземпляры enum - это, фактически, статичные финальные константы.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (576,8,0,'Основной API перечислимых типов.<br /><br /><strong>1</strong>. Статический метод <strong>values</strong>(), который возвращает <span style="text-decoration: underline;">массив</span> всех экзампляров типа:<br />Season[] ss = Season.values();<br /><br /><strong>2</strong>. Метод экземпляра <strong>ordinal</strong>(), возвращающий порядковый номер элемента в перечислении.<br /><br /><strong>3</strong>. Статический метод <strong>valueOf</strong>(), преобразующий строку в экземпляр типа:<br />Season s = Season.valueOf("SUMMER");');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (577,8,0,'Перечислимый тип нельзя дополнить новыми элементами в runtime. Также невозможно наследование от перечислимого типа.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (578,8,2,'Приведите пример использования перечислимого типа в конструкции <strong>switch</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1302,578,'Season summer = Season.SUMMER;<br />switch(summer) {<br />&nbsp;&nbsp;&nbsp; case WINTER:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br />&nbsp;&nbsp;&nbsp; case SUMMER:<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (579,8,0,'В перечислимых типах можно определять конструкторы, переменные и методы экземпляра:<br /><br />public enum Season {<br />&nbsp;&nbsp;&nbsp; WINTER("Low"), SPRING("Medium"), SUMMER("High"), FALL("Medium");<br />&nbsp;&nbsp;&nbsp; private String expectedVisitors;<br />&nbsp;&nbsp;&nbsp; private Season(String expectedVisitors) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.expectedVisitors = expectedVisitors;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public void printExpectedVisitors() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(expectedVisitors);<br />&nbsp;&nbsp;&nbsp; } <br />}<br /><br />Внимание! 1) Список значений идет первым. 2) Двоеточие после списка становится обязательным, если кроме списка есть еще что-то. 3) Конструктор может быть только private или вообще без модификатора доступа (private по факту).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (580,8,0,'Конструкторы перечислимого типа выполняются в момент первого упоминания типа в коде.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (581,8,0,'Члены&nbsp;экземпляра перечислимого типа могут маркироваться <strong>protected</strong>, хотя особого смысла это не имеет - по факту равно <strong>default</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (582,8,0,'<p>В перечислимом типе возможно переопределить метод экземпляра на уровне каждого элемента списка:<br /><br />enum Season {<br />&nbsp;&nbsp;&nbsp; WINTER {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void test2() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("test2!!!!");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }, SPRING, SUMMER, AUTUMN;<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; public&nbsp; void test2(){<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; }</p>
<p>}<br /><br />(но основное определение метода должно быть на уровне всего типа, а не отдельного экземпляра; иначе метод нельзя будет вызвать).<br /><br />Общий метод может быть и абстрактным, но тогда его надо переопределить для всех экземпляров, иначе ошибка компиляции (если у экземпляров нет собственных блоков, ошибку компиляции увидеть не легко, в IDE не подсвечивается)</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (583,8,2,'Перечислите типы вложенных классов в Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1303,583,'1) Внутренний класс экземпляра (member inner class, или просто inner class) - определен на уровне членов экземпляра.<br />2) Локальный внутренний класс (local inner class) - определяется внутри метода.<br />3) Анонимный внутренний класс (anonymous inner class) - особая разновидность локального внутреннего класса, не имеет имени.<br />4) Статический вложенный класс (static nested class) - определен на уровне статических членов.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (584,8,2,'Перечислите основные преимущества использования внутренних классов в Java.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1304,584,'- инкапсуляция вспомогательных классов внутри конкретного класса (ограничение доступа)<br />- создание "одноразовых" классов<br />- создание более удобочитаемого кода',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (585,8,2,'Укажите формальные свойства внутренних классов-членов (<em>member inner classes</em>):');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1305,585,'<strong>1</strong>. Могут иметь любые модификаторы доступа<br /><strong>2</strong>. Могут наследовать любому классу и реализовывать любой интерфейс.<br /><strong>3</strong>. Могут быть абстрактными или финальными (или не быть таковыми).<br /><strong>4</strong>. НЕ МОГУТ объявлять статические поля или методы (за исключением финальных статичных полей).<br /><strong>5</strong>. Имеют доступ ко всем членам своего внешнего класса, включая приватные.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (586,8,0,'Перечислимые типы могут иметь статические переменные и методы!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (587,8,0,'Внутренние классы экземпляра имеют непосредственный доступ без каких-либо префиксов к членам своего внешнего класса (как статическим, так и экземпляра). Префикс <strong>this</strong> в этом случае использовать нельзя - он&nbsp; только для членов самого внутренного класса.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (588,8,2,'Напишите простейший код создания экземпляра внутреннего класса во внешнем.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1306,588,'class Outer {<br />&nbsp;&nbsp;&nbsp; class Inner {}<br />&nbsp;&nbsp;&nbsp; public void go() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inner in = new Inner();<br />&nbsp;&nbsp;&nbsp; }<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (589,8,2,'Создайте экземпляр внутреннего класса (member inner class) с помощью объекта внешнего.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1307,589,'Outer outer = new Outer();<br />Inner inner = outer.new Inner();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (590,8,0,'Для создания внутреннего (member inner) класса необходим <span style="text-decoration: underline;">экземпляр</span> внешнего.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (591,8,0,'Внутренний (member inner) класс может содержать такие же имена полей, как и внешний, в этом случае выбор той или иной переменной контролируется с помощью <strong>this</strong>, но делать так <span style="text-decoration: underline;">не надо</span>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (592,8,2,'Есть класс:<br /><br />class Outer {<br />&nbsp;&nbsp;&nbsp; String x = "Outer";<br /><br />&nbsp;&nbsp;&nbsp; class Inner {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String&nbsp; x = "Inner";<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void test() {<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br />1) Как в методе <strong>test</strong>() обратиться к переменной <strong>x</strong> класса Outer?<br />2) Как вне класса Outer создать экземпляр класса Inner?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1308,592,'1) Outer.this.x<br /><br />2) Outer.Inner in = new Outer().new Inner();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (593,8,0,'Если во внутреннем (member inner) классе обращаться к члену экземпляра какого-то из вышестоящих классов по вложенности, то в случае совпадения имен члена в нескольких классах возьмется самый ближний, если идти снизу вверх.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (594,8,0,'В статических методах внешнего класса можно создавать ссылки напрямую на тип внутреннего (member inner) класса, однако для этого все равно потребуется экземпляр внешнего:<br /><br />class Outer {<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; class Inner {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; static void test() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [Outer.]Inner in2 = new Outer().new Inner();<br />&nbsp;&nbsp;&nbsp; }<br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (595,8,0,'Внутренним (member inner) может быть и интерфейс:<br /><br />public class CaseOfThePrivateInterface {<br />&nbsp;&nbsp;&nbsp; private interface Secret {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void shh();<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; class DontTell implements Secret {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void shh() { }<br />&nbsp;&nbsp;&nbsp; } <br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (596,8,2,'Что такое "локальный внутренний класс" (local inner class)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1309,596,'Локальный внутренний класс - вложенный класс, определенный внутри <span style="text-decoration: underline;">метода</span>. Класс существует только внутри метода, объявляется только при вызове метода и выходит за пределы области видимости при выходе из метода. Однако экземпляры таких классов можно вернуть из метода.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (597,8,2,'Перечислите свойства локальных внутренних (local inner) классов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1310,597,'<strong>1</strong>. Не могут иметь модификатора доступа.<br /><strong>2</strong>. Не могут быть объявлены статическими и не могут иметь статических членов (за исключением статических финальных полей).<br /><strong>3</strong>. Имеют доступ ко всем полям и методам окружающего класса.<br /><strong>4</strong>. Не имеют доступа к локальным переменным метода, за исключением финальных либо "эффективно финальных", причем переменная должна получить значение ДО объявления класса.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (598,8,2,'В чем состоит концепция "эффективно финальных" локальных переменных, введенная в Java 8?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1311,598,'"Эффективно финальной" считается локальная переменная, к объявлению которой можно добавить модификатор <strong>final</strong> без возникновения ошибки компиляции.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (599,8,1,'Отметьте все&nbsp;"эффективно финальные" локальные переменные нижеприведенного кода.<br /><br />public void isItFinal() {<br />&nbsp;&nbsp;&nbsp; int one = 20;<br />&nbsp;&nbsp;&nbsp; int two = one;<br />&nbsp;&nbsp;&nbsp; two++;<br />&nbsp;&nbsp;&nbsp; int three;<br />&nbsp;&nbsp;&nbsp; if ( one == 4) three = 3;<br />&nbsp;&nbsp;&nbsp; else three = 4;<br />&nbsp;&nbsp;&nbsp; int four = 4;<br />&nbsp;&nbsp;&nbsp; class Inner { }<br />&nbsp;&nbsp;&nbsp; four = 5;<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1312,599,'one',true,'присваивается единственный раз в строке объявления');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1313,599,'two',false,'значение меняется после присваивания (инкремент)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1314,599,'three',true,'присваивается единственный раз в альтернативе');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1315,599,'four',false,'значение меняется после присваивания (то, что это происходит ПОСЛЕ объявления локального внутреннего класса, ситуацию не меняет)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (600,8,2,'Что такое "анонимный внутренний (anonymous inner) класс"?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1316,600,'Анонимный внутренний класс - это локальный внутренний класс без имени. Он создается с помощью ключевого слова <strong>new</strong> и в обязательном порядке наследует существующему классу либо реализует существующий интерфейс. Анонимные классы нужны, чтобы быстро инстанциировать "одноразовый" экземпляр.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (601,8,2,'Приведите простой пример инстанциирования анонимного внутреннего класса.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1317,601,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Object obj = new Object() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public String toString() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return&nbsp; "obj" + super.toString();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (602,8,0,'Анонимный внутренний класс не может одновременно наследовать классу (кроме Object) и реализовывать интерфейс. В этом случае можно использовать локальный внутренний класс.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (603,8,0,'Анонимный внутренний класс можно использовать даже в качестве аргумента метода!<br /><br />public int pay() {<br />&nbsp;&nbsp;&nbsp; return admission(5, new SaleTodayOnly() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public int dollarsOff() { return 3; }<br />&nbsp;&nbsp;&nbsp; });<br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (604,8,0,'Анонимные внутренние классы очень часто используются в построении графических интерфейсов. Например в качестве листенера удобно подать экземпляр анонимного класса, который имеет доступ к экземпляру класса, в котором он был создан:<br /><br />JButton button = new JButton("red");<br />button.addActionListener(new ActionListener() {<br />&nbsp;&nbsp;&nbsp; public void actionPerformed(ActionEvent e) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; //handle the button click<br />&nbsp;&nbsp;&nbsp; }<br />});');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (605,8,2,'Что такое вложенный (static nested) класс?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1318,605,'Вложенный класс - это класс, определенный как статический член класса. Для инстанциирования такому классу не нужен объект внешнего класса, т.е. доступа к полям экземпляра внешнего класса напрямую нет.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (606,8,2,'Перечислите особенности вложенных (static nested) классов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1319,606,'<strong>1</strong>. Для обращения к вложенному классу извне требуется имя внешнего класса<br /><strong>2</strong>. У вложенного класса могут быть любые модификаторы доступа.<br /><strong>3</strong>. Внешний класс имеет доступ ко всем членам вложенного класса, а вложенный - ко всем членам внешнего. Для обращения к членам экземпляра понадобятся ссылки на объекты классов. Статические члены внешнего класса видны в коде вложенного напрямую.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (607,8,2,'Приведите простой пример инстанциирования вложенного класса <br />1) внутри внешнего<br />2) извне');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1320,607,'1)<br />class Enclosing {<br />&nbsp;&nbsp;&nbsp; static class Nested {}<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nested nested = new Nested();<br />&nbsp;&nbsp;&nbsp; } <br />}<br /><br />2)<br />class Enclosing {<br />&nbsp;&nbsp;&nbsp; static class Nested {}<br />}<br />class Outer {<br />&nbsp;&nbsp;&nbsp; public void instantiate() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enclosing.Nested nested = new Enclosing.Nested();<br />&nbsp;&nbsp;&nbsp; }<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (608,8,2,'Как импортировать класс Beak, определенный в следующем коде?<br /><br />package bird;<br /><br />public class Toucan {<br />&nbsp;&nbsp;&nbsp; public static class Beak {}<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1321,608,'Два способа.<br /><br />1) обычным импортом:<br />import bird.Toucan.Beak;<br /><br />2) статическим импортом:<br />import static bird.Toucan.Beak;',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (609,8,1,'What is the result of the following code?<br /><br />public class Employee {<br />&nbsp;&nbsp;&nbsp; public int employeeId;<br />&nbsp;&nbsp;&nbsp; public String firstName, lastName;<br />&nbsp;&nbsp;&nbsp; public int yearStarted;<br />&nbsp;&nbsp;&nbsp; @Override public int hashCode() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return employeeId;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public boolean equals(Employee e) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this.employeeId == e.employeeId;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee one = new Employee();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; one.employeeId = 101;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Employee two = new Employee();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; two.employeeId = 101;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (one.equals(two)) System.out.println("Success");<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; else System.out.println("Failure");<br />&nbsp;&nbsp;&nbsp; } <br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1322,609,'Success',true,'...хотя Employee.equals не переопределяет Object.equals');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1323,609,'Failure',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1324,609,'The hashCode() method fails to compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1325,609,'The equals() method fails to compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1326,609,'Another line of code fails to compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1327,609,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (610,8,1,'What is the result of compiling the following class?<br /><br />public class Book {<br />&nbsp;&nbsp;&nbsp; private int ISBN;<br />&nbsp;&nbsp;&nbsp; private String title, author;<br />&nbsp;&nbsp;&nbsp; private int pageCount;<br />&nbsp;&nbsp;&nbsp; public int hashCode() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ISBN;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; @Override public boolean equals(Object obj) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( !(obj instanceof Book)) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Book other = (Book) obj;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this.ISBN == other.ISBN;<br />&nbsp;&nbsp;&nbsp; }<br />// imagine getters and setters are here<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1328,610,'The code compiles.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1329,610,'The code does not compile because hashCode() is incorrect.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1330,610,'The code does not compile because equals() does not override the parent method correctly.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1331,610,'The code does not compile because equals() tries to refer to a private field.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1332,610,'The code does not compile because the ClassCastException is not handled or declared.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1333,610,'The code does not compile for another reason.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (611,0,0,'Код класса имеет доступ&nbsp; к приватным членам не только того же самого экземпляра, но и любого другого экземпляра, ссылка на который есть в коде.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (612,8,1,'What is the result of the following code?<br /><br />String s1 = "Canada";<br />String s2 = new String(s1);<br />if(s1 == s2) System.out.println("s1 == s2");<br />if(s1.equals(s2)) System.out.println("s1.equals(s2)");');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1334,612,'There is no output.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1335,612,'s1 == s2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1336,612,'s1.equals(s2)',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1337,612,'Both B and C.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1338,612,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1339,612,'The code throws a runtime exception.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (613,8,1,'What is true about the following code? You may assume <em>city</em> and <em>mascot</em> are never null.<br /><br />public class BaseballTeam {<br />&nbsp;&nbsp;&nbsp; private String city, mascot;<br />&nbsp;&nbsp;&nbsp; private int numberOfPlayers;<br />&nbsp;&nbsp;&nbsp; public boolean equals(Object obj) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( !(obj instanceof BaseballTeam))<br />&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; return false;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BaseballTeam other = (BaseballTeam) obj;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (city.equals(other.city) &amp;&amp; mascot.equals(other.mascot));<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public int hashCode() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return numberOfPlayers;<br />&nbsp;&nbsp;&nbsp; }<br />// imagine getters and setters are here<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1340,613,'The class does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1341,613,'The class compiles but has an improper equals() method.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1342,613,'The class compiles but has an improper hashCode() method.',true,'Метод hashCode() плох тем, что может вернуть неодинаковое значение для объектов, которые будут равны по equals() (нарушение контракта). Плохо и то, что в hashCode используется информация, которая может меняться');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1343,613,'The class compiles and has proper equals() and hashCode() methods.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (614,8,1,'Which of the following statements are true, assuming <em>a</em> and <em>b</em> are <strong>String</strong> objects? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1344,614,'If a.equals(b) is true, a.hashCode() == b.hashCode() is always true.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1345,614,'If a.equals(b) is true, a.hashCode() == b.hashCode() is sometimes but not always true.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1346,614,'If a.equals(b) is false, a.hashCode() == b.hashCode() can never be true.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1347,614,'If a.equals(b) is false, a.hashCode() == b.hashCode() can sometimes be true.',true,'...вспомним, что hashCode отвечает за кучку, в которой ищем. В одной кучке могут находиться различные по equals объекты');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (615,8,1,'What is the result of the following code?<br /><br />public class FlavorsEnum {<br />&nbsp;&nbsp;&nbsp; enum Flavors {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VANILLA, CHOCOLATE, STRAWBERRY<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(Flavors.CHOCOLATE.ordinal());<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1348,615,'0',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1349,615,'1',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1350,615,'9',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1351,615,'CHOCOLATE',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1352,615,'The code does not compile due to a missing semicolon.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1353,615,'The code does not compile for a different reason.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (616,8,1,'What is the result of the following code? (Choose all that apply.)<br /><br />public class IceCream {<br />&nbsp;&nbsp;&nbsp; enum Flavors {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VANILLA, CHOCOLATE, STRAWBERRY<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Flavors f = Flavors.STRAWBERRY;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (f) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0: System.out.println("vanilla");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 1: System.out.println("chocolate");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 2: System.out.println("strawberry");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default: System.out.println("missing flavor");<br />&nbsp;&nbsp;&nbsp; } } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1354,616,'vanilla',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1355,616,'chocolate',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1356,616,'strawberry',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1357,616,'missing flavor',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1358,616,'The code does not compile.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1359,616,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (617,8,1,'What is the result of the following code?<br /><br />1: public class Outer {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; private int x = 5;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; protected class Inner {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public static int x = 10;<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void go() { System.out.println(x); }<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outer out = new Outer();<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outer.Inner in = out.new Inner();<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in.go();<br />11: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1360,617,'The output is 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1361,617,'The output is 10.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1362,617,'Line 4 generates a compiler error.',true,'если бы в строке 4 был модификатор final, то скомпилировалось бы');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1363,617,'Line 8 generates a compiler error.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1364,617,'Line 9 generates a compiler error.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1365,617,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (618,8,1,'Какой результат будет у следующего кода?<br /><br />&nbsp;public class Outer {<br />&nbsp;&nbsp;&nbsp;&nbsp; private int x = 5;<br />&nbsp;&nbsp;&nbsp;&nbsp; protected class Inner {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public static final int x = 10;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void go() { System.out.println(x); }<br />&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outer out = new Outer();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Outer.Inner in = out.new Inner();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in.go();<br />&nbsp;} }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1366,618,'5',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1367,618,'10',true,'"Своя" статичная переменная оказывается ближе, чем переменная экземпляра внешнего класса.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1368,618,'Ошибка компиляции.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1369,618,'Runtime Exception',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (619,8,1,'What is the result of the following code?<br /><br />1: public class Outer {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; private int x = 24;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public int getX() {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String message = "x is ";<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; class Inner {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; private int x = Outer.this.x;<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void printX() {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(message + x);<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />11:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Inner in = new Inner();<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in.printX();<br />13:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return x;<br />14:&nbsp;&nbsp;&nbsp; }<br />15:&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />16:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new Outer().getX();<br />17: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1370,619,'x is 0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1371,619,'x is 24.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1372,619,'Line 6 generates a compiler error.',false,'Доступ к переменной экземпляра внешнего класса возможен таким образом (более того, в данном примере с совпадением имен переменных это единственный способ.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1373,619,'Line 8 generates a compiler error.',false,'Переменная <em>message</em> - "эффективно финальная".');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1374,619,'Line 11 generates a compiler error.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1375,619,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (620,8,1,'The following code appears in a file named Book.java. What is the result of compiling the source file?<br /><br />1: public class Book {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; private int pageNumber;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; private class BookReader {<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public int getPage() {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pageNumber;<br />6: } } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1376,620,'The code compiles successfully, and one bytecode file is generated: Book.class.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1377,620,'The code compiles successfully, and two bytecode files are generated: Book.class and BookReader.class.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1378,620,'The code compiles successfully, and two bytecode files are generated: Book.class and Book$BookReader.class.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1379,620,'A compiler error occurs on line 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1380,620,'A compiler error occurs on line 5.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (621,8,1,'Which of the following statements can be inserted to make <strong>FootballGame</strong> compile?<br /><br />package my.sports;<br />public class Football {<br />&nbsp;&nbsp;&nbsp; public static final int TEAM_SIZE = 11;<br />}<br />package my.apps;<br />// INSERT CODE HERE<br />public class FootballGame {<br />&nbsp;&nbsp;&nbsp; public int getTeamSize() { return TEAM_SIZE; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1381,621,'import my.sports.Football;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1382,621,'import static my.sports.*;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1383,621,'import static my.sports.Football;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1384,621,'import static my.sports.Football.*;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1385,621,'static import my.sports.*;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1386,621,'static import my.sports.Football;',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1387,621,'static import my.sports.Football.*;',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (622,8,1,'What is the result of the following code?<br /><br />public class Browsers {<br />&nbsp;&nbsp;&nbsp; static class Browser {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void go() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Inside Browser");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; static class Firefox extends Browser {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public void go() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Inside Firefox");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; static class IE extends Browser {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @Override public void go() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println("Inside IE");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Browser b = new Firefox();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IE e = (IE) b;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.go();<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1392,622,'A runtime exception is thrown.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1388,622,'Inside Browser',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1389,622,'Inside Firefox',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1390,622,'Inside IE',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1391,622,'The code does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (623,8,1,'Which is a true statement about the following code?<br /><br />public class IsItFurry {<br />&nbsp;&nbsp;&nbsp; static interface Mammal { }<br />&nbsp;&nbsp;&nbsp; static class Furry implements Mammal { }<br />&nbsp;&nbsp;&nbsp; static class Chipmunk extends Furry { }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chipmunk c = new Chipmunk();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mammal m = c;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Furry f = c;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int result = 0;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c instanceof Mammal) result += 1;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c instanceof Furry) result += 2;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (null instanceof Chipmunk) result += 4;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(result);<br />&nbsp;&nbsp;&nbsp; } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1393,623,'The output is 0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1394,623,'The output is 3.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1395,623,'The output is 7.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1396,623,'c instanceof Mammal does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1397,623,'c instanceof Furry does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1398,623,'null instanceof Chipmunk does not compile.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (624,0,0,'<strong>instanceof</strong> сравнивает только сущности из одной ветви наследования. Если нет отношения родитель-потомок, то будет ошибка компиляции');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (625,8,1,'Which is a true statement about the following code? (Choose all that apply.)<br /><br />import java.util. *;<br />public class IsItFurry {<br />&nbsp;&nbsp;&nbsp; static class Chipmunk { }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chipmunk c = new Chipmunk();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ArrayList &lt;Chipmunk&gt; l = new ArrayList&lt;&gt;();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Runnable r = new Thread();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int result = 0;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c instanceof Chipmunk) result += 1;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (l instanceof Chipmunk) result += 2;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r instanceof Chipmunk) result += 4;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(result);<br />&nbsp;&nbsp;&nbsp; } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1399,625,'The code compiles, and the output is 0.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1400,625,'The code compiles, and the output is 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1401,625,'The code compiles, and the output is 7.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1402,625,'c instanceof Chipmunk does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1403,625,'l instanceof Chipmunk does not compile.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1404,625,'r instanceof Chipmunk does not compile.',false,'Скомпилируется, т.к. Runnable это интерфейс. Теоретически, потомок Chipmunk может имплементировать Runnable, тогда станет возможен объект Runnable, который еще и Chipmunk.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (626,8,0,'<strong>instanceof</strong> в случае с интерфейсами не имеет ограничений на компиляцию из-за разных ветвей дерева наследования, т.к. для любого класса может появиться наследник, имплементирующий интерфейс, и <strong>instanceof</strong> станет актуальным. Следующий код скомпилируется:<br /><br />1: interface SomeInterface {}<br />2: class SomeClass {<br />3: &nbsp;&nbsp;&nbsp; void f() {<br />4: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SomeInterface i = new SomeInterface() {};<br />5: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SomeClass c = new SomeClass();<br />6: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(i instanceof SomeClass);<br />7: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(c instanceof SomeInterface);<br />8: &nbsp;&nbsp;&nbsp; }<br />9: }<br /><br />Однако если сделать класс <strong>SomeClass</strong> финальным (отсечь возможность наследования), то компиляция строк 6 и 7 станет невозможной.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (627,8,1,'Which of the following statements are true about the <strong>equals</strong>() method? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1408,627,'If <strong>equals</strong>() is passed the wrong type, the method should throw an exception.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1409,627,'If <strong>equals</strong>() is passed the wrong type, the method should return <strong>false</strong>.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1410,627,'If <strong>equals</strong>() is passed the wrong type, the method should return <strong>true</strong>.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1405,627,'If <strong>equals</strong>(<em>null</em>) is called, the method should throw an exception.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1406,627,'If <strong>equals</strong>(<em>null</em>) is called, the method should return <strong>false</strong>.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1407,627,'If <strong>equals</strong>(<em>null</em>) is called, the method should return <strong>true</strong>.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (628,8,0,'Базовые требования к методу equals():<br /><br />- должен иметь проверку на null<br />- должен иметь проверку instanceof');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (629,8,1,'Which of the following can be inserted in main?<br /><br />public class Outer {<br />&nbsp;&nbsp;&nbsp; class Inner { }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // INSERT CODE HERE<br />&nbsp;&nbsp;&nbsp; } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1411,629,'Inner in = new Inner();',false,'не забываем - мы в статическом методе. Такой синтаксис возможен только в методе экземпляра.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1412,629,'Inner in = Outer.new Inner();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1413,629,'Outer.Inner in = new Outer.Inner();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1414,629,'Outer.Inner in = new Outer().Inner();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1415,629,'Outer.Inner in = new Outer().new Inner();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1416,629,'Outer.Inner in = Outer.new Inner();',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (630,8,1,'What is the result of the following code? (Choose all that apply.)<br /><br />1: public enum AnimalClasses {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; MAMMAL(true), FISH(Boolean.FALSE), BIRD(false),<br />3:&nbsp;&nbsp;&nbsp;&nbsp; REPTILE(false), AMPHIBIAN(false), INVERTEBRATE(false)<br />4:&nbsp;&nbsp;&nbsp;&nbsp; boolean hasHair;<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public AnimalClasses(boolean hasHair) {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.hasHair = hasHair;<br />7:&nbsp;&nbsp;&nbsp;&nbsp; }<br />8:&nbsp;&nbsp;&nbsp;&nbsp; public boolean hasHair() {<br />9:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return hasHair;<br />10:&nbsp;&nbsp;&nbsp; }<br />11:&nbsp;&nbsp;&nbsp; public void giveWig() {<br />12:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hasHair = true;<br />13: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1417,630,'Compiler error on line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1418,630,'Compiler error on line 3.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1419,630,'Compiler error on line 5.',true,'У перечислимых типов не может быть публичных конструкторов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1420,630,'Compiler error on line 8.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1421,630,'Compiler error on line 12.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1422,630,'Compiler error on another line.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1423,630,'The code compiles successfully.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (631,8,1,'What is the result of the following code? (Choose all that apply.)<br /><br />public class Swimmer {<br />&nbsp;&nbsp;&nbsp; enum AnimalClasses {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAMMAL, FISH {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public boolean hasFins() { return true; }},<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIRD, REPTILE, AMPHIBIAN, INVERTEBRATE;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; public abstract boolean hasFins();<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(AnimalClasses.FISH);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(AnimalClasses.FISH.ordinal());<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(AnimalClasses.FISH.hasFins());<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(AnimalClasses.BIRD.hasFins());<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1424,631,'fish',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1425,631,'FISH',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1426,631,'0',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1427,631,'1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1428,631,'false',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1429,631,'true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1430,631,'The code does not compile.',true,'Все экземпляры перечислимого типа должны реализовывать абстрактный метод');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (632,8,1,'Which of the following can be inserted to override the superclass method? (Choose all that apply.)<br /><br />public class LearnToWalk {<br />&nbsp;&nbsp;&nbsp; public void toddle() {}<br />&nbsp;&nbsp;&nbsp; class BabyRhino extends LearnToWalk {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // INSERT CODE HERE<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1431,632,'public void toddle() {}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1432,632,'public void Toddle() {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1433,632,'public final void toddle() {}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1434,632,'public static void toddle() {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1435,632,'public void toddle() throws Exception {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1436,632,'public void toddle(boolean fall) {}',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (633,8,1,'What is the result of the following code?<br /><br />public class FourLegged {<br />&nbsp;&nbsp;&nbsp; String walk = "walk,";<br />&nbsp;&nbsp;&nbsp; static class BabyRhino extends FourLegged {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String walk = "toddle,";<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FourLegged f = new BabyRhino();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BabyRhino b = new BabyRhino();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(f.walk);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(b.walk);<br />&nbsp;&nbsp;&nbsp; } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1440,633,'walk,walk,',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1441,633,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1442,633,'A runtime exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1437,633,'toddle,toddle,',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1438,633,'toddle,walk,',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1439,633,'walk,toddle,',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (634,8,1,'Which of the following could be inserted to fill in the blank? (Choose all that apply.)<br /><br />public interface Otter {<br />&nbsp;&nbsp;&nbsp; default void play() { }<br />}<br />class RiverOtter implements Otter {<br />&nbsp;&nbsp;&nbsp; _____________________________<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1443,634,'@Override public boolean equals(Object o) { return false; }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1444,634,'@Override public boolean equals(Otter o) { return false; }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1445,634,'@Override public int hashCode() { return 42; }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1446,634,'@Override public long hashCode() { return 42; }',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1447,634,'@Override public void play() { }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1448,634,'@Override void play() { }',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (635,8,0,'Абстрактные определения методов можно дублировать в наследующем/реализующем&nbsp; абстрактном классе/интерфейсе - это не ошибка компиляции.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (636,8,0,'Функциональный интерфейс можно снабдить аннотацией <strong>@FunctionalInterface</strong>, тогда будет ошибка компиляции, если интерфейс неудовлетворяет условиям функционального (например, содержит более одного метода). Для использования корректного функционального интерфейса в лямбда-выражениях наличие вышеуказанной аннотации необязательно. Однако лучше ее все-таки указывать, чтобы другой разработчик случайно не испортил функциональный интерфейс.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (637,8,1,'Имеем фнукциональный интерфейс<br /><br />public interface Sprint {<br />&nbsp;&nbsp;&nbsp; public void sprint(Animal animal);<br />}<br /><br />Какие из нижеприведенных интерфейсов также будут функциональными?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1450,637,'public interface Run extends Sprint {}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1451,637,'public interface SprintFaster extends Sprint {<br />&nbsp;&nbsp;&nbsp; public void sprint(Animal animal);<br />}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1452,637,'public interface Skip extends Sprint {<br />&nbsp;&nbsp;&nbsp; public default int getHopCount(Kangaroo kangaroo) {return 10;}<br />&nbsp;&nbsp;&nbsp; public static void skip(int speed) {}<br />}',true,'дополнительно определены статичный и дефолтный методы. Абстрактный по-прежнему только один - унаследованный, т.к. что интерфейс - функциональный');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1453,637,'public interface Walk {}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1454,637,'public interface Dance extends Sprint {<br />&nbsp;&nbsp;&nbsp; public void dance(Animal animal);<br />}',false,'добавился еще один абстрактный метод к унаследованному');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1455,637,'public interface Crawl {<br />&nbsp;&nbsp;&nbsp; public void crawl();<br />&nbsp;&nbsp;&nbsp; public int getCount();<br />}',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (638,8,0,'Пример использования простой лямбды с функциональным интерфейсом:<br /><br />public class Animal {<br />&nbsp;&nbsp;&nbsp; private boolean canHop = true;<br />&nbsp;&nbsp;&nbsp; public boolean canHop() { return canHop; }<br />}<br /><br />interface CheckTrait {<br />&nbsp;&nbsp;&nbsp; public boolean test(Animal a);<br />}<br /><br />class FindMatchingAnimals {<br />&nbsp;&nbsp;&nbsp; private static void print(Animal animal, CheckTrait trait) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(trait.test(animal))<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(animal);<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; print(new Animal(), a -&gt; a.canHop());<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br />Код печатает название животного, которое удовлетворяет условию лямды. Как Java понимает, чего мы от нее хотим?<br />Анализирует смысл лямбды. Лямда передается в метод <strong>print</strong>() вторым параметром. Сигнатура метода ожидает на этом месте <strong>CheckTrait</strong>.<br />Поскольку он получил лямбду, он интерпретирует ожидаемый интерфейс как функциональный и подставляет код лямбды на место единственного<br />абстрактного метода. Фактически - инстанциирует класс, который имеет метод <br />test(Animal a) { return a.canHop()} .');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (639,8,2,'Что такое "отложенное исполнение" (<em>deferred execution</em>)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1456,639,'Это когда код известен сейчас, но запущен будет позже - актуально для лямбд.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (640,8,0,'Лямбду можно записывать сокращенно.<br /><br />Полная версия:<br />(Animal a) -&gt; { return a.canHop(); }<br /><br />Сокращенная:<br />a -&gt; a.canHop()<br /><br />Сокращенную лямбду можно подавать в тот контекст, в котором становятся ясными опущенные параметры - в данном случае, тип аргумента.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (641,8,2,'Имеем лямбду<br />(Animal a) &minus;&gt; { return a.canHop(); }<br /><br />Какие ее части и когда могут быть опциональными?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1457,641,'- имя типа <strong>Animal</strong><br />- скобки - только если не указано имя типа<br />- фигурные скобки - только если опущены <strong>return</strong> и точка с запятой.<br />- <strong>return</strong> и точка с запятой - только если опущены скобки',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (642,8,2,'Когда секция параметров лямбды может не иметь скобок?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1458,642,'Только если параметр один и не указано имя типа.<br />(нулевое число параметров также потребует скобок)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (643,8,1,'Из нижеперечисленных лямбд укажите корректные:');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1472,643,'(String a, String b) -&gt; a.startsWith("test")',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1473,643,'(String a, b) -&gt; a.startsWith("test")',false,'не указан тип второго параметра');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1474,643,'a, b -&gt; a.startsWith("test")',false,'нет скобок в параметрах');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1475,643,'c -&gt; return 10;',false,'нет фигурных скобок вокруг тела');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1476,643,'a -&gt; { return a.startsWith("test") }',false,'нет точки с запятой после выражения в теле');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1459,643,'() -&gt; new Duck()',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1460,643,'d -&gt; {return d.quack();}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1461,643,'(Duck d) -&gt; d.quack()',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1462,643,'(Animal a, Duck d) -&gt; d.quack()',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1463,643,'Duck d -&gt; d.quack()',false,'нет скобок в аргументах');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1464,643,'a,d -&gt; d.quack()',false,'нет скобок в аргументах');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1465,643,'Animal a, Duck d -&gt; d.quack()',false,'нет скобок в аргументах');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1466,643,'() -&gt; true',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1467,643,'a -&gt; {return a.startsWith("test");}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1468,643,'(String a) -&gt; a.startsWith("test")',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1469,643,'(int x) -&gt; {}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1470,643,'(int y) -&gt; {return;}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1471,643,'(a, b) -&gt; a.startsWith("test")',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (644,8,0,'Опустить в теле лямбды фигурные скобки, точку с запятой и ключевое слово <strong>return</strong> можно только если тело состоит из одной строки и одного выражения.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (645,8,0,'Можно не указывать <strong>return</strong> в теле лямбды, если она ничего не возвращает.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (646,8,0,'Если у лямбды несколько параметров и у какого-то из них указан тип, то тип должен быть указан у всех.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (647,8,0,'В лямбдах нельзя переопределять локальную переменную:<br /><br />(a, b) -&gt; { int a = 0; return 5;} // DOES NOT COMPILE<br />(a, b) -&gt; { int c = 0; return 5;} // CORRECT');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (648,8,2,'Что такое предикатный интерфейс?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1477,648,'Предикатный интерфейс java.util.function.Predicate предназначен для использования с лямбдами и выглядит так:<br /><br />public interface Predicate&lt;T&gt; {<br />&nbsp;&nbsp;&nbsp; public boolean test(T t);<br />}<br /><br />Благодаря наличию предикатного интерфейса нет необходимости создавать свой собственный для лямбд с единственным параметром и boolean-методом.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (649,8,0,'<p>Простой пример использования предикатного интерфейса. Программа, определяющая четность произвольного числа (обернутого во вспомогательный класс <strong>MyNumber</strong>).<br /><br />public class TestNumber {<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; public static void main(String args[]) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MyNumber num = new MyNumber(1.5);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(testNumOdd(num, n -&gt; n.isOdd()));<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num = new MyNumber(15L);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(testNumOdd(num, n -&gt; n.isOdd()));<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num = new MyNumber((byte)113);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(testNumOdd(num, n -&gt; n.isOdd()));<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; static boolean testNumOdd(MyNumber num, Predicate&lt;MyNumber&gt; testOdd) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return testOdd.test(num);<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <br />}</p>
<p>class MyNumber {<br />&nbsp;&nbsp;&nbsp; Number num;<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; MyNumber(Number num) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.num = num;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; boolean isOdd() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (num instanceof Float || num instanceof Double)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (num.longValue() % 2) == 1;<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br /></p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (650,8,0,'Полиморфизм - это, по сути, способность одного и того же реального объекта выступать в разных ролях, т.е. подаваться в контексты, где ожидается любой из суперклассов или интерфейсов, реализуемых/наследуемых данным объектов.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (651,8,0,'Тип ссылки на объект определяет, какиен поля и методы объекта будут доступны Java-программе.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (652,8,2,'Назовите правила кастинга объектов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1478,652,'<strong>1</strong>.&nbsp;Преобразование от дочернего типа к родительскому не требует явного кастинга.<br /><strong>2</strong>.&nbsp;Преобразование от родительского&nbsp; типа к дочернему требует явного кастинга.<br /><strong>3</strong>. Компилятор не позволяет кастинг несвязанных одной иерархией типов.<br /><strong>4</strong>. Отсутствие проблем на этапе компиляции не означает, что кастинг осуществится при запуске программы.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (653,8,0,'<p>Технически можно обеспечить любой кастинг без ошибок компиляции - достаточно ввести промежуточный кастинг к любому общему предку:<br /><br />class Bird{}<br />class Fish{}<br />...<br />Bird bird = new Bird();<br />Fish fish = (Fish)(Object)bird;</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (654,8,0,'Компилируемость конструкций с кастингом&nbsp;тесно связано с таковой для конструкций с <strong>instanceof</strong>. Например, можно делать кастинг класса к любому интерфейсу и наоборот, если класс&nbsp;не финальный. Также принято кастинг предварять проверкой <strong>instanceof</strong>, чтобы исключить <strong>ClassCastException</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (655,8,2,'Сформулируйте базовую идею инкапсуляции.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1479,655,'Никто, кроме самого класса, не должен иметь доступа к данным (полям) этого класса.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (656,8,2,'Что такое <em>инвариант</em> применительно к конструированию классов?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1480,656,'Инвариант - это свойство/набор свойств/набор фактов, которые мы вправе ожидать от некоторого класса. Например, мы можем ыть уверены, что некоторое поле класса содержит целочисленное значение, большее нуля - это инвариант.<br />Целостность инвариантов обеспечивается, в первую очередь, геттерами, сеттерами и конструкторами.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (657,8,0,'Если установка некоторого свойства класса происходит согласно каким-то четким условиям, из конструктора следует вызывать сеттер с необходимой логикой.<br /><br />public class Animal {<br />&nbsp;&nbsp;&nbsp; private String species;<br /><br />&nbsp;&nbsp;&nbsp; public Animal(String species) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.setSpecies(species);<br />&nbsp;&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp;&nbsp; public String getSpecies() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return species;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; public void setSpecies(String species) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(species == null || species.trim().length()==0) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new IllegalArgumentException("Species is required");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.species = species;<br />&nbsp;&nbsp;&nbsp; }<br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (658,8,2,'Чем наличие private-поля и простого сеттера лучше публичного доступа к полю?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1481,658,'Тем, что мы можем усложнить сеттер, когда это будет актуально, а потребителям класса не потребуется перекомпиляция/правка своего кода.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (659,8,2,'Что такое <em>JavaBean</em> и каковы правила этого концепта?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1482,659,'JavaBean - это принцип проектирования, относящийся к инкапсулированию данных в классе, а также класс, построенный в соответствии с этим принципом.<br />Соглашения же действуют такие:<br /><br /><strong>1</strong>. Свойства (поля) - приватны.<br /><strong>2</strong>. Геттер не-булевых значений начинается с <strong>get</strong>.<br /><strong>3</strong>. Геттер булевых значений начинается с <strong>is</strong> или <strong>get</strong>.<br /><strong>4</strong>. Сеттеры начинаются с <strong>set</strong>.<br /><strong>5</strong>. Camel-case.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (660,8,0,'JavaBean-соглашение о булевом геттере, начинающемся с <strong>is</strong>, не распространяется на класс-обертку <strong>Boolean</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (661,8,1,'Отметьте строки, корректиные с т.з. JavaBean');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1488,661,'public String name;',false,'поле не должно быть публичным');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1489,661,'public String name() { return name; }',false,'должно быть <strong>getName</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1490,661,'public void updateName(String n) { name = n; }',false,'должно быть <strong>setName</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1491,661,'public void setname(String n) { name = n; }',false,'должно быть <strong>setName</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1483,661,'private boolean playing;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1484,661,'private Boolean dancing;',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1485,661,'public boolean isPlaying() { return playing; }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1486,661,'public boolean getPlaying() { return playing; }',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1487,661,'public Boolean isDancing() { return dancing; }',false,'<strong>Boolean</strong> не должен иметь геттера с is (в отличие от <strong>boolean</strong>)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (662,8,0,'Стрелочками принято обозначать наследование, пунктирными стрелочками - реализацию интерфейса.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (663,8,0,'Использование интерфейсов уместно, когда какое-либо группировочное свойство объектов не встраивается в иерархию наследования.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (664,8,2,'Что такое композиция объектов?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1492,664,'Композиция - это когда один класс имеет ссылки на другие классы. Композиция позволяет делегировать выполнение другим классам и в определенном смысле служит альтернативой наследованию.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (665,8,0,'Пример композиции с делегацией методов:<br /><br />public class Penguin {<br />&nbsp;&nbsp;&nbsp; private final Flippers flippers;<br />&nbsp;&nbsp;&nbsp; private final WebbedFeet webbedFeet;<br /><br />&nbsp;&nbsp;&nbsp; public Penguin() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.flippers = new Flippers();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.webbedFeet = new WebbedFeet();<br />&nbsp;&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp;&nbsp; public void flap() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.flippers.flap();<br />&nbsp;&nbsp;&nbsp; }<br /><br />&nbsp;&nbsp;&nbsp; public void kick() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.webbedFeet.kick();<br />&nbsp;&nbsp;&nbsp; }<br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (666,8,0,'<p>Паттерн: <strong>Singletone</strong><br />Цель: Создать единственный объект в приложении, доступный различным классам и потокам.<br />Решение: <br />public class Singleton {<br />&nbsp;&nbsp;&nbsp; private int field = 0;<br />&nbsp;&nbsp;&nbsp; <span style="text-decoration: underline;"><strong>private</strong> </span>Singleton() {}<br />&nbsp;&nbsp;&nbsp; <span style="text-decoration: underline;"><strong>private static</strong></span> final Singleton <span style="text-decoration: underline;"><strong>instance</strong> </span>= new Singleton();</p>
<p>&nbsp;&nbsp;&nbsp; public static Singleton getInstance() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return instance;<br />&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; public synchronized void increaseField(int amount) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; field += amount;<br />&nbsp;&nbsp;&nbsp; }</p>
<p>&nbsp;&nbsp;&nbsp; public synchronized int getField() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return field;<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br />Использование:<br /><br />public class Consumer {<br />&nbsp;&nbsp;&nbsp; public void doSomething(int needed) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Singleton singleton = Singleton.getInstance();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(singleton.getField() &lt; needed) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />}</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (667,8,0,'Если у класса все конструкторы объявлены <strong>private</strong>, он по факту становится финальным.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (668,8,2,'Приведите пример создания Singleton с помощью static clause и опишите преимущества такого подхода.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1493,668,'public class StaffRegister {<br />&nbsp;&nbsp;&nbsp; private static final StaffRegister instance;<br />&nbsp;&nbsp;&nbsp; static {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; instance = new StaffRegister();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Perform additional steps<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; private StaffRegister() {<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static StaffRegister getInstance() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return instance;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; // Data access methods<br />&nbsp;&nbsp;&nbsp; ...<br />}<br /><br />Такой вариант Singleton обеспечивает бОльшую гибкость по сравнению с прямой инициализацией статического поля, так как позволяет подготовить условия для создания экземпляра, а также обработать исключения, которые может выдать конструктор.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (669,8,2,'Опишите способ создания Singleton по методике Lazy Instantiation и укажите особенности такого подхода.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1494,669,'public class VisitorTicketTracker {<br />&nbsp;&nbsp;&nbsp; private static VisitorTicketTracker instance;<br />&nbsp;&nbsp;&nbsp; private VisitorTicketTracker() {<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static synchronized VisitorTicketTracker getInstance() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(instance == null) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; instance = new VisitorTicketTracker();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return instance;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; // Data access methods<br />&nbsp;&nbsp;&nbsp; ...<br />}<br /><br />Достоинством можно считать более бережное расходование памяти на старте программы. Недостатком - паузы при инстанциировании объектов по мере обращения.<br /><br />Также конструктивным недостатком является невозможность маркировать поле с экземпляром как <strong>final</strong>. Поэтому <strong>getInstance</strong>() приходится делать <strong>synchronized</strong>, иначе может создаться два объекта, только один из которых ляжет в поле instance. Синхронизированный метод <strong>getInstance</strong>() - это тоже не очень хорошо, так как снижает производительность',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (670,8,0,'Шаблон Singleton можно реализовать не только с помощью объекта в статичном поле. Такой подход, в частности, не сработает в мультиплатформенных приложениях, где сосуществуют одновременно несколько JVM. В этом случас базой для реализации может стать сервер БД или очереди.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (671,8,2,'Как решить проблему синхронизации getInstance() в синглетоне с lazy instantiation?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1495,671,'Надо синхронизировать не весь метод, а только ту часть кода, которая отвечает за инстанциирование. Техника называется <em>double-checked locking</em>.<br /><br />private static volatile VisitorTicketTracker instance;<br />public static VisitorTicketTracker getInstance() {<br />&nbsp;&nbsp;&nbsp; if(instance == null) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; synchronized(VisitorTicketTracker.class) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(instance == null) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; instance = new VisitorTicketTracker();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; return instance;<br />}<br /><br /><br />Модификатор <strong>volatile</strong> нужен, чтобы все потоки видели <strong>instance</strong> сразу же, как только он был присвоен. Иначе может быть задержка. Ключевое слово <strong>volatile</strong> гарантирует атомарность чтения/записи переменной.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (672,8,0,'Паттерн: <strong>Immutable Object</strong><br />Цель: создать read-only объекты, доступные среди множества классов и потоков.<br />Общая стратегия: <br /><strong>1</strong>. Все свойства устанавливаются в конструкторах.<br /><strong>2</strong>. Все переменные экземпляра - <strong>private</strong> и <strong>final</strong>.<br /><strong>3</strong>. Никаких сеттеров.<br /><strong>4</strong>. Запрет прямого доступа к <em>изменяемым</em> объектам внутри неизменяемого (например, если объект ссылается на список, то возвращать можно только копию этого списка (Collections.unmodifiableList()), либо предоставить собственные сервисные методы работы с ним). Этот пункт также предписывает делать свою собственную копию любого изменяемого объекта, который передается извне - чтобы у вызывающего не осталось опасной ссылки.<br /><strong>5</strong>. Защита методов от переопределения. Если переопределить метод неизменяемого класса, то можно добавить в дочерний класс собсственные свойства и работать с ними своими методами, и неизменяемость тут не гарантируется. Варианты реализации - объявить класс финальным либо использовать паттерн Factory.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (673,8,0,'<p>Паттерн: <strong>Builder</strong><br />Цель: создать объект, у которого на этапе инстанциирования должны быть установлены многочисленные свойства.<br />Проблема: у объектов с кучей свойств приходится заводить конструкторы с огромным списком аргументов, а потом при изменении набора свойств классы потребители должны менять свой код. Либо можно заводить каждый раз новый конструктор, но тогда в них скоро придется запутаться. Сделать кучу сеттеров не подходит для неизменяемых объектов, а для изменяемых есть риск нарушить консистентность состояния объекта.<br /><span style="text-decoration: underline;">Решение</span>: Параметры передаются объекту-билдеру, и основной объект генерируется финальным методом билдера. Пример билдера:<br /><br />public class AnimalBuilder {<br />&nbsp;&nbsp;&nbsp; private String species;<br />&nbsp;&nbsp;&nbsp; private int age;<br />&nbsp;&nbsp;&nbsp; public AnimalBuilder setAge(int age) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.age = age;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public AnimalBuilder setSpecies(String species) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.species = species;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return this;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public Animal build() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return new Animal(species,age,favoriteFoods);<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br />AnimalBuilder duckBuilder = new AnimalBuilder();<br />duckBuilder<br />&nbsp;&nbsp;&nbsp; .setAge(4)<br />&nbsp;&nbsp;&nbsp; .setSpecies("duck");<br />Animal duck = duckBuilder.build();</p>
<p><em>или</em></p>
<p>Animal flamingo = new AnimalBuilder()<br />&nbsp;&nbsp;&nbsp; .setAge(3)<br />&nbsp;&nbsp;&nbsp; .setSpecies("flamingo").build();<br /><br />Частая практика - билдер проставляет в объект значения по умолчанию, если они не поступили извне.</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (674,8,0,'Шаблоны проектирования часто создаются для того, чтобы в зародыше пресечь вероятность появления антипаттернов.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (675,8,0,'Итог применения паттерна <strong>Builder</strong> - у потребителей есть возможность создавать объекты, не думая о том, что поменялось в их структуре.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (676,8,0,'В паттерне <strong>Builder</strong> объект-билдер и основной объект находятся в <span style="text-decoration: underline;">тесной связи</span> (<em>tight coupling</em>), т.е. минимальные изменения в одном классе фундаментально влияют на другой. На практике такие классы размещают поблизости: либо в одном пакете, либо делают билдер вложенным (nested) классом.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (677,8,0,'<p>Паттерн: <strong>Factory</strong> (a.k.a. Factory Method)<br />Цель: создание объектов, точный тип которых может быть не известен до времени выполнения. Например, определение, экземпляр какого подкласса создать в той или иной ситуации.<br />Решение: Использование класса-фабрики для производства объектов в соответствии с входными параметрами.<br />Фабрики часто возвращают объекты посредством статичных методов,т.е. ссылка на экземпляр самой фабрики не нужна. Классы фабрик оканчиваются на Factory.<br />Пример простой фабрики:<br /><br />public abstract class Food {}<br />public class Hay extends Food {}<br />public class Pellets extends Food {}<br />public class Fish extends Food {}</p>
<p>public class FoodFactory {<br />&nbsp;&nbsp;&nbsp; public static Food getFood(String animalName) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch(animalName) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case "zebra": return new Hay(100);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case "rabbit": return new Pellets(5);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case "goat": return new Pellets(30);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case "polar bear": return new Fish(10);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Good practice to throw an exception if no matching subclass could be found<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; throw new UnsupportedOperationException("Unsupported animal: "+animalName);<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br />...<br /><br />final Food food = FoodFactory.getFood("polar bear");<br /><br /><br /></p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (678,8,0,'Для работы фабрик в паттерне <strong>Factory</strong> необходим доступ к конструкторам создаваемых объектов. Однако желательно не давать создавать объекты напрямую, без обращения к фабрике. Поэтому популярным решением является помещение классов и их фабрики в один пакет, а конструкторы классов получают default access. Если же фабрика лежит в другом пакете, то конструкторы классов придется делать <strong>public</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (679,8,0,'Альтернатива паттерну Factory - создание метода getSomething внутри классов, которые мы подаем фабрике как параметры. Однако в этом случае образуется tight coupling между классом и некоторым Something, что чревато переделками кода, если структура и ассортимент Something изменятся. А фабрика позволяет реализовать loose coupling.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (680,8,1,'Which of the following statements about design principles and design patterns are true? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1496,680,'A design principle is focused on solving a specific commonly occurring problem.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1497,680,'Design principles and design patterns are the same thing.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1498,680,'Design principles are often applied throughout an application, whereas design patterns are applied to solve specific problems.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1499,680,'Design patterns can only be applied to static classes.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1500,680,'Design principles and design patterns tend to produce code that is easier to maintain and easier for other developers to read.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (681,8,1,'<div>What is the result of the following code?</div>
<div>&nbsp;</div>
<div>1: public interface CanClimb {</div>
<div>2:&nbsp; &nbsp; &nbsp;public abstract void climb();</div>
<div>3: }</div>
<div>4: public interface CanClimbTrees extends CanClimb {}</div>
<div>5: public abstract class Chipmunk implements CanClimbTrees {</div>
<div>6:&nbsp; &nbsp; &nbsp;public abstract void chew();</div>
<div>7: }</div>
<div>8: public class EasternChipmunk extends Chipmunk {</div>
<div>9:&nbsp; &nbsp; &nbsp;public void chew() { System.out.println("Eastern Chipmunk is Chewing"); }</div>
<div>10: }</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1504,681,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1505,681,'The code will not compile because of line 8.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1506,681,'It compiles but throws an exception at runtime.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1501,681,'It compiles and runs without issue.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1502,681,'The code will not compile because of line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1503,681,'The code will not compile because of line 4.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (682,8,1,'<div>Which of the following are valid functional interfaces? (Choose all that apply.)</div>
<div>&nbsp;</div>
<div>public interface Climb {</div>
<div>&nbsp; &nbsp; public int climb();</div>
<div>}</div>
<div>public abstract class Swim {</div>
<div>&nbsp; &nbsp; public abstract Object swim(double speed, int duration);</div>
<div>}</div>
<div>public interface ArcticMountainClimb extends MountainClimb {</div>
<div>&nbsp; &nbsp; public default int getSpeed();</div>
<div>}</div>
<div>public interface MountainClimb extends Climb {}</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1507,682,'Climb',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1508,682,'Swim',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1509,682,'ArcticMountainClimb',false,'дефолтный метод должен иметь реализацию');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1510,682,'MountainClimb',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1511,682,'None of these are valid functional interfaces.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (683,8,0,'Функциональный интерфейс может иметь любое число дефолтных методов.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (684,8,1,'Which of the following are valid lambda expressions? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1512,684,'() -&gt; ""',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1513,684,'x,y -&gt; x+y',false,'нужны скобки, т.к. параметров несколько');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1514,684,'(Coyote y) -&gt; return 0;',false,'нужны фигурные скобки, т.к. есть return');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1515,684,'(Camel c) -&gt; {return;}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1516,684,'Wolf w -&gt; 39',false,'нужны скобки, если указан тип аргумента');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1517,684,'() -&gt;',false,'нет тела');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1518,684,'(Animal z, m) -&gt; a',false,'если хотя бы для одного аргумента указан тип, то должен быть указан для всех.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (685,8,1,'What are some of the properties of using the singleton pattern? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1520,685,'Requires constructor of singleton class to be private.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1521,685,'Singleton object must be named instance.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1522,685,'Singleton object may be private or protected.',false,'только private');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1523,685,'Ensures that there is only one instance of an object in memory.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1524,685,'Requires a public static method to retrieve the instance of the singleton.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1519,685,'Singleton object can be replaced with encapsulated setter method.',false,'нельзя менять синглтон');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (686,8,1,'<div>What is the result of the following class?</div>
<div>&nbsp;</div>
<div>import java.util.function.*;</div>
<div>public class Panda {</div>
<div>&nbsp; &nbsp; int age;</div>
<div>&nbsp; &nbsp; public static void main(String[] args) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; Panda p1 = new Panda();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; p1.age = 1;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; check(p1, p -&gt; p.age &lt; 5); // h1</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; private static void check(Panda panda, Predicate&lt;Panda&gt; pred) { // h2</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; String result = pred.test(panda) ? "match": "not match"; // h3</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; System.out.print(result);</div>
<div>} }</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1525,686,'match',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1526,686,'not match',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1527,686,'Compiler error on line h1.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1528,686,'Compiler error on line h2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1529,686,'Compile error on line h3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1530,686,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (687,8,1,'<div>What changes need to be made to make the following immutable object pattern correct? (Choose all that apply.)</div>
<div>&nbsp;</div>
<div>import java.util.List;</div>
<div>public class Seal {</div>
<div>&nbsp; &nbsp; String name;</div>
<div>&nbsp; &nbsp; private final List&lt;Seal&gt; friends;</div>
<div>&nbsp; &nbsp; public Seal(String name, List&lt;Seal&gt; friends) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; this.name = name;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; this.friends = friends;</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; public String getName() { return name; }</div>
<div>&nbsp; &nbsp; public List&lt;Seal&gt; getFriends() { return friends; }</div>
<div>}</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1536,687,'Change the type of List&lt;Seal&gt; to List&lt;Object&gt;.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1537,687,'Make a copy of the List&lt;Seal&gt; friends in the constructor.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1538,687,'Mark the Seal class final.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1531,687,'None; the immutable object pattern is properly implemented.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1532,687,'Have Seal implement the Immutable interface.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1533,687,'Mark name final and private.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1534,687,'Add setters for name and List&lt;Seal&gt; friends.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1535,687,'Replace the getFriends() method with methods that do not give the caller direct access to the List&lt;Seal&gt; friends.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (688,8,1,'<div>Which of the following are true of interfaces? (Choose all that apply.)</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1539,688,'They can extend other classes.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1540,688,'They cannot be extended.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1541,688,'They enable classes to have multiple inheritance.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1542,688,'They can only contain abstract methods.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1543,688,'They can be declared final.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1544,688,'All members of an interface are public.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (689,8,1,'<div>What changes need to be made to make the following singleton pattern correct? (Choose all that apply.)</div>
<div>&nbsp;</div>
<div>public class CheetahManager {</div>
<div>&nbsp; &nbsp; public static CheetahManager cheetahManager;</div>
<div>&nbsp; &nbsp; private CheetahManager() {}</div>
<div>&nbsp; &nbsp; public static CheetahManager getCheetahManager() {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if(cheetahManager == null) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; cheetahManager = new CheetahManager();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return cheetahManager;</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1545,689,'None; the singleton pattern is properly implemented.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1546,689,'Rename cheetahManager to instance.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1547,689,'Rename getCheetahManager() to getInstance().',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1548,689,'Change the access modifier of cheetahManager from public to private.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1549,689,'Mark cheetahManager final.',false,'<p>Нельзя. Финальную переменную надо сразу инстанциировать, и тогда lazy instantiation будет невозможна</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1550,689,'Add synchronized to getCheetahManager().',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (690,8,1,'<div>What is the result of the following code assuming each interface is a separate file?</div>
<div>&nbsp;</div>
<div>1: public interface CanWalk {</div>
<div>2:&nbsp; &nbsp; &nbsp;default void walk() { System.out.println("Walking"); }</div>
<div>3: }</div>
<div>4: public interface CanRun {</div>
<div>5:&nbsp; &nbsp; &nbsp;public default void walk() { System.out.println("Walking"); }</div>
<div>6:&nbsp; &nbsp; &nbsp;public abstract void run();</div>
<div>7: }</div>
<div>8: public interface CanSprint extends CanWalk, CanRun {</div>
<div>9:&nbsp; &nbsp; &nbsp;void sprint();</div>
<div>10: }</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1552,690,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1553,690,'The code will not compile because of line 6.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1554,690,'The code will not compile because of line 8.',true,'компилятор не знает, какой дефолтный метод наследовать');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1555,690,'The code will not compile because of line 9.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1551,690,'The code compiles without issue.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (691,8,1,'<div>Which lambda can replace the MySecret class to return the same value? (Choose all that apply.)</div>
<div>&nbsp;</div>
<div>public interface Secret {</div>
<div>&nbsp; &nbsp; String magic(double d);</div>
<div>}</div>
<div>public class MySecret implements Secret {</div>
<div>&nbsp; &nbsp; public String magic(double d) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return "Poof";</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1556,691,'caller((e) -&gt; "Poof");',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1557,691,'caller((e) -&gt; {"Poof"});',false,'нет return');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1558,691,'caller((e) -&gt; { String e = ""; "Poof" });',false,'нельзя переопределять переменную в теле; нет return');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1559,691,'caller((e) -&gt; { String e = ""; return "Poof"; });',false,'нельзя переопределять переменную в теле');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1560,691,'caller((e) -&gt; { String e = ""; return "Poof" });',false,'нельзя переопределять переменную в теле; нет точки с запятой');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1561,691,'caller((e) -&gt; { String f = ""; return "Poof"; });',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (692,8,1,'<div>What is the result of the following code?</div>
<div>&nbsp;</div>
<div>interface Climb {</div>
<div>&nbsp; &nbsp; boolean isTooHigh(int height, int limit);</div>
<div>}</div>
<div>public class Climber {</div>
<div>&nbsp; &nbsp; public static void main(String[] args) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; check((h, l) -&gt; h.toString(), 5); // x1</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; private static void check(Climb climb, int height) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; if (climb.isTooHigh(height, 10)) // x2</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System.out.println("too high");</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else System.out.println("ok");</div>
<div>} }</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1562,692,'ok',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1563,692,'too high',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1564,692,'Compiler error on line x1.',true,'попытка применить toString() к int; в теле лямбды возвращается String, а в интерфейсе - boolean');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1565,692,'Compiler error on line x2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1566,692,'Compiler error on a different line.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1567,692,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (693,8,1,'<div>Which of the following are properties of classes that define immutable objects? (Choose all that apply.)</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1568,693,'They don&rsquo;t define any getter methods.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1569,693,'All of the instance variables are marked private and final.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1570,693,'They don&rsquo;t define any setter methods.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1571,693,'They mark all instance variables static.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1572,693,'They prevent methods from being overridden.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1573,693,'All getter methods are marked synchronized.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (694,8,1,'<div>Which of the following statements can be inserted in the blank line so that the code will compile successfully? (Choose all that apply.)</div>
<div>&nbsp;</div>
<div>public interface CanHop {}</div>
<div>public class Frog implements CanHop {</div>
<div>&nbsp; &nbsp; public static void main(String[] args) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; _______________ frog = new TurtleFrog();</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>
<div>public class BrazilianHornedFrog extends Frog {}</div>
<div>public class TurtleFrog extends Frog {}</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1574,694,'Frog',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1575,694,'TurtleFrog',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1576,694,'BrazilianHornedFrog',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1577,694,'CanHop',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1578,694,'Object',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1579,694,'Long',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (695,8,1,'<div>Which of the following statements about polymorphism are true? (Choose all that apply.)</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1584,695,'By defining a public instance method in the superclass, you guarantee that the specific method will be called in the parent class at runtime.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1580,695,'A reference to an object may be cast to a subclass of the object without an explicit cast.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1581,695,'If a method takes a class that is the superclass of three different object references, then any of those objects may be passed as a parameter to the method.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1582,695,'A reference to an object may be cast to a superclass of the object without an explicit cast.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1583,695,'All cast exceptions can be detected at compile time.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (696,8,1,'<div>Choose the correct statement about the following code:</div>
<div>&nbsp;</div>
<div>1: public interface Herbivore {</div>
<div>2:&nbsp; &nbsp; &nbsp;int amount = 10;</div>
<div>3:&nbsp; &nbsp; &nbsp;public static void eatGrass();</div>
<div>4:&nbsp; &nbsp; &nbsp;public int chew() {</div>
<div>5:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 13;</div>
<div>6:&nbsp; &nbsp; &nbsp;}</div>
<div>7: }</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1585,696,'It compiles and runs without issue.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1586,696,'The code will not compile because of line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1587,696,'The code will not compile because of line 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1588,696,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1589,696,'The code will not compile because of lines 2 and 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1590,696,'The code will not compile because of lines 3 and 4.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (697,8,1,'<div>Which of the following are properties of classes that are properly encapsulated as a JavaBean? (Choose all that apply.)</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1591,697,'All instance variables are marked final.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1592,697,'boolean instance variables are accessed with is or get.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1593,697,'All instance variables are marked private.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1594,697,'They implement the JavaBean interface.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1595,697,'Variables are created using lazy instantiation.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1596,697,'The first letter of the any getter/setter, after the get, set, or is prefix, must be uppercase.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (698,8,1,'<div>Which of the following statements about inheritance and object composition are correct? (Choose all that apply.)</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1600,698,'Object composition supports method overriding at runtime.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1601,698,'Object composition requires a class variable to be declared public or accessible from a public method to be used by a class in a different package.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1602,698,'Object composition is always preferred to inheritance.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1597,698,'Inheritance supports access to protected variables.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1598,698,'Object composition tends to promote greater code reuse than inheritance.',true,'я бы не был так уверен, ну да ладно');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1599,698,'Inheritance relies on the has-a principle.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (699,8,1,'<div>Which three scenarios would best benefit from using a singleton pattern? (Choose all three.)</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1603,699,'Create read‐only objects that are thread-safe.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1604,699,'Manage a reusable cache of objects.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1605,699,'Ensure that all objects are lazily instantiated.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1606,699,'Manage write access to a log file.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1607,699,'Provide central access to application configuration data.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1608,699,'Allow multiple instances of a static object to be managed in memory.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (700,8,1,'<div>Choose the correct statement about the following code:</div>
<div>&nbsp;</div>
<div>1: public interface CanFly {</div>
<div>2:&nbsp; &nbsp; &nbsp;void fly();</div>
<div>3: }</div>
<div>4: interface HasWings {</div>
<div>5:&nbsp; &nbsp; &nbsp;public abstract Object getWingSpan();</div>
<div>6: }</div>
<div>7: abstract class Falcon implements CanFly, HasWings {</div>
<div>8: }</div>
<div>&nbsp;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1609,700,'It compiles without issue.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1610,700,'The code will not compile because of line 2.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1611,700,'The code will not compile because of line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1612,700,'The code will not compile because of line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1613,700,'The code will not compile because of lines 2 and 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1614,700,'The code will not compile because the class Falcon doesn&rsquo;t implement the interface methods.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (701,8,2,'Как преобразовать массив в список?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1615,701,'List&lt;String&gt; list = Arrays.asList(array);<br /><br /><br />Список с массивом оказываются связанными. Изменения в одном из них вызовут изменения в другом. Нельзя добавлять элементы к получившемуся списку или удалять их из него.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (702,8,2,'Как преобразовать список в массив?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1616,702,'String[] array2 = (String[]) list.toArray();<br />&nbsp; <em>или</em><br />String[] array2 = list.toArray(new String[0]);<br /><br />Получившийся массив не связан со списком, его можно редактировать без опасений повредить список.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (703,8,2,'Дан код:<br /><br />
<div>int[] numbers = {6,9,1,8};</div>
<div>Arrays.sort(numbers);</div>
<div>int index1 = Arrays.binarySearch(numbers, 6);</div>
<div>int index2 = Arrays.binarySearch(numbers, 3);</div>
<div><br />Чему равны <em>index1</em> и <em>index2</em>?</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1617,703,'index1 = 1<br />index2 = -2 (индекс позиции, где должно было бы оказаться это число, умноженный на -1 и уменьшенный на 1)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (704,8,0,'Для двоичного поиска в коллекции используется <strong>Collections</strong>.<strong>binarySearch</strong>(<em>collection</em>, <em>element</em>), а для поиска в массивах - <strong>Arrays</strong>.<strong>binarySearch</strong>(<em>array</em>, <em>element</em>). И туда, и туда можно подать компаратор, с которым был отсортирован список/массив');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (705,8,0,'Autoboxing происходит, в том числе, тогда, когда примитив попадает в контекст, который ожидает дженерика.&nbsp;<br /><br />
<div>&nbsp; &nbsp; static &lt;T&gt; void testAutobox(T i) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(i.getClass()); //&nbsp;class java.lang.Integer</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; ...<br />&nbsp; &nbsp;testAutobox(4);</div>
<br />Autounboxing:<br />&nbsp;int i = new Integer(3);');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (706,8,0,'В конструкторы оберток надо подавать строго соответствующие примитивы.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (707,8,2,'Что будет выдано в результате работы следующего кода?<br /><br />
<div>3: List&lt;Integer&gt; numbers = new ArrayList&lt;Integer&gt;();</div>
<div>4: numbers.add(1);</div>
<div>5: numbers.add(new Integer(3));</div>
<div>6: numbers.add(new Integer(5));</div>
<div>7: numbers.remove(1);</div>
<div>8: numbers.remove(new Integer(5));</div>
<div>9: System.out.println(numbers);</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1618,707,'[1]. Метод&nbsp;<strong>remove</strong>&nbsp;перегружен. Они принимает либо&nbsp;<strong>int</strong>&nbsp;(индекс удаляемого элемента), либо объект, который надо удалить. В строке 4 аргумент не приводится к&nbsp;<strong>Integer</strong>, т.к. есть в наличии метод, принимающий&nbsp;<strong>int</strong>.<br /><br />Кстати, метод&nbsp;<strong>remove</strong>(Object) удалит только первое вхождение.<br /><br />Еще кстати. <strong>remove</strong>(Object) возвращает true/false, а <strong>remove</strong>(int) - удаленный объект',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (708,8,0,'Diamond operator не обязательно должен использоваться в одной строке с объявлением переменной. Например, следующий код тоже вполне корректен:<br /><br />
<div>ArrayList&lt;String&gt; copyOfNames;</div>
<div>copyOfNames = new ArrayList&lt;&gt;();</div>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (709,8,0,'Параметр в угловых скобках в дженериках называется <em>formal type parameter</em>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (710,8,2,'Приведите пример простого дженерик-класса');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1619,710,'<div>public class GenericContainer&lt;T&gt; {</div>
<div>&nbsp; &nbsp; private T contents;</div>
<div>&nbsp; &nbsp; public T getContents() {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return contents;</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; public void setContents(T contents) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; this.contents = contents;</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (711,8,0,'<div>Соглашения о именованиях в дженериках.</div>
<div>&nbsp;</div>
<div>&nbsp;E for an element</div>
<div>&nbsp;K for a map key</div>
<div>&nbsp;V for a map value</div>
<div>&nbsp;N for a number</div>
<div>&nbsp;T for a generic data type</div>
<div>&nbsp;S, U, V, and so forth for multiple generic types</div>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (712,8,0,'Польза дженериков проявляется тогда, когда нужно обеспечить одинаковый подход к классам, не имеющим между собой иерархической и смысловой связи.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (713,8,2,'Что такое <em>type erasure</em>?<br />');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1620,713,'Это отражение того факта, что работа с дженериками происходит на этапе компиляции. В байт-коде нет информации о том, какими типами параметризованы дженерик-классы - компилятор везде подставит Object. Что же касается присваивания дженерика переменной, то компилятор подставит явный кастинг.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (714,8,2,'Приведите 3 способа имплементации интерфейса<br /><br />
<div>public interface Shippable&lt;T&gt; {</div>
<div>&nbsp; &nbsp; void ship(T t);</div>
<div>}<br /><br />Опишите их особенности.</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1621,714,'1) Имплементация с конкретным типом. Получившийся класс нельзя будет параметризовать, он будет работать только с одним типом.<br /><br />
<div>class ShippableRobotCrate implements Shippable&lt;Robot&gt; {</div>
<div>&nbsp; &nbsp; public void ship(Robot t) { }</div>
<div>}<br /><br />2) Имплементация с оставлением параметризации. Класс будет работать с любыми типами.<br /><br />
<div>class ShippableAbstractCrate&lt;U&gt; implements Shippable&lt;U&gt; {</div>
<div>&nbsp; &nbsp; public void ship(U t) { }</div>
<div>}<br /><br />(то что формальный параметр отличается, роли не играет)<br /><br />3) Имплементация без параметризации (использование <em>raw type</em>). Вообще не указываем угловые скобки, тогда класс будет работать только с <strong>Object</strong>.<br /><br />
<div>class ShippableCrate implements Shippable {</div>
<div>&nbsp; &nbsp; public void ship(Object t) { }</div>
<div>}</div>
</div>
</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (715,8,2,'Что не получится сделать с дженериками во всяком случае, без использования изощренных приемов?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1622,715,'- вызвать конструктор. new T() в рантайме превратилось бы в new Object()<br />- создать <span style="text-decoration: underline;">массив</span> (не список) дженериков (был бы по факту массив Object)<br />- использовать <strong>instanceof </strong><em>(уточнить, почему)<br />- </em>использовать примитив в качестве типа дженерика (зато можно использовать обертку).<br />- создавать статические переменные типа дженерика (поскольку тип дженерика связан с экземпляром объекта).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (716,8,0,'Типа, вся информация о которых есть на момент времени выполнения, называются <em>reifiable</em>. С ними можно делать все. У non-reifiable (дженериков) есть ограничения.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (717,8,0,'Параметризовать можно любой метод, в т.ч. метод экземпляра, но чаще можно увидеть статичные дженерик-методы, т.к. экземпляр класса и его методы имеют доступ к параметрам, определенным в классе/интерфейсе.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (718,8,2,'Приведите пример дженерик-метода (статичного).');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1623,718,'public static &lt;T&gt; List&lt;T&gt; packToList(T t) {<br />&nbsp;&nbsp;&nbsp; List&lt;T&gt; list = new ArrayList&lt;T&gt;();<br />&nbsp;&nbsp;&nbsp; return list;<br />}<br /><br />Указание в угловых скобках формального типа параметра обязательно, без этого не скомпилируется!',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (719,8,0,'Необходимо помнить, что дженерики сильны на этапе компиляции, поэтому не надо думать "как Java поймет, какой тип передался", т.к. Java над этим не думает и работает только с объектами, а все необходимые кастинги компилятор сам добавляет в JVM, исходя из контекста кода.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (720,8,2,'Как явным образом передать в дженерик-метод желаемый тип?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1624,720,'Указать его в угловых скобках перед именем метода, однако метод должен обязательно идти после dot-оператора.<br /><br />new Test4().&lt;String&gt;getTT("d");<br /><br />В этом случае компилятор проверит аргумент на соответствие подаваемому типу, а если бы этого типа не было, то компилятор использовал бы тип параметра как подаваемый тип.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (721,8,0,'Использование параметризованных классов без параметризации (<em>raw types</em>) опасно, т.к.&nbsp;ссылку такого типа можно без проблем подать в метод, который ожидает конкретного дженерика, и в методе будут проблемы.<br /><br />class Dragon {}<br />class Unicorn { }<br />public class LegacyDragons {<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; List unicorns = new ArrayList();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unicorns.add(new Unicorn());<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printDragons(unicorns);<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; private static void printDragons(List&lt;Dragon&gt; dragons) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (Dragon dragon: dragons) { // ClassCastException<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(dragon);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br />&nbsp;&nbsp;&nbsp; } <br />}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (722,8,0,'На экзамене надо узнавать ситуации, в которых выдается <span style="text-decoration: underline;">предупреждение</span> компилятора.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (723,8,2,'Почему и в какой строке будет выдана ошибка при выполнении следующего кода?<br /><br />-1: class Dragon {}<br />0: class Unicorn { }<br /><br />1: public class LegacyUnicorns {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; java.util.List&lt;Unicorn&gt; unicorns = new java.util.ArrayList&lt;&gt;();<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addUnicorn(unicorns);<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unicorn unicorn = unicorns.get(0);<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7:&nbsp;&nbsp;&nbsp;&nbsp; private static void addUnicorn(java.util.List unicorn) {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unicorn.add(new Dragon());<br />9:&nbsp;&nbsp;&nbsp;&nbsp; } <br />10: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1625,723,'Ошибка будет в строке 5, <strong>ClassCastException</strong>. Она произойдет из-за того, что метод <strong>addUnicorn</strong> принимает <em>raw</em>-список (которым оказывается при подаче в метод&nbsp;"корректный" массив <em>unicorns</em>) и помещает туда произвольный объект. Потом при попытке извлечь объект конкретного типа (согласно ссылке, с которой работаем) выясняется, что там вовсе не <strong>Unicorn</strong>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (724,8,1,'Какой результат получится в результате выполнения следующего кода?<br /><br />1: public class LegacyAutoboxing {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; java.util.List numbers = new java.util.ArrayList();<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; numbers.add(5);<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int result = numbers.get(0);<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1626,724,'выполнится без ошибок',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1627,724,'RuntimeException в строке 4',false,'тут будет порядок, так как автобоксинг в Integer из int пройдет без проблем');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1628,724,'не скомпилируется в строке 5',true,'Аувтоанбоксинг не сработает. Java не может превратить Object в int.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (725,8,2,'Каков основной смысл <em>wildcards</em> в дженериках?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1629,725,'Смысл - ограничить набор классов, который может использоваться в дженерике, чтобы стало доступным какое-то API.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (726,8,2,'Что такое <em>wildcard generic type</em>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1630,726,'Это неизвестный тип, обозначенный знаком вопроса',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (727,8,2,'Какие типы <em>wildcard</em> бывают в дженериках?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1631,727,'1. <em>Unbounded wildcard</em>:<br />List&lt;<strong>?</strong>&gt; l = new ArrayList&lt;String&gt;(); //new ArrayList&lt;?&gt;() делать нельзя!<br /><br />2. <em>Wildcard with an upper bound</em>.<br />List&lt;<strong>? extends Exception</strong>&gt; l = new ArrayList&lt;RuntimeException&gt;();<br /><br />3. <em>Wildcard with a lower bound</em>.<br />List&lt;<strong>? super Exception</strong>&gt; l = new ArrayList&lt;Object&gt;();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (728,8,2,'Почему нельзя сделать<br /><br />- List&lt;Object&gt; list_obj = new ArrayList&lt;String&gt;()?<br />- List&lt;String&gt; list_str = new ArrayList&lt;Object&gt;()?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1632,728,'- потому что в ссылку list_obj можно напихать не-строк, и список перестанет быть строковым(=испортится, например, если вернулся из метода).<br />- потому что нельзя будет дергать декларируемый API.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (729,8,1,'<p>Что напечатается после выполнения следующего кода?<br /><br />...<br />public static void printList(List&lt;Object&gt; list) {<br />&nbsp;&nbsp;&nbsp; for (Object x: list) System.out.println(x);<br />}</p>
<p>public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp; List&lt;String&gt; keywords = new ArrayList&lt;&gt;();<br />&nbsp;&nbsp;&nbsp; keywords.add("java");<br />&nbsp;&nbsp;&nbsp; printList(keywords);<br />}<br />...</p>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1633,729,'[java]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1634,729,'Runtime Error',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1635,729,'Compile Error',true,'В <strong>printList()</strong> нельзя передать ссылку типа List&lt;String&gt;. Проблему решило бы изменение List&lt;Objects&gt; в аргументах метода на List&lt;?&gt;. Можно было бы и просто List поставить, но получился бы опасный код, уничтожающий компиляторную проверку.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (730,8,1,'Что напечатается после выполнения следующего кода?<br /><br />...<br />&nbsp;&nbsp;&nbsp; Integer[] numbers = { new Integer(42)};<br />&nbsp;&nbsp;&nbsp; Object[] objects = numbers;<br />&nbsp;&nbsp;&nbsp; objects[0] = "forty two";&nbsp;<br />&nbsp;&nbsp;&nbsp; System.out.println(Arrays.toString(objects));<br />...');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1636,730,'[forty two]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1637,730,'Runtime Error',true,'код скомпилируется, но при выполнении будет выдано java.lang.ArrayStoreException в строке присваивания objects[0]');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1638,730,'Compile Error',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (731,8,2,'Чем использование неограниченного <em>wildcard</em> (List&lt;?&gt;) лучше <em>raw type</em> (List)?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1639,731,'List&lt;?&gt; не даст добавить новый элемент, а List - даст, и это может оказаться фатальным.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (732,8,0,'upper-bound wildcard позволяет использовать API элементов, lower-bound - добавлять элементы.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (733,8,2,'На примере коллекций поясните, какое удобство обеспечивают upper-bound wildcards.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1640,733,'Можно передавать в метод коллекции, содержащие элементы какого-либо типа и его подтипов:<br /><br />public static long total(List&lt;? extends Number&gt; list) {<br />&nbsp;&nbsp;&nbsp; long count = 0;<br />&nbsp;&nbsp;&nbsp; for (Number number: list)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count += number.longValue();<br />&nbsp;&nbsp;&nbsp; return count;<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (734,8,0,'<p>Если в качестве типа дженерика используется интерфейс, то принципы те же:<br /><br />interface Flyer { void fly(); }<br />class HangGlider implements Flyer { public void fly() {} }<br />class Goose implements Flyer { public void fly() {} }</p>
<p>private void anyFlyer(List&lt;Flyer&gt; flyer) {}<br />private void groupOfFlyers(List&lt;? extends Flyer&gt; flyer) {}<br /><br />List&lt;Goose&gt; можно&nbsp;отправить только во второй метод.</p>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (735,8,0,'Общий смысл wildcard bounds. <br />- В upperBound нельзя запускать методы, принимающие дженерик-тип. <br />- В upperBound метод, возвращающий дженерик, вернет ссылку типа, указанного в bound. <br />- В lowerBound в методы, принимающие дженерик-тип, можно подавать только указанный в bound тип и его потомков. <br />- В lowerBound запуск методов, возвращающих дженерик-тип, вернет <strong>Object</strong>.<br /><br />class Generic&lt;T&gt; {<br />&nbsp;&nbsp;&nbsp; void transfer(T t) {}<br />&nbsp;&nbsp;&nbsp; T back() {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return null;&nbsp;&nbsp;&nbsp; }<br />}<br />...<br />&nbsp;&nbsp;&nbsp; Generic&lt;Integer&gt; intGen = new Generic&lt;Integer&gt;();<br />&nbsp;&nbsp;&nbsp; Generic&lt;Number&gt; numGen = new Generic&lt;Number&gt;();<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; Generic&lt;? extends Number&gt; numGenUp = intGen;<br />&nbsp;&nbsp;&nbsp; Generic&lt;? super Number&gt; numGenLow = numGen;<br />&nbsp;&nbsp;&nbsp; <br />&nbsp;&nbsp;&nbsp; numGenUp.transfer(4); // doesn''t compile<br />&nbsp;&nbsp;&nbsp; Number num1 = numGenUp.back();<br />&nbsp;&nbsp;&nbsp;&nbsp;Integer num1 = numGenUp.back();&nbsp;//doesn''t compile,&nbsp; т.к. возвр.&nbsp;Integer<br /><br />&nbsp;&nbsp;&nbsp; numGenLow.transfer(5);<br />&nbsp;&nbsp;&nbsp; numGenLow.transfer(new Object()); //doesn''t compile<br />&nbsp;&nbsp;&nbsp; Number num2 = numGenLow.back(); //doesn''t compile, т.к. возвр. Object');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (736,8,0,'В статических членах нельзя использовать типы-дженерики класса, только собственные.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (737,8,0,'Дженерики с неограниченным wildcard (&lt;?&gt;) имеют все ограничения <em>bounded</em>: невозможность запускать методы, принимающие дженерик, и возврат <strong>Object</strong> методами, возвращающими дженерик');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (738,8,1,'Даны следующие классы:<br /><br />class A {}<br />class B extends A { }<br />class C extends B { }<br /><br />Из нижеперечисленных вариантов отметьте те, которые скомпилируются.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1641,738,'List&lt;?&gt; list1 = new ArrayList&lt;A&gt;();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1642,738,'List&lt;? extends A&gt; list2 = new ArrayList&lt;A&gt;();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1643,738,'List&lt;? super A&gt; list3 = new ArrayList&lt;A&gt;();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1644,738,'List&lt;? extends B&gt; list4 = new ArrayList&lt;A&gt;();',false,'этой ссылке можно присвоить только список, содержащий объекты типа <strong>B</strong> и их потомки');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1645,738,'List&lt;? super B&gt; list5 = new ArrayList&lt;A&gt;();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1646,738,'List&lt;?&gt; list6 = new ArrayList&lt;? extends A&gt;();',false,'нельзя создавать объект ArrayList с <em>wildcards</em>&nbsp;в указании типа. Это было бы и бессмысленно, т.к. в такой список ничего не получится добавить.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (739,8,1,'Имеем классы:<br /><br />class A {}<br />class B extends A { }<br />class C extends B { }<br /><br />Какие из нижеперечисленных дженерик-методов скомпилируются?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1648,739,'&lt;T&gt; &lt;? extends T&gt; method2(List&lt;? extends T&gt; list) {<br />&nbsp;&nbsp;&nbsp; return list.get(0);<br />}',false,'Возвращаемый тип не может содержать <em>wildcard</em>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1649,739,'&lt;B extends A&gt; B method3(List&lt;B&gt; list) {<br />&nbsp;&nbsp;&nbsp; return new B();<br />}',false,'Обозначение B использовано как дженерик и поэтому внутри метода теряет свою интерпретацию как имя реального класса. А создать объекты типа дженерика - нельзя.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1650,739,'void method4(List&lt;? super B&gt; list) {<br />}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1651,739,'&lt;X&gt; void method5(List&lt;X super B&gt; list) {<br />}',false,'Нельзя использовать формальный тип параметра в <em>wildcard</em>-контексте. Должно быть <strong>List</strong>&lt;? super <strong>B</strong>&gt;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1647,739,'&lt;T&gt; T method1(List&lt;? extends T&gt; list) {<br />&nbsp;&nbsp;&nbsp; return list.get(0);<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (740,8,0,'<em>Bounds</em> можно использовать не только с <em>wildcards</em>, но и как ограничение на использование дженерика в классе или методе:<br /><br />class Generic&lt;T extends Number&gt; {<br />&nbsp;&nbsp;&nbsp; T getT(T t) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return t;<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><em>&nbsp; или</em><br />static &lt;T extends Number&gt; void test(T t) {}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (741,8,2,'Перечислите основные интерфейсы <em>Java Collections Framework</em>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1652,741,'1. <strong>List</strong>: упорядоченный набор элементов с повторениями; элементы доступны по индексу.<br />2. <strong>Set</strong>: набор элементов без повторений.<br />3. <strong>Queue</strong>: набор элементов с особым порядком обработки, обычно FIFO<br />4. <strong>Map</strong>: набор пар "ключ-значение"; значения доступны по ключу, повторения ключей запрещены.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (742,8,0,'Интерфейсы <strong>List</strong>, <strong>Set</strong>, <strong>Queue</strong> являются наследниками <strong>Collection</strong>. <strong>Map</strong> - не является.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (743,8,2,'Перечислите общие методы для всех коллекций.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1653,743,'<strong>1</strong><em>. boolean </em><strong>add</strong>(<strong>E</strong> <em>element</em>) // E - формальный тип параметра<br /><br />(возвращает <strong>true</strong>, если удалось добавить, т.е. коллекция изменилась)<br /><br /><strong>2</strong>. <em>boolean</em> <strong>remove</strong>(<strong>Object </strong><em>object</em>) - удаление конкретного объекта<br /><em>boolean</em> <strong>remove</strong>(<strong>int</strong> <em>index</em>) - удаление по индексу, IndexOutOfBoundsException в случае неверного индекса<br /><br />(возвращает <strong>true</strong>, если удалось удалить, т.е. коллекция изменилась)<br /><br /><strong>3</strong>. <em>boolean </em><strong>isEmpty</strong>()<br /><strong><br />4</strong>. <em>int </em><strong>size</strong>()<br /><strong><br />5</strong>. void <strong>clear</strong>()<br /><strong><br />6</strong>. <em>boolean </em><strong>contains</strong>(<strong>Object</strong> <em>object</em>)<br /><br />(сравнение производится по <strong>equals</strong>)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (744,8,0,'Если в коллекции есть несколько одинаковых элементов, то <strong>remove</strong>(Object) удалит только один из них');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (745,8,2,'Назовите основные преимущества <strong>ArrayList</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1654,745,'1. Доступ к любому элементу за фиксированное время.<br />2. Добавление/удаление занимает больше времени, чем чтение<br /><br />Резюме: следует использовать, если чтение из списка производится чаще, чем запись в него.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (746,8,2,'Перечислите основные времена оценки быстродействия.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1655,746,'1. O(1) - постоянное время; время операции не зависит от объема данных. Пример: чтение из ArrayList<br /><br />2. O(log n) - логарифмическое время; время операции возрастает значительно медленнее, чем объем данных. Пример - двоичный поиск.<br /><br />3. O(n) - линейное время; время операции увеличивается линейно по мере роста объема данных. Пример: выборка из списка всех элементов, равных данному.<br /><br />4. O(n^2) - n-квадратное время; время операции увеличивается квадратично по мере роста объема данных. Пример - вложенная итерация по одной и той же коллекции.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (747,8,2,'Назовите особенности и преимущества <strong>LinkedList</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1656,747,'1. Реализует интерфейсы <strong>List</strong> и <strong>Queue<br /></strong>2. Доступ, добавление и удаление для <span style="text-decoration: underline;">граничных</span> элементов занимает постоянное время.<br />3. Аналогичные операции применительно к произвольному индексу занимают линейное время.<br /><br />Резюме: следует использовать в качестве очереди.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (748,8,0,'<strong>Vector</strong> работал медленно, зато был Thread-safe');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (749,8,2,'Перечислите основные методы <strong>List</strong> (за исключением унаследованных из <strong>Collection</strong>)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1657,749,'1. <em>void</em> <strong>add</strong>(<strong>int</strong> <em>index</em>, <strong>E</strong> <em>element</em>)<br /><br />вставляет элемент на указанное место со сдвигом оставшейся части вперед.<br /><br />2. <em>E</em> <strong>get</strong>(<strong>int</strong> <em>index</em>)<br /><br />возвращает элемент по индексу<br /><br />3. <em>int </em><strong>indexOf</strong>(<strong>Object</strong> <em>o</em>)<br /><br />возвращает первый встретившийся индекс указанного элемента либо -1<br /><br />4. <em>int </em><strong>lastIndexOf</strong>(<strong>Object</strong> <em>o</em>)<br /><br />возвращает последний встретившийся индекс указанного элемента либо -1<br /><br />5. <em>void</em> <strong>remove</strong>(<strong>int </strong><em>index</em>)<br /><br />удаляет элемент по индексу и сдвигает оставшуюся часть влево.<br /><br />6. <strong>E</strong> <em>set</em>(<strong>int</strong> <em>index</em>, <strong>E</strong> <em>e)<br /><br /></em>заменяет элемент по индексу и возвращает предыдущий',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (750,8,0,'<strong>Vector</strong> и <strong>Stack</strong> тоже реализуют интерфейс <strong>List</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (751,8,2,'Назовите 3 способа проитерироваться по списку.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1658,751,'1. Используя for-each:<br /><br />for (String string: list) {<br />&nbsp;&nbsp;&nbsp; System.out.println(string);<br />}<br /><br />2. Используя обычный for:<br /><br />for (int i = 0; i&lt;list.size(); i++) {<br />&nbsp;&nbsp;&nbsp; System.out.println(list[i]);<br />}<br /><br />3. Используя итератор:<br /><br />Iterator&lt;String&gt; iter = list.iterator();<br />while(iter.hasNext()) {<br />&nbsp;&nbsp;&nbsp; String string = iter.next();<br />&nbsp;&nbsp;&nbsp; System.out.println(string);<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (752,8,2,'Опишите особенности и преимущества <strong>HashSet</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1659,752,'HashSet использует хеш-таблицу для хранения элементов на основе метода <strong>hashCode</strong>(). Операция добавления, как операция проверки вхождения, осуществляется за фиксированное время. Порядок не сохраняется.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (753,8,2,'Опишите особенности и преимущества <strong>TreeSet</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1660,753,'Набор всегда отсортирован. Операции добавления и проверки вхождения занимают O(log n).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (754,8,0,'<strong>TreeSet</strong> реализует интерфейс <strong>NavigableSet</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (755,8,0,'В <strong>TreeSet</strong> можно поместить только объект, реализующий интерфейс <strong>Comparable</strong>, иначе будет ClassCastException.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (756,8,0,'<strong>Set</strong> не имеет каких-то специфичных методов, которых не было бы в <strong>Collection</strong>. (<em>на уровне экзамена</em>)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (757,8,2,'Перечислите специфичные методы интерфейса <strong>NavigableSet</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1661,757,'<em>E </em><strong>lower</strong>(E <em>e</em>) - возвращает наибольший элемент, строго меньший <em>e</em> (или <strong>null</strong> если такого элемента нет)<br /><em>E</em> <strong>floor</strong>(E <em>e</em>) - возвращает наибольший элемент, меньший либо равный <em>e</em> (или <strong>null</strong> если такого элемента нет)<br /><em>E</em> <strong>ceiling</strong>(E <em>e</em>)&nbsp; - возвращает наименьший элемент, больший либо равный <em>e</em> (<strong>или</strong> null если такого элемента нет)<br /><em>E</em> <strong>higher</strong>(E <em>e</em>) - возвращает наименьший элемент, строго больший <em>e</em> (<strong>или</strong> null если такого элемента нет)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (758,8,0,'<strong>LinkedList</strong> реализует интерфейсы <strong>Queue</strong> и <strong>List</strong> (поэтому это не самый эффективный класс). Кроме того, <strong>LinkedList</strong> реализует двустороннюю (<em>double-ended</em>) очередь (<strong>Deque</strong>). Эталонный образец двусторонней очереди <strong>- ArrayDeque</strong>.<br /><br />Двусторонняя очередь, по сути, объединяет функциональность обычной очереди (интерфейса <strong>Queue</strong>) и стека (<span style="text-decoration: underline;">класса</span> <strong>Stack). </strong>Интерфейс <strong>Deque</strong> наследует интерфейсу <strong>Queue</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (759,8,2,'Назовите основные методы интерфейса <strong>Queue</strong>&lt;E&gt;.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1662,759,'<em>boolean</em> <strong>add</strong>(<strong>E</strong> <em>e</em>) - Добавляет элемент в конец очереди и возвращает <strong>true</strong> или выдает исключение (если имеем дело с очередью фиксированного размера)<br /><br /><em>E</em> <strong>element</strong>() - возвращает следующий элемент или выдает исключение, если очередь пуста<br /><br /><em>boolean </em><strong>offer</strong>(<strong>E</strong> <em>e</em>) - добавляет элемент в конец очереди и возвращает успешность операции<br /><br /><em>E</em> <strong>remove</strong>()&nbsp; - удаляет и возвращает следующий элемент или выдает исключение, если очередь пуста<br /><br /><em>E</em> <strong>poll</strong>() - Возвращает и удаляет следующий элемент или возвращает <strong>null</strong>, если очередь пуста.<br /><br /><em>E</em> <strong>peek</strong>() - Возвращает следующий элемент или <strong>null</strong>, если очередь пуста<br /><br /><br /><br />',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (760,8,2,'Назовите основные методы структуры Stack (реализуемой с помощью интерфейса Deque).');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1663,760,'<em>void</em> <strong>push</strong>(<strong>E</strong> <em>e</em>) - добавляет элемент в начало стека, выдавая исключение, если добавление невозможно.<br /><br /><a><em>E </em><strong><strong>peek</strong></strong>() - Возвращает следующий элемент или <strong><strong>null</strong></strong>, если стек пуст<strong><br /></strong><br /><em>E</em> <strong>pop</strong>() - удаляет и возвращает следующий элемент или выдает исключение, если стек пуст.<strong><br /><br /></strong></a>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (761,8,2,'Назовите 3 наиболее популярных метода очередей (FIFO) и стеков (LIFO).');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1664,761,'FIFO: offer/poll/peek, все они не выдают исключений<br />LIFO: push/poll/peek, push в Deque может выдать исключение',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (762,8,0,'Особенность двусторонней очереди - наличие методов <strong>push</strong> и <strong>pop</strong>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (763,8,0,'TreeMap&lt;K,V&gt; предоставляет API интерфейса NavigableMap, схожее с NavigableSet.<br /><br />Методы выглядят так:<br />K <strong>floorKey</strong>(<strong>K</strong> <em>key</em>)<br /><em>Map.Entry</em>&lt;<em>K</em>,<em>V</em>&gt; <strong>floorEntry</strong>(<strong>K</strong> <em>key</em>)<br /><br />и аналогично для <strong>ceiling</strong>, <strong>lower</strong>, <strong>higher</strong>. Все сравнения и сортировки берутся по ключам.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (764,8,2,'Назовите особенности и преимущества <strong>HashMap</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1665,764,'- постоянное время для извлечения и добавления элементов по ключу.<br />- порядок вставки не сохраняется',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (765,8,2,'Назовите особенности и преимущества <strong>TreeMap</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1666,765,'- ключи хранятся в сортированном виде<br />- добавление и удаление занимает логарифмическое время.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (766,8,2,'Назовите основные методы интерфейса <strong>Map</strong>&lt;<em>K</em>,<em>V</em>&gt;');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1667,766,'<em>void</em> <strong>clear</strong>()<br /><em><br />boolean</em> <strong>isEmpty</strong>()<br /><em><br />int</em> <strong>size</strong>()<br /><em><br />V</em> <strong>get</strong>(<strong>Object</strong> <em>key</em>) Возвращает значение по ключу или null<br /><em><br />V</em> <strong>put</strong>(<strong>K</strong> <em>key</em>, <strong>V</strong> <em>value</em>) Добавляет пару ключ/значение. Возвращает предыдущее значение или null<br /><em><br />V</em> <strong>remove</strong>(<strong>Object</strong> <em>key</em>) Удаляет и возвращает значение по ключу либо null<br /><em><br />boolean</em> <strong>containsKey</strong>(<strong>Object</strong> <em>key</em>)<br /><em><br />boolean</em> <strong>containsValue</strong>(<strong>Object</strong> <em>value</em>)<br /><em><br />Set</em>&lt;<em>K</em>&gt; <strong>keySet</strong>() сет всех ключей<br /><em><br />Collection</em>&lt;<em>V</em>&gt; <strong>values</strong>() коллекция всех значений.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (767,8,2,'Что напечатает следующий код?<br /><br />Map&lt;String, String&gt; map = new TreeMap&lt;&gt;();<br />map.put("koala", "bamboo");<br />map.put("lion", "meat");<br />map.put("giraffe", "leaf");<br />System.out.println(map.contains("lion"));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1668,767,'Будет ошибка компиляции. Интерфейс Map не содержит&nbsp; метода <strong>contains</strong>, только <strong>containsKey</strong> и <strong>containsValue</strong>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (768,8,0,'Устаревший класс <strong>Stack</strong>&lt;E&gt; реализует интерфейс <strong>List</strong>. Ни <strong>Queue</strong>, ни <strong>Deque</strong><br />');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (769,8,0,'В <strong>TreeSet</strong> и <strong>TreeMap</strong> нельзя добавлять <strong>null</strong> (будет runtime error).<br /><br />В <strong>ArrayDeque</strong> нельзя добавлять <strong>null</strong>, так как это служебное значение для очередей. (будет runtime error).<br /><br /><br />');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (770,8,2,'Какой класс надо выбрать, если планируется возвращать хеш из стека хешей?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1669,770,'<strong>ArrayDeque. </strong>Можно было бы и Stack, но он устарел.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (771,8,2,'Какой класс следует выбрать, чтоы продавать билеты людям в очереди и говорить им при необходимости номер их очереди');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1670,771,'<strong>LinkedList</strong>. Только он реализует и список, и FIFO',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (772,8,2,'Какой класс следует выбрать, чтобы записать имена всех слонов (имена могут быть не уникальными) и регулярно читать их?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1671,772,'<strong>ArrayList</strong>. Он подходит для ситуаций, когда чтение требуется чаще, чем запись.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (773,8,2,'Какой класс выбрать, чтобы составить список уникальных зверей для посещения в зоопарке?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1672,773,'<strong>HashSet</strong>. К списку зверей нет дополнительных требований, кроме уникальности, поэтому выбираем самый быстрый сет.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (774,8,2,'Какой класс выбрать, чтобы составить список уникальных зверей зоопарка в алфавитном порядке?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1673,774,'<strong>TreeSet</strong>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (775,8,2,'Какой класс выбрать, чтобы просматривать животных по уникальному идентификатору?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1674,775,'<strong>HashMap</strong>. Самый быстрый Map, с учетом отсутствия доп. требований.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (776,8,2,'Дайте описание интерфейса <strong>Comparable</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1675,776,'package java.lang;<br /><br />public interface Comparable&lt;T&gt; {<br />&nbsp;&nbsp;&nbsp; public int compareTo(T o);<br />}<br /><br />Метод <strong>compareTo</strong> должен возвращать отрицательное число, если текущий объект меньше аргумента; 0, если текущий объект равен аргументу; положительное число, если текущий объект больше аргумента.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (777,8,2,'Напишите метод compareTo, который определяет сравнение по полю <em>id</em> типа <strong>int</strong>.<br />');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1676,777,'public int compareTo(SomeObject a) {<br />&nbsp;&nbsp;&nbsp; return id &ndash; a.id;<br />}',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (778,8,0,'Метод <strong>compareTo</strong>() описывает "естественное упорядочивание" (<em>natural ordering</em>) объектов класса. Он обязательно должен быть консистентен с <strong>equals</strong>(), т.е. <strong>x.equals(y) == true</strong> если и только если <strong>x.compareTo(y) == 0</strong>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (779,8,2,'Опишите интерфейс <strong>Comparator</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1677,779,'package java.util;<br /><a><br />public interface Comparator&lt;T&gt; {<br />&nbsp;&nbsp;&nbsp; public int compare(T o1, To2);<br />}<br /><br /></a>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (780,8,0,'Методы <strong>Arrays</strong>.<strong>sort</strong> и <strong>Collections</strong>.<strong>sort</strong> имеют перезагрузки для работы с компаратором:<br />Arrays.sort(T[] a, Comparator&lt;? super T&gt; c)<br />Collections.sort(List&lt;T&gt; list, Comparator&lt;? super T&gt; c)<br /><br />Кстати, запуск обоих методов без компараторов <span style="text-decoration: underline;">не скомпилируется</span>, если коллекции/массивы - не <strong>Comparable</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (781,8,2,'Перепишите компаратор<br /><br />Comparator&lt;Duck&gt; byWeight = new Comparator&lt;Duck&gt;() {<br />&nbsp;&nbsp;&nbsp; public int compare(Duck d1, Duck d2) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return d1.getWeight()&mdash;d2.getWeight();<br />&nbsp;&nbsp;&nbsp; }<br />};<br /><br />в виде лямбда-выражения');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1678,781,'Comparator&lt;Duck&gt; byWeight = (d1, d2) -&gt; d1.getWeight() - d2.getWeight();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (782,8,0,'<strong>Comparable</strong> формально является функциональным интерфейсом, но задавать его в виде лямбды глупо, так как <strong>Comparable</strong> интересно реализовывать именно для конкретных классов, а сам по себе "чистый" объект <strong>Comparable</strong> не имеет никакой ценности.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (783,0,0,'Если какой-нибудь важный метод (например, конструктор) принимает аргумент, который не должен быть <strong>null</strong>, то уместно будет в случае подачи null выбрасывать исключение <strong>IllegalArgumentException</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (784,8,0,'Удобный способ писать компараторы с использованием функциональных приемов:<br /><br />public class ChainingComparator implements Comparator&lt;Squirrel&gt; {<br />&nbsp;&nbsp;&nbsp; public int compare(Squirrel s1, Squirrel s2) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comparator&lt;Squirrel&gt; c = Comparator.comparing(s -&gt; s.getSpecies());<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c = c.thenComparingInt(s -&gt; s.getWeight());<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return c.compare(s1, s2);<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br /><strong>comparing</strong> - статичный метод интерфейса <strong>Comparator</strong>. Он принимает лямбду, которая вычисляет некоторое значение для объекта, и возвращает компаратор по этому значению.<br /><br /><strong>thenComparingInt</strong> - дефолтный метод интерфейса <strong>Comparator</strong>. Позволяет продолжить сравнение по другому значение, если по основному значению компаратора вернулся 0.<br /><br />Оба метода используют функциональные интерфейсы: <strong>Function</strong>&lt;T,R&gt; и <strong>ToIntFunction</strong>&lt;T&gt;. Первая возвращает результат типа R, а вторая - типа <strong>int</strong>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (785,8,0,'Если в вызове дженерик-метода нет аргументов дженерик-аргументов, то подстановка дженерика осуществляется по типу возвращаемого значение, т.е. в дело вступает тип ссылки, которой присваивается/в которую передается вызов метода:<br />&nbsp;&nbsp;&nbsp; public static &lt;T&gt; Comparator&lt;T&gt; reverseOrder() {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (Comparator&lt;T&gt;) ReverseComparator.REVERSE_ORDER;<br />&nbsp;&nbsp;&nbsp; }<br />...<br />Comparator&lt;String&gt; c = Comparator.reverseOrder();');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (786,8,0,'В программировании дженерик-методов кастинг формальных типов параметров возможен, в отличие от кастинга конкретных типов:<br /><br />List&lt;T&gt; list =&nbsp; (List&lt;T&gt;)&nbsp; new ArrayList&lt;Map&gt;(); //скомпилируется в дженерик-методе<br /><br />List&lt;String&gt; list =&nbsp; (List&lt;String&gt;)&nbsp; new ArrayList&lt;Map&gt;(); // не скомпилируется, будет ошибка несовместимых типов');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (787,8,0,'Статичный метод <strong>Comparator</strong>.<strong>reverseOrder</strong>() на самом деле вызывает <strong>Collections</strong>.<strong>reverseOrder</strong>()');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (788,8,2,'В чем ошибка двоичного поиска в нижеследующем коде?<br /><br />List&lt;String&gt; names = Arrays.asList("Fluffy", "Hoppy");<br />Comparator&lt;String&gt; c = Comparator.reverseOrder();<br />int index = Collections.binarySearch(names, "Hoppy", c);<br />System.out.println(index);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1679,788,'В том, что список не отсортирован по своему компаратору перед подачей в <strong>binarySearch</strong>.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (789,8,0,'<strong>TreeMap</strong> и <strong>TreeSet</strong> можно создать с компаратором:<br /><br />TreeSet(Comparator&lt;? super E&gt; comparator)<br /><br />TreeMap(Comparator&lt;? super K&gt; comparator)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (790,8,0,'Метод-ссылка (<em>method reference</em>) - это возможность вернуть объект функционального интерфейса не через лямбду, а напрямую из метода, который использовался бы в лямбде.<br /><br />public class DuckHelper {<br />&nbsp;&nbsp;&nbsp; public static int compareByWeight(Duck d1, Duck d2) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return d1.getWeight()&mdash;d2.getWeight();<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br />Создаем компаратор лямбдой: <br />Comparator&lt;Duck&gt; byWeight = (d1, d2) -&gt; DuckHelper.compareByWeight(d1, d2);<br /><br />Создаем компаратор ссылкой-методом:<br />Comparator&lt;Duck&gt; byWeight = DuckHelper::compareByWeight;<br />');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (791,8,2,'Назовите 4 формата методов-ссылок:');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1680,791,'1) статичные методы<br />2) методы экземпляра на конкретном экземпляре<br />3) методы экземпляра на экземпляре, определяемом в runtime<br />4) конструкторы',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (792,8,0,'Некоторые типы функциональных интерфейсов:<br /><br />- <strong>Predicate</strong>: принимает один параметр любого типа и возвращает <strong>boolean</strong><br />- <strong>Consumer</strong>: принимает один параметр любого типа и ничего не возвращает<br />- <strong>Supplier</strong>: ничего не принимает и возвращает любой тип');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (793,8,0,'Когда используются лямбды, в рантайме создается внутренний класс , имплементирующий нужный интерфейс.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (794,8,2,'Создайте лямбду и метод-ссылку как объекты подходящего функционального интерфейса, использующие метод <strong>Collections</strong>.<strong>sort</strong>(<em>list</em>) для сортировки списка строк.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1681,794,'Consumer&lt;List&lt;Integer&gt;&gt; methodRef = Collections::sort;<br />Consumer&lt;List&lt;Integer&gt;&gt; lambda = l -&gt; Collections.sort(l);<br /><br />это пример статичного метода-ссылки',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (795,8,2,'<a>Создайте лямбду и метод-ссылку как объекты подходящего функционального интерфейса, использующие метод <strong>String</strong>.<strong>startsWith</strong>(<em>str</em>).</a>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1682,795,'String str = "abc";<br />Predicate&lt;String&gt; lambda = s -&gt; str.startsWith(s);<br />Predicate&lt;String&gt; methodRef = str::startsWith;<br /><br />это пример метода-ссылки экземпляра на известном экземпляре',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (796,8,2,'<a>Создайте лямбду и метод-ссылку как объекты подходящего функционального интерфейса, использующие метод <strong>String</strong>.<strong>isEmpty</strong>().</a>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1683,796,'Predicate&lt;String&gt; lambda3 = s -&gt; s.isEmpty();<br />Predicate&lt;String&gt; methodRef3 = String::isEmpty;<br /><br />это пример метода-ссылки экземпляра на неизвестном экземпляре',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (797,8,2,'<a>Создайте лямбду и метод-ссылку как объекты подходящего функционального интерфейса, возвращающие объект <strong>ArrayList</strong>.</a>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1684,797,'Supplier&lt;ArrayList&gt; lambda = () -&gt; new ArrayList();<br />Supplier&lt;ArrayList&gt; methodRef = ArrayList::new;<br /><br />Это пример ссылки-конструктора (<em>constructor reference</em>)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (798,8,0,'Чтобы удалять элементы из коллекции по условию, теперь есть дефолтный метод интерфейса <strong>Collection</strong>:<br /><br />boolean removeIf(Predicate&lt;? super E&gt; filter)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (799,8,2,'С помощью метода <strong>removeIf</strong> удалите из коллекции строк все элементы, начинающиеся с "A"');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1685,799,'collection.removeIf(s -&gt; s.startsWith("A"));<br /><br />лямбда понимает, что нужен объект&nbsp; <strong>Predicate</strong>&lt;<em>String</em>&gt;, из сигнатуры <strong>removeIf<br /><br /></strong>Заменить лямбду на метод-ссылку не выйдет, т.к. участвует аргумент "А", который не удастся передать в метод: вызов по конкретному экземпляру невозможен, т.к. его нет, а вызов по неизвестному экземпляру позволяет только вызвать безаргументный метод на самом экземпляре.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (800,8,0,'В Java 8 в интерфейсе List появился новый дефолтный метод, позволяющий заменить все элементы в списке:<br /><br />void replaceAll(UnaryOperator&lt;E&gt; operator)<br /><br /><strong>UnaryOperator</strong> принимает на вход объект и возвращает объект такого же типа.<br /><br />Пример:<br /><br />List&lt;Integer&gt; list = Arrays.asList(1, 2, 3);<br />list.replaceAll(x -&gt; x*2);<br />System.out.println(list); // [2, 4, 6]');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (801,8,0,'В Java 8 в интерфейсе <strong>Comparable</strong> появился новый дефолтный метод <strong>forEach</strong>, принимающий лямбду:<br /><br />void forEach(Consumer&lt;? super T&gt; action)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (802,8,2,'Распечатайте все элементы списка, используя новый метод <strong>Comparable</strong>.<strong>forEach</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1686,802,'list.forEach(c -&gt; System.out.println(c))<br /><br />или<br /><br />list.forEach(System.out::println)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (803,8,0,'В Java 8 появились новые методы для Map:<br /><br />1. <em>default</em> <em>V</em> <strong>computeIfAbsent</strong>(<strong>K</strong> <em>key</em>, <strong>Function</strong>&lt;? super <em>K</em>,? extends <em>V</em>&gt; mappingFunction)<br /><br />Если такого ключа нет, рассчитывает значение, кладет его в Map и возвращает. Если в результате расчета получается null или исключение, то в Map не кладется.<br /><br />Пример:<br />Map&lt;Integer,Collection&lt;String&gt;&gt; map = new HashMap&lt;&gt;();<br />map.computeIfAbsent(key, k -&gt; new HashSet&lt;String&gt;()).add(v);<br /><br />2. <em>default</em> <em>V</em> <strong>computeIfPresent</strong>(<strong>K</strong> <em>key</em>, <strong>BiFunction</strong>&lt;? super <em>K</em>,? super <em>V</em>,? extends <em>V</em>&gt; <em>remappingFunction</em>)<br /><br />Если маппинг есть и не null, то рассчитывается новый маппинг на основании имеющихся ключа и значения. Если функция возвращает null, то маппинг удаляется. Если функция выдает исключение, то оно отсылается выше, а прежний маппинг остается.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (804,8,0,'Новый дефолтный метод в интерфейсе Map:<br /><br /><em>V</em> <strong>putIfAbsent</strong>(<strong>K</strong> <em>key</em>, <strong>V</strong> <em>value</em>)<br /><br />Если ключа нет или значение null, то положит новое и вернет null, иначе вернет текущее.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (805,8,0,'В Java 8 появился новый дефолтный метод в интерфейсе <strong>Map</strong>:<br /><br /><em>V</em> <strong>merge</strong>(<strong>K </strong><em>key</em>, <strong>V </strong><em>value,</em> <strong>BiFunction</strong>&lt;? super <em>V</em>,? super <em>V</em>,? extends <em>V</em>&gt; <em>remappingFunction</em>)<br /><br />Если такого ключа нет, или значение равно null, то кладет и вовзращает значение. Если значение есть, то вычисляет результат функции по имеющемуся и новому значению. Если функция возвращает null, то маппинг удаляется. Если исключение, то оно пересылается выше, а прежний маппинг сохраняется.<br /><br />Пример:<br /><br />Map&lt;String, String&gt; map = new HashMap&lt;&gt;();<br />map.put("key", "value");<br />map.merge("key", "value2", String::concat);<br /><br />//{key=valuevalue2}');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (806,8,1,'Suppose that you have a collection of products for sale in a database and you need to display those products. The products are not unique. Which of the following collections classes in the java.util package best suit your needs for this scenario?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1687,806,'Arrays',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1688,806,'ArrayList',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1689,806,'HashMap',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1690,806,'HashSet',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1691,806,'LinkedList',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (807,8,1,'Suppose that you need to work with a collection of elements that need to be sorted in their natural order, and each element has a unique string associated with its value. Which of the following collections classes in the java.util package best suit your needs for this scenario?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1696,807,'TreeSet',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1697,807,'Vector',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1692,807,'ArrayList',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1693,807,'HashMap',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1694,807,'HashSet',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1695,807,'TreeMap',true,'не очень понятно, почему. Ведь отсортируются только ключи, не значения, а HashMap быстрее');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (808,8,1,'What is the result of the following statements?<br /><br />3: List list = new ArrayList();<br />4: list.add("one");<br />5: list.add("two");<br />6: list.add(7);<br />7: for (String s: list)<br />8: System.out.print(s);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1698,808,'onetwo',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1699,808,'onetwo7',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1700,808,'onetwo followed by an exception',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1701,808,'Compiler error on line 6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1702,808,'Compiler error on line 7',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (809,8,1,'What is the result of the following statements?<br /><br />3: ArrayDeque&lt;String&gt; greetings = new ArrayDeque&lt;String&gt;();<br />4: greetings.push("hello");<br />5: greetings.push("hi");<br />6: greetings.push("ola");<br />7: greetings.pop();<br />8: greetings.peek();<br />9: while (greetings.peek() != null)<br />10: System.out.print(greetings.pop());');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1703,809,'hello',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1704,809,'hellohi',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1705,809,'hellohiola',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1706,809,'hi',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1707,809,'hihello',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1708,809,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1709,809,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (810,8,0,'Не следует пробегать ArrayDeque и вообще очередь с помощью итератора, так как порядок внутреннего хранения элементов в итераторе может отличаться от порядка очереди, т.к. не является частью контракта очереди.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (811,8,1,'Which of these statements compile? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1712,811,'List&lt;String&gt; list = new Vector&lt;String&gt;();',true,'Vector реализует List');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1713,811,'List&lt;Object&gt; values = new HashSet&lt;Object&gt;();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1714,811,'List&lt;Object&gt; objects = new ArrayList&lt;? extends Object&gt;();',false,'Нельзя инстанциировать коллекцию с upper bounds.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1715,811,'Map&lt;String, ? extends Number&gt; hm = new HashMap&lt;String, Integer&gt;();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1710,811,'HashSet&lt;Number&gt; hs = new HashSet&lt;Integer&gt;();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1711,811,'HashSet&lt;? super ClassCastException&gt; set = new HashSet&lt;Exception&gt;();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (812,8,1,'What is the result of the following code?<br /><br />1: public class Hello&lt;T&gt; {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; T t;<br />3:&nbsp;&nbsp;&nbsp;&nbsp; public Hello(T t) { this.t = t; }<br />4:&nbsp;&nbsp;&nbsp;&nbsp; public String toString() { return t.toString(); }<br />5:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(new Hello&lt;String&gt;("hi"));<br />7:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(new Hello("there"));<br />8: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1716,812,'hi',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1717,812,'hi followed by a runtime exception',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1718,812,'hithere',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1719,812,'Compiler error on line 4',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1720,812,'Compiler error on line 6',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1721,812,'Compiler error on line 7',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (813,8,0,'Использование raw types опасно еще и потому, что компилятор позволяет присваивать их дженерик-ссылкам (а дженерик-ссылки - raw-типам), что может привести к порче коллекций и к ошибкам ClassCastException.<br /><br />List list = new ArrayList&lt;Integer&gt;();<br />List&lt;String&gt; list2 = list;<br /><br />все это скомпилируется.<br /><br />Кстати, Object obj = 7; скомпилируется - сработает автобоксинг.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (814,8,1,'Which of the following statements are true? (Select two.)<br /><br />3: Set&lt;Number&gt; numbers = new HashSet&lt;&gt;();<br />4: numbers.add(new Integer(86));<br />5: numbers.add(75);<br />6: numbers.add(new Integer(86));<br />7: numbers.add(null);<br />8: numbers.add(309L);<br />9: Iterator iter = numbers.iterator();<br />10: while (iter.hasNext())<br />11:&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(iter.next());');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1728,814,'An exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1722,814,'The code compiles successfully.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1723,814,'The output is 8675null309.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1724,814,'The output is 867586null309.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1725,814,'The output is indeterminate.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1726,814,'There is a compiler error on line 3.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1727,814,'There is a compiler error on line 9.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (815,8,1,'What is the result of the following code?<br /><br />TreeSet&lt;String&gt; tree = new TreeSet&lt;String&gt;();<br />tree.add("one");<br />tree.add("One");<br />tree.add("ONE");<br />System.out.println(tree.ceiling("On"));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1729,815,'On',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1730,815,'one',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1731,815,'One',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1732,815,'ONE',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1733,815,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1734,815,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (816,8,1,'Which of the answer choices are valid given the following declaration?<br /><br />Map&lt;String, Double&gt; map = new HashMap&lt;&gt;();');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1735,816,'map.add("pi", 3.14159);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1736,816,'map.add("e", 2L);',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1737,816,'map.add("log(1)", new Double(0.0));',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1738,816,'map.add(''x'', new Double(123.4));',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1739,816,'None of the above',true,'нет у мапы метода add!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (817,0,0,'double dbl = 5L возможно, а Double dblWrapper = 5L - невозможно! Нельзя обертке присвоить примитив или объект другой обертки');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (818,8,1,'import java.util.*;<br />public class MyComparator implements Comparator&lt;String&gt; {<br />&nbsp;&nbsp;&nbsp; public int compare(String a, String b) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return b.toLowerCase().compareTo(a.toLowerCase());<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String[] values = { "123", "Abb", "aab" };<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Arrays.sort(values, new MyComparator());<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (String s: values)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.print(s + " ");<br />&nbsp;&nbsp;&nbsp; }<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1744,818,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1745,818,'A runtime exception is thrown.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1740,818,'Abb aab 123',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1741,818,'aab Abb 123',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1742,818,'123 Abb aab',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1743,818,'123 aab Abb',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (819,8,1,'What is the result of the following code?<br /><br />3: Map&lt;Integer, Integer&gt; map = new HashMap&lt;&gt;(10);<br />4: for (int i = 1; i &lt;= 10; i++) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp; map.put(i, i * i);<br />6: }<br />7: System.out.println(map.get(4));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1746,819,'16',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1747,819,'25',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1748,819,'Compiler error on line 3.',false,'Есть такой конструктор. Целочисленный аргумент конмтруктора HashMap задает начальную емкость (по умолчанию - 16).');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1749,819,'Compiler error on line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1750,819,'Compiler error on line 7.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1751,819,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (820,8,1,'Which of these statements can fill in the blank so that the Helper class compiles successfully? (Choose all that apply.)<br /><br />3: public class Helper {<br />4:&nbsp;&nbsp;&nbsp;&nbsp; public static &lt;U extends Exception&gt; void printException(U u) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(u.getMessage());<br />6:&nbsp;&nbsp;&nbsp;&nbsp; }<br />7:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __________________________________<br />9: } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1752,820,'Helper.printException(new FileNotFoundException("A"));',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1753,820,'Helper.printException(new Exception("B"));',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1754,820,'Helper.&lt;Throwable&gt;printException(new Exception("C"));',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1755,820,'Helper.&lt;NullPointerException&gt;printException(new NullPointerException("D"));',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1756,820,'Helper.printException(new Throwable("E"));',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (821,0,0,'Если умножить int на int так, что результат получится больше диапазона int, то будет автоматический кастинг к int (с потерей).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (822,8,1,'Which of these statements can fill in the blank so that the Wildcard class compiles successfully? (Choose all that apply.)<br /><br />import java.util.*;<br />public class Wildcard {<br />&nbsp;&nbsp;&nbsp; public void showSize(List&lt;?&gt; list) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(list.size());<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Wildcard card = new Wildcard();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ____________________________________<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; card.showSize(list);<br />&nbsp;&nbsp;&nbsp; } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1760,822,'List&lt;Exception&gt; list = new LinkedList&lt;java.io.IOException&gt;();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1761,822,'Vector&lt;? extends Number&gt; list = new Vector&lt;Integer&gt;();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1762,822,'None of the above',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1757,822,'ArrayDeque&lt;?&gt; list = new ArrayDeque&lt;String&gt;();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1758,822,'ArrayList&lt;? super Date&gt; list = new ArrayList&lt;Date&gt;();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1759,822,'List&lt;?&gt; list = new ArrayList&lt;?&gt;();',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (823,8,1,'What is the result of the following program?<br /><br />import java.util.*;<br />public class Sorted implements Comparable&lt;Sorted&gt;, Comparator&lt;Sorted&gt; {<br />&nbsp;&nbsp;&nbsp; private int num;<br />&nbsp;&nbsp;&nbsp; private String text;<br />&nbsp;&nbsp;&nbsp; Sorted(int n, String t) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.num = n;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; this.text = t;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; public String toString() { return "" + num; }<br />&nbsp;&nbsp;&nbsp; public int compareTo(Sorted s) { return text.compareTo(s.text); }<br />&nbsp;&nbsp;&nbsp; public int compare(Sorted s1, Sorted s2) { return s1.num &ndash; s2.num; }<br />&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorted s1 = new Sorted(88, "a");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sorted s2 = new Sorted(55, "b");<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TreeSet&lt;Sorted&gt; t1 = new TreeSet&lt;&gt;();<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t1.add(s1); t1.add(s2);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TreeSet&lt;Sorted&gt; t2 = new TreeSet&lt;&gt;(s1);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t2.add(s1); t2.add(s2);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(t1 + " " + t2);<br />&nbsp;&nbsp;&nbsp; } }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1763,823,'[55, 88] [55, 88]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1764,823,'[55, 88] [88, 55]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1765,823,'[88, 55] [55, 88]',true,'t2 сортируется с компаратором по num');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1766,823,'[88, 55] [88, 55]',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1767,823,'The code does not compile.',false,'У TreeSet есть конструктор с компаратором, так что все скомпилируется');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1768,823,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (824,8,1,'What is the result of the following code?<br /><br />Comparator&lt;Integer&gt; c = (o1, o2) -&gt; o2-o1;<br />List&lt;Integer&gt; list = Arrays.asList(5, 4, 7, 1);<br />Collections.sort(list, c);<br />System.out.println(Collections.binarySearch(list, 1));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1769,824,'0',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1770,824,'1',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1771,824,'2',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1772,824,'The result is undefined.',true,'В binarySearch не подается компаратор, по которому отсортирован список');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1773,824,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1774,824,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (825,8,1,'Which of the following statements are true? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1776,825,'Comparator is in the java.util package.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1777,825,'compare() is in the Comparable interface.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1778,825,'compare() is in the Comparator interface.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1779,825,'compare() takes one method parameter.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1780,825,'compare() takes two method parameters.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1775,825,'Comparable is in the java.util package.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (826,8,1,'Which two options can fill in the blanks to make this code compile? (Choose all that apply.)<br /><br />1: public class Generic________ {<br />2:&nbsp;&nbsp;&nbsp;&nbsp; public static void main(String[] args) {<br />3:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Generic&lt;String&gt; g = new Generic_______();<br />4:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Generic&lt;Object&gt; g2 = new Generic();<br />5:&nbsp;&nbsp;&nbsp;&nbsp; }<br />6: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1781,826,'On line 1, fill in with &lt;&gt;.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1782,826,'On line 1, fill in with &lt;T&gt;.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1783,826,'On line 1, fill in with &lt;?&gt;.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1784,826,'On line 3, fill in with &lt;&gt;.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1785,826,'On line 3, fill in with &lt;T&gt;.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1786,826,'On line 3, fill in with &lt;?&gt;.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (827,8,1,'Which of the following lines can be inserted to make the code compile? (Choose all that apply.)<br /><br />class A {}<br />class B extends A {}<br />class C extends B {}<br />class D&lt;C&gt; {<br />&nbsp;&nbsp;&nbsp; // INSERT CODE HERE<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1792,827,'C c1 = new C();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1787,827,'A a1 = new A();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1788,827,'A a2 = new B();',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1789,827,'A a3 = new C();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1790,827,'C c1 = new A();',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1791,827,'C c2 = new B();',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (828,8,1,'Which options are true of the following code? (Choose all that apply.)<br /><br />3: ______________&lt;Integer&gt; q = new LinkedList&lt;&gt;();<br />4: q.add(10);<br />5: q.add(12);<br />6: q.remove(1);<br />7: System.out.print(q);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1793,828,'If we fill in the blank with List, the output is [10].',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1794,828,'If we fill in the blank with List, the output is [10, 12].',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1795,828,'If we fill in the blank with Queue, the output is [10].',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1796,828,'If we fill in the blank with Queue, the output is [10, 12].',true,'В Queue есть метод <strong>add</strong>, переопределенный из Collection. Он добавляет элемент в очередь и отличается от <strong>offer</strong> тем, что выдает IllegalStateException, если в очередь нельзя ничего положить (ограничение по объему) <br /><br />А вот метода&nbsp; remove(int) нет, есть только remove(Object), унаследованный из Collection');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1797,828,'The code does not compile in either scenario.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1798,828,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (829,8,1,'What is the result of the following code?<br /><br />4: Map m = new HashMap();<br />5: m.put(123, "456");<br />6: m.put("abc", "def");<br />7: System.out.println(m.contains("123"));');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1799,829,'false',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1800,829,'true',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1801,829,'Compiler error on line 4.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1802,829,'Compiler error on line 5.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1803,829,'Compiler error on line 7.',true,'Map не содержит метода contains');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1804,829,'A runtime exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (830,8,1,'Fill in the blanks to make this code compile and print 123. (Choose all that apply.)<br /><br />4: List&lt;String&gt; list = Arrays.asList("1", "2", "3");<br />5: Iterator iter = list.iterator();<br />6: while(iter.__________())<br />7: System.out.print(iter._________());');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1808,830,'On line 7, fill in the blank with getNext.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1809,830,'On line 7, fill in the blank with hasNext.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1810,830,'On line 7, fill in the blank with next.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1805,830,'On line 6, fill in the blank with hasNext.',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1806,830,'On line 6, fill in the blank with isNext.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1807,830,'On line 6, fill in the blank with next.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (831,8,1,'What code change is needed to make the method compile?<br /><br />public static T identity(T t) {<br />&nbsp;&nbsp;&nbsp; return t;<br />}');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1811,831,'Add &lt;T&gt; after the public keyword.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1812,831,'Add &lt;T&gt; after the static keyword.',true,'В статичных дженерик-методах формальный тип параметра указывается перед типом возвращаемого значения');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1813,831,'Add &lt;T&gt; after T.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1814,831,'Add &lt;?&gt; after the public keyword.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1815,831,'Add &lt;?&gt; after the static keyword.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1816,831,'No change required. The code already compiles.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (832,8,0,'Если формальный тип параметра в угловых скобках указан в методе, он должен идти строго перед типом возвращаемого значения.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (833,8,1,'Which of the answer choices make sense to implement with a lambda? (Choose all that apply.)');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1817,833,'Comparable interface',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1818,833,'Comparator interface',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1819,833,'remove method on a Collection',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1820,833,'removeAll method on a Collection',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1821,833,'removeIf method on a Collection',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (834,8,1,'Which of the following compiles and print out the entire set? (Choose all that apply.)<br /><br />Set&lt;String&gt; s = new HashSet&lt;&gt;();<br />s.add("lion");<br />s.add("tiger");<br />s.add("bear");<br />s.forEach( );');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1824,834,'(s) -&gt; System.out.println(s)',false,'s уже определено как локальная переменная выше!');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1825,834,'System.out.println(s)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1826,834,'System::out::println',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1827,834,'System.out::println',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1822,834,'() -&gt; System.out.println(s)',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1823,834,'s -&gt; System.out.println(s)',false,'s уже определено как локальная переменная выше!');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (835,8,1,'What is the result of the following?<br /><br />Map&lt;Integer, Integer&gt; map = new HashMap&lt;&gt;();<br />map.put(1, 10);<br />map.put(2, 20);<br />map.put(3, null);<br />map.merge(1, 3, (a,b) -&gt; a + b);<br />map.merge(3, 3, (a,b) -&gt; a + b);<br />System.out.println(map);');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1828,835,'{1=10, 2=20}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1829,835,'{1=10, 2=20, 3=null}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1830,835,'{1=10, 2=20, 3=3}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1831,835,'{1=13, 2=20}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1832,835,'{1=13, 2=20, 3=null}',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1833,835,'{1=13, 2=20, 3=3}',true,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1834,835,'The code does not compile.',false,'');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1835,835,'An exception is thrown.',false,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (836,8,0,'Лямбды имеют такой же доступ в локальным переменным, как и внутренние классы - эти переменные должны быть <em>effectively final</em>.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (837,8,2,'К каким переменным имеют доступ лямбда-выражения?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1836,837,'1) статичные переменные<br />2) переменные экземпляра<br />3) "эффективно финальные" параметры метода<br />4) "эффективно финальные" локальные переменные',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (838,8,2,'Перечислите встречающиеся в нижеприведенном коде переменные, которые можно использовать в лямбда-выражениях в методе <strong>everyonePlay</strong>.<br /><br />1: interface Gorilla { String move(); }<br />2: class GorillaFamily {<br />3:&nbsp;&nbsp;&nbsp;&nbsp; String walk = "walk";<br />4:&nbsp;&nbsp;&nbsp;&nbsp; void everyonePlay(boolean baby) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String approach = "amble", approach2 = "tra";<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; approach2 = "run";<br />7:<br />8:&nbsp;&nbsp;&nbsp; }<br />9:&nbsp;&nbsp;&nbsp; void play(Gorilla g) {<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(g.move());<br />11:&nbsp;&nbsp; }<br />12: }');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1837,838,'<em>walk</em> - как переменная экземпляра<br /><em>baby</em> - как "эффективно финальный" параметр метода<br /><em>approach</em> - как "эффективно финальная" локальная переменная<br /><br /><em>approach2</em> не подойдет, она не "эффективно финальная", так как переприсваивается.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (839,8,2,'<a>Проведите примеры лямбда-выражений, которые можно составить в методе everyonePlay c использованием интерфейса <strong>Gorilla</strong>.<br /><br />1: interface Gorilla { String move(); }<br />2: class GorillaFamily {<br />3:&nbsp;&nbsp;&nbsp;&nbsp; String walk = "walk";<br />4:&nbsp;&nbsp;&nbsp;&nbsp; void everyonePlay(boolean baby) {<br />5:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String approach = "amble", approach2 = "tra";<br />6:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; approach2 = "run";<br />7:<br />8:&nbsp;&nbsp;&nbsp; }<br />9:&nbsp;&nbsp;&nbsp; void play(Gorilla g) {<br />10:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; System.out.println(g.move());<br />11:&nbsp;&nbsp; }<br />12: } </a>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1838,839,'play(() -&gt; walk);<br />play(() -&gt; baby ? "hitch a ride": "run");<br />play(() -&gt; approach);',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (840,8,2,'Перечислите основные функциональные интерфейсы с указанием параметров, возвращаемых типов и наименования абстрактных методов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1839,840,'1. <strong>Supplier</strong>&lt;<em>T</em>&gt;: 0 параметров, возвращает <em>T</em>, метод <strong>get<br /></strong>2. <strong>Consumer</strong>&lt;<em>T</em>&gt;: 1 параметр(T), ничего не возвращает, метод <strong>accept</strong><br />3. <strong>BiConsumer</strong>&lt;<em>T</em>, <em>U</em>&gt;: 2 параметра (T,U), ничего не возвращает, метод <strong>accept<br /></strong>4. <strong>Predicate</strong>&lt;<em>T</em>&gt;: 1 параметр(T), возвращает <em>boolean</em>, метод <strong>test</strong><br />5. <strong>BiPredicate</strong>&lt;<em>T</em>, <em>U</em>&gt;: 2 параметра(T,U), возвращает <em>boolean</em>, метод <em>test</em><br />6. <strong>Function</strong>&lt;<em>T</em>, <em>R</em>&gt;: 1 параметр(T), возвращает <em>R</em>, метод <strong>apply</strong><br />7. <strong>BiFunction</strong>&lt;<em>T</em>, <em>U</em>, <em>R</em>&gt;: 2 параметра(T,U), возвращает <em>R</em>, метод <strong>apply</strong><br />8. <strong>UnaryOperator</strong>&lt;<em>T</em>&gt;: 1 параметр(T), возвращает <em>T</em>, метод <strong>apply</strong><br />9. <strong>BinaryOperator</strong>&lt;<em>T</em>,<em>T</em>&gt;: 2 параметра(T,T), возвращает <em>T</em>, метод <strong>apply</strong>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (841,8,0,'Функциональные интерфейсы лежат в пакете java.util.function');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (842,8,2,'Приведите код интерфейса Supplier, смысл его применения.<br /><br />Приведите примеры, использующие метод <strong>LocalDate</strong>.<strong>now</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1840,842,'@FunctionalInterface public class Supplier&lt;T&gt; {<br />&nbsp;&nbsp;&nbsp; public T get();<br />}<br /><br />используется тогда, когда нужно сгенерировать объект определенного типа без каких-либо входных параметров.<br /><br />Примеры:<br />Supplier&lt;LocalDate&gt; s1 = LocalDate::now;<br />Supplier&lt;LocalDate&gt; s2 = () -&gt; LocalDate.now();<br /><br />LocalDate d1 = s1.get();<br />LocalDate d2 = s2.get();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (843,8,2,'Напишите лямбду, которая поставляет объекты <strong>StringBuilder</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1841,843,'Supplier&lt;StringBuilder&gt; s1 = StringBuilder::new;<br />Supplier&lt;StringBuilder&gt; s2 = () -&gt; new StringBuilder();',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (844,8,0,'Классы, реализующие лямбды, существуют только в памяти. Доказательство - подстрока $$ в toString() лямбды.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (845,8,2,'Приведите код интерфейсов <strong>Consumer</strong> и <strong>BiConsumer</strong> и объясните смысл их использования. Приведите примеры лямбд на основе метода <strong>System.out.println</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1842,845,'@FunctionalInterface public class Consumer&lt;T&gt; {<br />&nbsp;&nbsp;&nbsp; void accept(T t);<br />}<br />@FunctionalInterface public class BiConsumer&lt;T, U&gt; {<br />&nbsp;&nbsp;&nbsp; void accept(T t, U u);<br />}<br /><br />используются тогда, когда нужно что-то сделать с параметрами, но ничего не надо возвращать.<br /><br />Примеры:<br />Consumer&lt;String&gt; c1 = System.out::println;<br />Consumer&lt;String&gt; c2 = x -&gt; System.out.println(x);<br /><br />c1.accept("Annie");<br />c2.accept("Annie");',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (846,8,2,'Напишите лямбды, которые кладут значение в <strong>Map</strong>.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1843,846,'Map&lt;String, Integer&gt; map = new HashMap&lt;&gt;();<br />BiConsumer&lt;String, Integer&gt; b1 = map::put;<br />BiConsumer&lt;String, Integer&gt; b2 = (k, v) -&gt; map.put(k, v);',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (847,8,0,'В описании класса нельзя дважды указывать один и тот же формальный тип параметра:<br /><br />class Test&lt;T,T&gt; {} // doesn''t compile<br /><br />Однако один и тот же формальный тип параметра можно указывать, когда производится наследование:<br /><br />
<div>public class Test1&lt;T,U&gt; {</div>
<div>&nbsp; &nbsp; T calc(U u) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return (T)u;</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>
<div>&nbsp;</div>
<div>class Test1Child&lt;T&gt; extends Test1&lt;T,T&gt; {}<br /><br />В этом конкретном случае унаследованный метод calc будет принимать и возвращать T</div>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (848,8,2,'Приведите код интерфейсов <strong>Predicate</strong> и <strong>BiPredicate</strong>, смысл их использования. Приведите примеры лямбд, использующих метод <strong>String</strong>.<strong>isEmpty</strong>() и <strong>String</strong>.<strong>startsWith</strong>()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1844,848,'<div>@FunctionalInterface public class Predicate&lt;T&gt; {</div>
<div>&nbsp; &nbsp; boolean test(T t);</div>
<div>}<br /><br /></div>
<div>@FunctionalInterface public class BiPredicate&lt;T, U&gt; {</div>
<div>&nbsp; &nbsp; boolean test(T t, U u);</div>
<div>}<br /><br />Используется, когда надо вернуть булево значение от одного/двух параметров.<br /><br />Примеры:<br />
<div>Predicate&lt;String&gt; p1 = String::isEmpty;</div>
<div>Predicate&lt;String&gt; p2 = x -&gt; x.isEmpty();</div>
<div>&nbsp;</div>
<div>BiPredicate&lt;String, String&gt; b1 = String::startsWith;</div>
<div>BiPredicate&lt;String, String&gt; b2 = (string, prefix) -&gt; string.startsWith(prefix);</div>
</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (849,8,0,'Если в дженерик-классе производится кастинг к дженерику, то реально кастинг состоится только при обращении к методам типа, к которому производится кастинг. Если метод в Object, то кастинга не будет и ошибки ClassCastException не будет.<br /><br />
<div>public class Test1&lt;T,U&gt; {</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; public static void main(String[] arh) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; Test1&lt;Integer, String&gt; t = new Test1&lt;&gt;();</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(t.calc("444")); //выполнится без проблем</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(t.calc("444").floatValue()); //ошибка ClassCastException</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp; &nbsp; T calc(U u) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; return (T)u;</div>
<div>&nbsp; &nbsp; }</div>
<div>}</div>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (850,8,0,'Методы-ссылки занимают меньше кода, но зачастую читаются хуже, чем эксплицитные лямбды.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (851,8,0,'Функциональные интерфейсы должны иметь ровно один абстрактный метод, но при этом они могут иметь статичные и дефолтные методы.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (852,8,0,'Интерфейс предикат содержит удобные дефолтные методы:<br /><br />
<div><em>Predicate&lt;T&gt;</em> <strong>and</strong>(<strong>Predicate</strong>&lt;? super <em>T</em>&gt; <em>other</em>)</div>
<div>Returns a composed predicate that represents a short-circuiting logical AND of this predicate and another.</div>
<div>&nbsp;</div>
<div><em>Predicate&lt;T&gt;</em> <strong>negate</strong>()</div>
<div>Returns a predicate that represents the logical negation of this predicate.</div>
<div>&nbsp;</div>
<div><em>Predicate&lt;T&gt;</em> <strong>or</strong>(<strong>Predicate</strong>&lt;? super <em>T</em>&gt; <em>other</em>)</div>
<div>Returns a composed predicate that represents a short-circuiting logical OR of this predicate and another.</div>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (853,8,2,'Приведите код интерфейсов <strong>Function</strong> и <strong>BiFunction</strong> и объясните смысл их использования.<br />Приведите примеры лямбд с использованием методов <strong>String</strong>.<strong>length</strong>() и <strong>String</strong>.<strong>concat</strong>()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1845,853,'<div>@FunctionalInterface public class Function&lt;T, R&gt; {</div>
<div>&nbsp; &nbsp; R apply(T t);</div>
<div>}</div>
<div>&nbsp;</div>
<div>@FunctionalInterface public class BiFunction&lt;T, U, R&gt; {</div>
<div>&nbsp; &nbsp; R apply(T t, U u);</div>
<div>}<br /><br />Смысл - преобразование одного или двух аргументов потенциально разных типов в объект потенциально иного типа.<br /><br />Примеры:<br /><br />
<div>Function&lt;String, Integer&gt; f1 = String::length;</div>
<div>Function&lt;String, Integer&gt; f2 = x -&gt; x.length();</div>
<div>&nbsp;</div>
<div>BiFunction&lt;String, String, String&gt; b1 = String::concat;</div>
<div>BiFunction&lt;String, String, String&gt; b2 = (string, toAdd) -&gt; string.concat(toAdd);</div>
</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (854,8,2,'Напишите функциональный интерфейс, возвращающий функцию от трех различных аргументов.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1846,854,'<div>interface TriFunction&lt;T,U,V,R&gt; {</div>
<div>&nbsp; &nbsp; R apply(T t, U u, V v);</div>
<div>}</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (855,8,2,'Приведите код интерфейсов <strong>UnaryOperator</strong> и <strong>BinaryOperator</strong> и&nbsp; изложите смысл их использования.<br />Приведите примеры лямбд с использованием методов <strong>String</strong>.<strong>toUpperCase</strong>() и <strong>String</strong>.<strong>concat</strong>()<br />');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1847,855,'<div>@FunctionalInterface public class UnaryOperator&lt;T&gt; extends Function&lt;T, T&gt; { }</div>
<div>&nbsp;</div>
<div>@FunctionalInterface public class BinaryOperator&lt;T&gt; extends BiFunction&lt;T, T, T&gt; { }<br /><br />(унаследованы методы T apply(T t);
<div>T apply(T t1, T t2);)</div>
<br /><br />Преобразуют аргумент или два одинаковых аргумента в объект того же типа.<br /><br />Примеры:<br />
<div>UnaryOperator&lt;String&gt; u1 = String::toUpperCase;</div>
<div>UnaryOperator&lt;String&gt; u2 = x -&gt; x.toUpperCase();</div>
<div>&nbsp;</div>
<div>BinaryOperator&lt;String&gt; b1 = String::concat;</div>
<div>BinaryOperator&lt;String&gt; b2 = (string, toAdd) -&gt; string.concat(toAdd);</div>
</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (856,8,2,'Какой функциональный интерфейс вы использовали бы в следующих ситуациях:<br /><br />1) Вернуть <strong>String</strong> без исходных параметров<br />2) Вернуть <strong>Boolean</strong>, на входе строка<br />3) Вернуть <strong>Integer</strong>, на входе два целых');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1848,856,'1) Supplier&lt;String&gt;<br />2) Function&lt;String, Boolean&gt; (не Predicate, потому что он возвращает примитив, а нужен объект)<br />3) BinaryOperator&lt;Integer&gt;',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (857,8,2,'Вставьте подходящие типа на место прочерков.<br /><br />
<div>1) _____&lt;List&gt; ex1 = x -&gt; "".equals(x.get(0));</div>
<div>2) _____&lt;Long&gt; ex2 = (Long l) -&gt; System.out.println(l);</div>
<div>3) _____ &lt;String, String&gt; ex3 = (s1, s2) -&gt; false;</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1849,857,'1) Predicate<br />2) Consumer<br />3) BiPredicate',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (858,8,2,'Найдите ошибки в следующих строках и опишите способы исправления<br /><br />
<div>1) Function&lt;List&lt;String&gt;&gt; ex1 = x -&gt; x.get(0); // DOES NOT COMPILE</div>
<div>2) UnaryOperator&lt;Long&gt; ex2 = (Long l) -&gt; 3.14; // DOES NOT COMIPLE</div>
<div>3) Predicate ex4 = String::isEmpty; // DOES NOT COMPILE</div>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1850,858,'1) функции нужно два параметра в угловых скобках. Надо добавить String<br />2) неправильный тип возвращаемого значения в лямбде. Нужен кастинг к long, а там сработает автобоксинг в Long.<br />3) нужно параметризовать Predicate с помощью String, поскольку метод isEmpty принимает String, а в Object (ибо у нас raw type) такого метода нет',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (859,8,0,'package <span style="text-decoration: underline;">java.util</span>;<br /><br />class <strong>Optional</strong>&lt;T&gt;<br /><br />Класс-контейнер, который может содержать значение или пустоту.<br /><br />static &lt;T&gt; <em>Optional&lt;T&gt;</em>&nbsp;<strong>empty</strong>() возвращает пустой контейнер.<br /><em><br />Optional&lt;T&gt;&nbsp;</em><strong>of</strong>(<strong>T</strong> <em>value</em>) возвращает контейнер со значением.<br /><em><br />boolean</em> <strong>isPresent</strong>() проверяет, есть ли значение.<br /><em><br />T</em> <strong>get</strong>() возвращает значение (NoSuchElementException, если значения нет)<br /><br />static &lt;T&gt; <em>Optional</em>&lt;<em>T</em>&gt; <strong>ofNullable</strong>(<strong>T</strong> <em>value</em>)&nbsp; возвращает контейнер со значением, либо пустой контейнер, если параметр null<br /><br />
<div><em>void</em> <strong>ifPresent</strong>(<strong>Consumer</strong>&lt;? super <em>T</em>&gt; <em>consumer</em>) запускает потребителя, если контейнер непуст<br /><br /><em>T</em> <strong>orElse</strong>(<strong>T</strong> <em>other</em>) возвращает содержимое либо other, если контейнер пуст</div>
<div><br /><em>T</em> <strong>orElseGet</strong>(<strong>Supplier</strong>&lt;? extends <em>T</em>&gt; <em>other</em>) возвращает содержимое либо результат работы поставщика, если контейнер пуст<br /><br />&lt;<em>X</em> extends <em>Throwable</em>&gt; <em>T</em> <strong>orElseThrow</strong>(<strong>Supplier</strong>&lt;? extends <em>X</em>&gt; <em>exceptionSupplier</em>) - возвращает содержимое либо изготавливает исключение.</div>');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (860,8,2,'Опишите преимущества введения <strong>Optional</strong>');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1851,860,'1) его можно возвращать вместо null - это способ показать, что метод может вернуть или не вернуть требуемое значение.<br /><br />2) Благодаря функциональному программированию с объектами Optional легко работать "одной строкой" - не надо писать сложное ветвление с if-else',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (861,8,2,'Что такое поток(<em>stream</em>) в java? Что такое конвейер обработки потока&nbsp; (<em>stream pipeline)</em>? Какие бывают потоки?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1852,861,'Поток - последовательность данных.<br />Конвейер обработки - совокупность операций, применяемых к потоку для получения результата.<br />Потоки бывают конечные (<em>finite</em>) и бесконечные (<em>infinite</em>).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (862,8,2,'Опишите общую схему конвейера обработки (stream pipeline).');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1853,862,'- Источник данных - исходный поток<br />- Промежуточные операции. Каждая преобразует поток в другой поток<br />- Терминальная операция. Выдает результат (не поток). Поток становится не пригодным к дальнейшим манипуляциям.<br /><br />Внимание! Проемежуточные операции начинают выполняться только тогда, когда приходит запрос на терминальную операцию (lazy evaluation).',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (863,8,0,'Интерфейс <strong>Stream</strong>&lt;<em>T</em>&gt; находится в пакете java.util.stream');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (864,8,2,'Перечислите 3 способа создать конечный поток.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1854,864,'<div>1: Stream&lt;String&gt; empty = Stream.empty();&nbsp;<br /><br /></div>
<div>2: Stream&lt;Integer&gt; singleElement = Stream.of(1);&nbsp;<br /><br /></div>
<div>3: Stream&lt;Integer&gt; fromArray = Stream.of(1, 2, 3);&nbsp;</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (865,8,2,'Как превратить список в поток?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1855,865,'<div>Stream&lt;String&gt; fromList = list.stream();</div>
<div>&nbsp;</div>
<div>это обычный поток</div>
<div>&nbsp;</div>
<div>Stream&lt;String&gt; fromListParallel = list.parallelStream();</div>
<div>&nbsp;</div>
<div>это поток, который может обрабатываться параллельно. Не имеет смысла для маленьких потоков.</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (866,8,2,'Опишите способы получения бесконечного потока.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1856,866,'<div>static &lt;T&gt; Stream&lt;T&gt; generate(Supplier&lt;T&gt; s)</div>
<div>&nbsp;</div>
<div>возвращает бесконечный последовательный неупорядоченный поток, каждый элемент которого генерируется поставщиком.</div>
<div>&nbsp;</div>
<div>static &lt;T&gt; Stream&lt;T&gt; iterate(T seed, UnaryOperator&lt;T&gt; f)</div>
<div>&nbsp;</div>
<div>возвращает бесконечный последовательный упорядоченный поток, каждый элемент которого производится некоторой функцией, прилагаемой к предыдущему значению этой функции, т.е. поток вида seed, f(seed), f(f(seed)), etc.</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (867,8,2,'Создайте следующие потоки:<br /><br />1) бесконечный поток случайных чисел<br />2) бесконечный поток нечетных чисел, начиная с 1');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1857,867,'<div>1) Stream&lt;Double&gt; randoms = Stream.generate(Math::random);</div>
<div>2) Stream&lt;Integer&gt; oddNumbers = Stream.iterate(1, n -&gt; n + 2);</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (868,8,0,'Можно выполнить терминальную операцию с потоком без промежуточных, но наоборот нельзя.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (869,8,2,'Что такое <em>reduction</em>?');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1858,869,'Это терминальная операция, сводящая <span style="text-decoration: underline;">весь</span> поток к единому объекту (например, коллекции) или примитиву. Т.е. для определения редукции важен каждый элемент потока.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (870,8,2,'Перечислите основные терминальные операции с потоками.');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1859,870,'<div>allMatch()</div>
<div>anyMatch()</div>
<div>noneMatch()</div>
<div>&nbsp;</div>
<div>collect()</div>
<div>&nbsp;</div>
<div>count()</div>
<div>&nbsp;</div>
<div>findAny()</div>
<div>findFirst()</div>
<div>&nbsp;</div>
<div>forEach()</div>
<div>&nbsp;</div>
<div>min()</div>
<div>max()</div>
<div>&nbsp;</div>
<div>reduce()</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (871,8,2,'Опишите терминальную операцию <strong>count</strong>()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1860,871,'<em>long</em> <strong>count</strong>()<br /><br />определяет кол-во элементов в конечном потоке. Для бесконечного потока зависает. Это редукция, т.к. возвращает единственный примитив и базируется на всех элементах потока.',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (872,8,2,'Опишите терминальные операции <strong>min</strong>() и <strong>max</strong>()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1861,872,'<div><em>Optional&lt;T&gt;</em> <strong>min</strong>(<strong>Comparator</strong>&lt;? super <em>T</em>&gt; <em>comparator</em>)</div>
<div><em>Optional&lt;T&gt;</em> <strong>max</strong>(<strong>Comparator</strong>&lt;? super <em>T</em>&gt; <em>comparator</em>)<br /><br />Возвращает наибольшее или наименьшее значение в конечном потоке в соответствии с поданым компаратором. На бесконечном потоке зависает. Является редукцией, т.к. возвращает единственный объект <strong>Optional</strong>, определенный на материале всего потока.<br /><br />(чтобы отсортировать по естественному порядку, надо подать компаратор Comparator.naturalOrder())</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (873,8,0,'Есть очень полезные универсальные компараторы:<br /><br /><strong>Comparator</strong>.<strong>naturalOrder</strong>()<br />и<br /><strong>Comparator</strong>.<strong>reverseOrder</strong>(),<br /><br />которые можно подавать в методы, где требуется компаратор.<br /><br />Дженерик-тип этих компараторов возьмется из ссылки или контекста.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (874,8,2,'Опишите операции <strong>findAny</strong>() и <strong>findFirst</strong>()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1862,874,'<div><em>Optional</em>&lt;<em>T</em>&gt; <strong>findAny</strong>()</div>
<div><em>Optional</em>&lt;<em>T</em>&gt; <strong>findFirst</strong>()<br /><br /><strong>findAny</strong>&nbsp;возвращает произвольный элемент потока. Удобен для параллельного потока.&nbsp;<strong>findFirst</strong> возвращает первый элемент упорядоченного потока, или любой элемент, если поток не упорядочен. Не являются редукциями. Могут работать с бесконечными потоками (т.е. не вызывают зависания).</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (875,8,2,'Опишите операции <strong>allMatch</strong>(), <strong>anyMatch</strong>(), <strong>noneMatch</strong>()');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1863,875,'<div><em>boolean</em> <strong>anyMatch</strong>(Predicate &lt;? super <em>T</em>&gt; <em>predicate</em>)</div>
<div><em>boolean</em> <strong>allMatch</strong>(Predicate &lt;? super <em>T</em>&gt; <em>predicate</em>)</div>
<div><em>boolean</em> <strong>noneMatch</strong>(Predicate &lt;? super <em>T</em>&gt; <em>predicate</em>)<br /><br />Возвращают информацию от том или ином отношении потока к подаваемому предикату. Не являются редукциями (т.к. для вычисления может хватить и части потока). <strong>noneMatch</strong> и <strong>allMatch</strong> могут зависнуть на бесконечных потоках. На пустом потоке предикат не вычисляется, <strong>anyMatch</strong> вернет false, <strong>allMatch</strong> и <strong>noneMatch</strong> вернут true.</div>',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (876,8,2,'Опишите операцию <strong>forEach</strong>().');
	INSERT INTO Answer (id,questionId,text,correct,comment) OVERRIDING SYSTEM VALUE VALUES (1864,876,'<em>void</em> <strong>forEach</strong>(<strong>Consumer</strong>&lt;? super <em>T</em>&gt; <em>action</em>)<br /><br />Подает каждый элемент потока потребителю. Единственная терминальная операция, возвращающая <strong>void</strong>. На бесконечном потоке зависнет. Не редукция.&nbsp;<br /><br />(Метод <strong>forEach</strong> может вызываться и напрямую на коллекциях.)',true,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (877,8,0,'Поток нельзя пробежать в цикле <strong>for</strong>, так как он не реализует интерфейс <strong>Iterable&nbsp;</strong>и не имеет возможности доступа к элементу по индексу. Хотя можно преобразовать в массив объектов методом <strong>toArray</strong>() или в массив произвольного типа и размера методом <strong>toArray</strong>(<strong>IntFunction</strong>&lt;<em>A</em>[]&gt;)');
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,609);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,610);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,612);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,613);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,614);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,615);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,616);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,617);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,619);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,620);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,621);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,622);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,623);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,625);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,627);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,629);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,630);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,631);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,632);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,633);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (19,634);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,635);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,636);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,637);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,638);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,639);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,640);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,641);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,642);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,643);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,644);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,645);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,646);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,647);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,648);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,649);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,650);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,651);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,652);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,653);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,654);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,655);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,656);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,657);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,658);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,659);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,660);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,661);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,662);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,663);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,664);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,665);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,666);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,667);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,668);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,669);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,670);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,671);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,672);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,673);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,674);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,675);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,676);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,677);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,678);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,679);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (20,683);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,680);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,681);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,682);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,684);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,685);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,686);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,687);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,688);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,689);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,690);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,691);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,692);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,693);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,694);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,695);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,696);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,697);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,698);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,699);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (21,700);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,701);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,702);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,703);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,704);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,705);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,706);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,707);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,708);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,709);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,710);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,711);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,712);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,713);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,714);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,715);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,716);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,717);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,718);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,719);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,720);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,721);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,723);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,724);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,725);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,726);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,727);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,728);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,729);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,730);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,731);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,732);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,733);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,734);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,735);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,736);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,737);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,738);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,739);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,740);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,741);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,742);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,743);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,744);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,745);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,746);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,747);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,748);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,749);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,750);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,751);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,752);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,753);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,754);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,755);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,756);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,757);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,758);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,759);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (23,722);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,760);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,761);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,762);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,763);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,764);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,765);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,766);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,767);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,768);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,769);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,770);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,771);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,772);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,773);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,774);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,775);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,776);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,777);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,778);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,779);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,780);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,781);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,782);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,784);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,785);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,786);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,787);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,788);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,789);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,790);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,791);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,792);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,793);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,794);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,795);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,796);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,797);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,798);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,799);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,800);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,801);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,802);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,803);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,804);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,805);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,810);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,813);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,832);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,847);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,849);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (22,873);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,806);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,807);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,808);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,809);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,811);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,812);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,814);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,815);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,816);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,818);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,819);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,820);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,822);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,823);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,824);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,825);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,826);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,827);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,828);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,829);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,830);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,831);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,833);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,834);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (24,835);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,836);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,837);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,838);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,839);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,840);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,841);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,842);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,843);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,844);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,845);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,846);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,848);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,850);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,851);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,852);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,853);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,854);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,855);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,856);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,857);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,858);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,859);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,860);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,861);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,862);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,863);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,864);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,865);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,866);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,867);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,868);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,869);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,870);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,871);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,872);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,874);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,875);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,876);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (25,877);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,2);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,3);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,4);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,6);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,7);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,8);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,10);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,11);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,12);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,13);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,14);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,16);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,17);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,18);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,19);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,20);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,21);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,22);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,23);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,24);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,27);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,29);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,30);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,31);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,32);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,33);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,34);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,35);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,36);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,37);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,0);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,38);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,39);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,40);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,43);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,44);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,45);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,46);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,47);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,48);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,49);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,50);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,51);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,52);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,53);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,54);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,55);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,56);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,19);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,57);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,58);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,59);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,60);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,61);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,62);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,63);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,64);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,28);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,67);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,68);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,69);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,70);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,71);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,72);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,74);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,75);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,76);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,77);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,58);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,64);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,73);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,78);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,79);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,80);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,81);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,82);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,83);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,84);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,85);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,86);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,87);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,88);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,89);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,90);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,91);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,92);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,93);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,131);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,94);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,95);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,96);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,97);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,98);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,99);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (2,100);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,143);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,147);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (4,65);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,213);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (5,66);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (3,148);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (3,149);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,229);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,286);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,101);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,102);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,103);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,104);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,105);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,106);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,107);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,108);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,109);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,110);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,111);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,112);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,113);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,114);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,115);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,116);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,117);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,118);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,119);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,121);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,122);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,123);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,124);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,125);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,126);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,127);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,128);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,129);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,130);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,132);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,133);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,134);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,135);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,136);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,137);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,138);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,139);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,140);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,141);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,142);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,144);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,145);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,146);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,150);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,151);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,152);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,153);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (6,154);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,155);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,156);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,157);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,158);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,159);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,160);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,161);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,162);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,163);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,386);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,164);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,165);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,166);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,167);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,168);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,169);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,170);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,171);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,172);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,173);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (7,174);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,175);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,176);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,177);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,178);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,179);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,180);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,440);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,181);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,182);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,183);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,184);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,185);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,186);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,187);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,188);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,189);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,190);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,191);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,192);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,193);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,194);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,195);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,196);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,197);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,198);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,199);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,200);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,201);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,202);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,203);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,204);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,205);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,206);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,207);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,208);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,209);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,210);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,211);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,212);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,213);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,214);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,215);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,216);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,217);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,218);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,219);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,220);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,221);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,222);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,223);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,225);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,226);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,227);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,228);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,230);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,231);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,232);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,233);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,234);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,235);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,236);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,237);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,238);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,239);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,240);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,241);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,501);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,242);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,243);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,244);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,245);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,246);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,247);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,248);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,249);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,250);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,251);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,252);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,253);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,254);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,255);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,256);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,257);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,258);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,259);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,261);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (9,224);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,262);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,263);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,264);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,265);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,266);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,267);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,268);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,270);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,271);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,272);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,273);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,274);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,275);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,276);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,277);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,278);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,279);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,280);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,281);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,282);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,283);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,284);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (9,260);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (8,312);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,285);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,287);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,288);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,289);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,290);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,291);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,292);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,293);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,294);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,295);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,296);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,297);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,298);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,299);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,300);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,301);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,302);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,303);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,304);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,305);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,306);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,307);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,308);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,309);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,310);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,311);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,313);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,314);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,315);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,316);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,317);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,318);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (10,319);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,320);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,321);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,322);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,323);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,324);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,325);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,326);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,327);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,328);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,329);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,330);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,331);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,332);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,333);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,334);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,335);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,336);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,337);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,338);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,339);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,340);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,341);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,342);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,343);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,344);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,345);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,346);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,347);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,348);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,349);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,350);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,351);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,352);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,353);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,354);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,355);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,356);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,357);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,358);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,359);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,360);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,361);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,362);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,363);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,364);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,365);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,366);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,367);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,368);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,369);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,370);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,371);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,372);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,373);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,374);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,375);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,376);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,377);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,378);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,379);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,380);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,381);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,382);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,383);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,384);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,385);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (11,392);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,387);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,388);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,389);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,390);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,391);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,393);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,394);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,395);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,396);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,397);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,398);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,399);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,400);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,401);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,402);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,403);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,404);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,405);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,406);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,407);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,408);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,409);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,410);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,411);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,412);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,413);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,414);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,415);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (12,416);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,417);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,418);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,419);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,420);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,421);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,422);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,423);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,424);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,425);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,426);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,427);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,428);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,429);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,430);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,431);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,432);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,433);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,434);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,435);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,436);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,437);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,438);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,439);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,441);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,442);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,443);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,444);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,445);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,446);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,447);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,448);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,449);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,450);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,451);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,452);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,453);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,454);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,455);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,456);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,457);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,458);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,459);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,460);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,461);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,462);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (9,611);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,463);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,464);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,465);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,466);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,467);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,468);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,469);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,470);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (13,471);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (9,624);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,472);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,473);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,474);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,475);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,476);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,477);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,478);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,479);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,480);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,481);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,482);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,483);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,484);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,485);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,486);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,487);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,488);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,489);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,490);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (14,491);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,492);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,493);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,494);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,495);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,496);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,497);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,498);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,499);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,500);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,501);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,502);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,503);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,504);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,505);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,506);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,507);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,508);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,509);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,510);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,511);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,512);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,513);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,514);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,515);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,516);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,517);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,518);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,519);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,520);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,521);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,523);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,536);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,543);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (15,544);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,522);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (9,783);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,524);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,525);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,526);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,527);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,528);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,529);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,530);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,531);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,532);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,533);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,534);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,535);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,537);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,538);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,539);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,540);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,541);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,542);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (16,545);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (9,817);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (9,821);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,546);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,547);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,548);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,549);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,550);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,551);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,552);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,553);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,554);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,555);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,556);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,557);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,558);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,559);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,560);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,561);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,562);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,563);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,564);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,565);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,567);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,568);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,569);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,570);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,571);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,572);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,573);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,574);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,575);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,576);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,577);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,578);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,579);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,580);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,581);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,582);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,583);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,584);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,585);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,586);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,587);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,588);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,589);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,590);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,591);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,592);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,593);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,594);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,595);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,596);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,597);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,598);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,599);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,600);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,601);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,602);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,603);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (18,566);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,604);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,605);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,606);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,607);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,608);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,618);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,626);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (17,628);
INSERT INTO Image (id,filename,extension) OVERRIDING SYSTEM VALUE VALUES (0,'endermen','jpg');
INSERT INTO Image (id,filename,extension) OVERRIDING SYSTEM VALUE VALUES (1,'ferrari','jpeg');
INSERT INTO Image (id,filename,extension) OVERRIDING SYSTEM VALUE VALUES (2,'NIIAS','png');
INSERT INTO Image (id,filename,extension) OVERRIDING SYSTEM VALUE VALUES (3,'Usersd.gorsheninPicturestest','jpg');
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (0,2,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (1,67,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (2,6,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (3,70,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (4,74,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (5,10,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (6,11,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (7,12,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (8,13,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (9,16,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (10,17,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (11,19,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (12,20,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (13,30,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (14,31,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (15,33,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (16,35,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (17,36,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (18,37,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (19,38,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (20,39,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (21,40,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (22,45,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (23,51,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (24,52,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (25,54,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (26,57,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (27,58,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (28,60,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (29,62,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (30,63,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (31,2,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (32,67,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (33,70,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (34,6,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (35,10,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (36,74,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (37,11,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (38,12,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (39,13,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (40,16,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (41,17,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (42,19,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (43,20,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (44,30,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (45,31,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (46,33,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (47,35,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (48,36,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (49,37,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (50,38,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (51,39,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (52,40,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (53,45,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (54,51,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (55,52,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (56,54,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (57,57,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (58,58,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (59,60,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (60,62,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (61,63,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (62,2,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (63,67,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (64,70,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (65,6,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (66,10,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (67,74,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (68,11,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (69,12,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (70,13,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (71,16,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (72,17,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (73,19,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (74,20,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (75,30,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (76,31,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (77,33,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (78,35,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (79,36,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (80,37,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (81,38,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (82,39,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (83,40,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (84,45,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (85,51,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (86,52,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (87,54,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (88,57,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (89,58,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (90,60,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (91,62,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (92,63,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (93,2,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (94,67,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (95,6,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (96,70,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (97,10,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (98,74,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (99,11,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (100,12,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (101,13,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (102,16,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (103,17,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (104,19,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (105,20,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (106,30,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (107,31,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (108,33,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (109,35,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (110,36,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (111,37,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (112,38,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (113,39,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (114,40,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (115,45,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (116,51,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (117,52,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (118,54,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (119,57,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (120,58,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (121,60,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (122,62,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (123,63,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (124,96,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (125,97,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (126,98,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (127,99,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (128,100,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (129,78,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (130,79,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (131,80,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (132,81,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (133,82,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (134,83,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (135,84,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (136,85,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (137,86,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (138,87,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (139,88,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (140,89,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (141,90,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (142,91,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (143,92,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (144,93,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (145,94,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (146,95,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (147,128,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (148,129,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (149,132,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (150,135,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (151,136,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (152,140,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (153,141,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (154,142,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (155,145,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (156,146,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (157,151,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (158,152,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (159,153,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (160,154,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (161,103,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (162,104,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (163,106,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (164,107,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (165,108,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (166,109,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (167,110,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (168,111,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (169,114,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (170,115,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (171,117,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (172,119,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (173,123,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (174,125,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (175,2,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (176,67,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (177,6,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (178,70,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (179,74,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (180,10,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (181,11,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (182,12,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (183,13,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (184,16,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (185,17,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (186,19,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (187,20,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (188,30,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (189,31,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (190,33,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (191,35,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (192,36,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (193,37,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (194,38,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (195,39,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (196,40,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (197,45,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (198,51,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (199,52,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (200,54,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (201,57,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (202,58,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (203,60,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (204,62,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (205,63,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (206,96,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (207,97,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (208,98,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (209,99,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (210,100,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (211,78,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (212,79,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (213,80,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (214,81,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (215,82,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (216,83,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (217,84,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (218,85,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (219,86,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (220,87,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (221,88,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (222,89,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (223,90,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (224,91,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (225,92,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (226,93,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (227,94,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (228,95,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (229,128,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (230,129,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (231,132,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (232,135,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (233,136,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (234,140,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (235,141,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (236,142,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (237,145,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (238,146,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (239,151,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (240,152,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (241,153,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (242,154,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (243,103,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (244,104,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (245,106,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (246,107,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (247,108,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (248,109,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (249,110,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (250,111,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (251,114,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (252,115,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (253,117,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (254,119,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (255,123,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (256,125,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (257,160,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (258,161,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (259,162,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (260,163,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (261,164,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (262,165,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (263,166,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (264,167,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (265,168,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (266,169,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (267,170,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (268,171,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (269,172,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (270,173,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (271,174,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (272,155,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (273,156,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (274,157,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (275,158,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (276,159,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (277,242,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (278,199,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (279,257,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (280,258,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (281,259,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (282,262,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (283,264,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (284,267,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (285,268,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (286,278,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (287,280,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (288,283,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (289,175,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (290,176,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (291,177,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (292,178,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (293,179,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (294,180,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (295,181,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (296,312,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (297,185,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (298,188,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (299,196,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (300,198,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (301,199,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (302,201,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (303,206,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (304,207,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (305,210,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (306,211,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (307,212,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (308,215,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (309,216,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (310,220,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (311,222,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (312,225,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (313,226,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (314,232,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (315,233,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (316,234,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (317,235,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (318,236,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (319,239,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (320,240,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (321,242,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (322,248,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (323,250,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (324,251,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (325,252,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (326,253,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (327,254,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (328,320,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (329,322,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (330,324,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (331,325,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (332,326,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (333,327,false);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (334,328,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (335,329,true);
INSERT INTO UserAnswer (id,questionId,correct) OVERRIDING SYSTEM VALUE VALUES (336,330,false);
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (0,0,58.06451612903226,TIMESTAMP '2018-07-29 00:05:46');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (1,0,74.19354838709677,TIMESTAMP '2018-08-24 10:43:21');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (2,6,0.0,TIMESTAMP '2018-08-25 16:30:41');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (3,0,80.64516129032258,TIMESTAMP '2018-09-05 18:52:04');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (4,2,91.30434782608695,TIMESTAMP '2018-09-08 17:34:40');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (5,6,42.857142857142854,TIMESTAMP '2018-09-11 11:32:45');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (6,0,83.87096774193549,TIMESTAMP '2018-10-10 14:41:47');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (7,2,82.6086956521739,TIMESTAMP '2018-10-10 15:08:50');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (8,6,53.57142857142857,TIMESTAMP '2018-10-11 12:54:35');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (9,7,75.0,TIMESTAMP '2018-10-11 14:59:25');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (10,8,46.93877551020408,TIMESTAMP '2018-10-17 16:20:17');
INSERT INTO ThemeExam (id,themeId,percentage,date) OVERRIDING SYSTEM VALUE VALUES (11,11,55.55555555555556,TIMESTAMP '2018-10-17 16:53:02');
