DROP TABLE Realm IF EXISTS;
CREATE TABLE Realm (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, text VARCHAR(20), description VARCHAR(2000));
DROP TABLE Theme IF EXISTS;
CREATE TABLE Theme (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, realmId int, text VARCHAR(2000), number DOUBLE);
DROP TABLE Question IF EXISTS;
CREATE TABLE Question (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, realmId int, type int, text VARCHAR(2000));
	DROP TABLE Answer IF EXISTS;
	CREATE TABLE Answer (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, questionId int, correct boolean, text VARCHAR(2000));
DROP TABLE ThemeQuestion IF EXISTS;
CREATE TABLE ThemeQuestion (themeId int, questionId int, PRIMARY KEY(themeId, questionId));
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (0,'java','Java');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (1,'kotlin','Kotlin');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (2,'sql','SQL');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (3,'minecraft','MINECRAFT');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (4,'oca_1','Сертификат OCA I');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (5,'test','ТЕСТ');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (6,'test2','TEST 2');
INSERT INTO Realm (id,text,description) OVERRIDING SYSTEM VALUE VALUES (7,'history','История');
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (0,4,'Основы',1.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (1,4,'Особенности экзамена',0.0);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (2,0,'вапвапвап',3.45);
INSERT INTO Theme (id,realmId,text,number) OVERRIDING SYSTEM VALUE VALUES (3,0,'вавап',4.0);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (0,4,0,'Тесты экзамена предполагают обычно 5 или 6 ответов, со множественным выбором.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (1,4,0,'Нельзя реализовать в классе два интерфейса с общим дефолтным методом, если не переопределить этот метод в классе.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (2,4,2,'<p>Перечислите 3 вида комментариев в Java</p>');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (79,2,'<p>1. Комменарий до конца строки:<br />// comment until end of line<br />2. Многострочный комментарий (звездочки на промежуточных строках необязательны):<br />/*&nbsp; Multiple<br />[*] line<br />comment */<br />3. Комментарий Javadoc<br />/**<br />[*] Javadoc multiple-line comment<br />[*] @author Jeanne and Scott<br />*/</p>',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (3,4,0,'Особенности комментариев. <br />- Любые символы между /* и */ - часть многострочного комментария <br />- Любые символы после // - часть однострочного комментария <br />- Вкладывать многострочные комментарии друг в друга нельзя - компилятор реагирует на первый закрывающий, и последующие закрывающие остаются неинтерпретируемыми:<br />/* * /* ferret */ */ (для компилятора то же самое, что просто */)');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (4,4,0,'В одном файле может быть определено несколько классов. Только один из них может быть объявлен как <strong>public</strong>, и в этом случае имя файла должно совпадать с именем класса.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (5,7,1,'В каком веке родился <strong>Александр</strong> Македонский?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (75,5,'III до н.э.',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (76,5,'II н.э.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (77,5,'II до н.э.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (78,5,'XX век',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (6,4,2,'Как скомпилировать и запустить java-файл из командной строки?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (80,6,'$ javac Zoo.java <br />$ java Zoo',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (7,4,0,'Очень полезно следовать следующим правилам именования: <br />1. Один файл - один класс <br />2. Имя класса = имя файла');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (8,4,0,'Если в классе <strong>Test.java</strong> нет <strong>static</strong>-метода <em>main</em>(), то при попытке запуска <strong>Test.class</strong> будет ошибка (например, <em>Main method not found in class...</em>).');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (9,2,0,'Какой оператор1?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (65,9,'SELECT FROM',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (66,9,'GOPRKD',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (67,9,'UPDATE SET',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (10,4,2,'Как можно корректно задать строковый параметр метода <em>main()?</em>');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (81,10,'String[] args<br />String args[]<br />String... args',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (11,4,1,'Сколько wildcard-звездочек может быть в строке импорта?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (83,11,'Сколько угодно:<br /><strong>import java.nio.*.*;</strong>',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (84,11,'Только одна, в любом месте импорта:<br /><strong>import java.nio.*.Files;</strong>',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (85,11,'Только одна,&nbsp;в конце импорта:<br /><strong>import java.nio.file.*;</strong>',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (12,4,2,'Как задать строковые параметры при старте программы из командной строки?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (82,12,'$ javac Zoo.java<br />$ java Zoo Bronx Сat<br />$ java Zoo "San Diego" Gon',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (13,4,2,'Может ли обычный импорт импортировать методы и поля класса?<br /><strong>import java.nio.files.Paths.*;</strong>');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (86,13,'Нет.',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (14,0,0,'А если так?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (62,14,'то будет так, а не иначе',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (15,3,1,'Minecraft - это очень классная игра?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (7,15,'Да',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (8,15,'Нет',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (9,15,'Конечно',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (16,0,0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (10,16,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (11,16,'jkl',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (12,16,'hjk',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (17,0,0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (13,17,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (14,17,'jkl',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (15,17,'hjk',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (18,0,0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (16,18,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (17,18,'jkl',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (18,18,'hjk',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (19,0,0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (19,19,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (22,19,'pppp',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (20,0,2,'Что такое язык программирования Котлин?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (57,20,'Хорошая вещь',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (60,20,'Ужасная вещь',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (61,20,'прекрасная вещь',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (21,0,0,'111');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (22,0,0,'111');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (23,0,0,'111');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (23,23,'2',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (24,23,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (25,23,'3',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (26,23,'5',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (24,0,0,'Что такое Котлин?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (27,24,'Это язык программирования.',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (28,24,'Это марка машины.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (29,24,'Это такой торт.',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (25,0,0,'Что такое Apple?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (32,25,'Это бренд техники.',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (33,25,'Это операционная система.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (30,25,'Это телефоны.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (31,25,'Это яблоко.',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (26,0,0,'Как правильно пишется слово ш..колад?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (34,26,'Шакалад',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (35,26,'Шоколад',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (36,26,'Шиколад',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (59,26,'Шуколад',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (27,0,0,'444');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (28,0,0,'444');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (29,0,0,'444');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (30,0,0,'444');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (40,30,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (41,30,'6',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (42,30,'5',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (31,0,0,'444');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (43,31,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (44,31,'6',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (45,31,'5',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (32,0,0,'444');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (48,32,'5',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (46,32,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (47,32,'6',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (33,0,0,'');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (49,33,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (50,33,'6',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (51,33,'5',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (34,4,0,'Названия пакетов подчиняются тем же правилам именования, что и переменные.');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (35,1,2,'общий вопрос 3');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (52,35,'Т\акой ответ 4',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (36,0,0,'Как меня зовут?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (53,36,'Папа',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (54,36,'Клон',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (55,36,'Митя',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (56,36,'Голем',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (37,0,0,'Никакой не хочу');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (38,1,1,'Ну-ка, попробуем?!!');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (64,38,'Вот Вам Ответ!',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (63,38,'Вот Вам Неверный Ответ!',false);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (39,0,0,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (40,0,2,'Машуня - самая любимая?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (68,40,'Да!!!!!',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (69,40,'Однозначно!!!!!!!!!!',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (70,40,'Да!!!!!!!',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (41,3,1,'Какой дроп у Крипера?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (71,41,'порох',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (72,41,'Фейерверки',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (73,41,'Динамит(ТНТ)',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (74,41,'Пластинки',true);
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (42,6,0,'');
INSERT INTO Question (id,realmId,type,text) OVERRIDING SYSTEM VALUE VALUES (43,4,0,'Wildcard при импорте распространяется только на классы, вложенные пакеты не просматриваются:<br />
<p><strong>import java.nio.*;</strong></p>
не импортирует класс java.nio.file.Files');
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,2);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,34);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,3);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,4);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (1,0);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,6);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,7);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,8);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,10);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,11);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,43);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,12);
INSERT INTO ThemeQuestion (themeId,questionId) VALUES (0,13);
