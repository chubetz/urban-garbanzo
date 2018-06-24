DELETE FROM Question;
	DELETE FROM Answer;
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (0,'oca_1',0,'Тесты экзамена предполагают обычно 5 или 6 ответов, со множественным выбором.');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (1,'java',0,'А вот еще вопрос');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (1,1,'Первый',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (2,1,'Третий',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (3,1,'Второй',true);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (2,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (3,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (4,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (5,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (6,'kotlin',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (7,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (8,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (9,'sql',0,'Какой оператор?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (65,9,'SELECT FROM',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (66,9,'GOPRKD',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (67,9,'UPDATE SET',true);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (10,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (11,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (12,'java',0,'fsfsd
f
sd
fs
dfs');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (13,'java',0,'fsfsd
f
sd
fs
dfs');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (14,'java',0,'А если так?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (62,14,'то будет так, а не иначе',true);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (15,'java',0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (7,15,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (8,15,'jkl',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (9,15,'hjk',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (16,'java',0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (10,16,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (11,16,'jkl',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (12,16,'hjk',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (17,'java',0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (13,17,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (14,17,'jkl',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (15,17,'hjk',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (18,'java',0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (16,18,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (17,18,'jkl',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (18,18,'hjk',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (19,'java',0,'fsfsd
f
sd
fs
dfs');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (19,19,'sdf',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (22,19,'pppp',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (20,'java',2,'Что такое язык программирования Котлин?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (57,20,'Хорошая вещь',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (60,20,'Ужасная вещь',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (61,20,'прекрасная вещь',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (21,'java',0,'111');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (22,'java',0,'111');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (23,'java',0,'111');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (23,23,'2',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (24,23,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (25,23,'3',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (26,23,'5',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (24,'java',0,'Что такое Котлин?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (27,24,'Это язык программирования.',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (28,24,'Это марка машины.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (29,24,'Это такой торт.',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (25,'java',0,'Что такое Apple?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (32,25,'Это бренд техники.',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (33,25,'Это операционная система.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (30,25,'Это телефоны.',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (31,25,'Это яблоко.',true);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (26,'java',0,'Как правильно пишется слово ш..колад?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (34,26,'Шакалад',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (35,26,'Шоколад',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (36,26,'Шиколад',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (59,26,'Шуколад',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (27,'java',0,'444');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (28,'java',0,'444');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (29,'java',0,'444');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (30,'java',0,'444');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (40,30,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (41,30,'6',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (42,30,'5',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (31,'java',0,'444');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (43,31,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (44,31,'6',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (45,31,'5',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (32,'java',0,'444');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (48,32,'5',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (46,32,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (47,32,'6',true);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (33,'java',0,'');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (49,33,'4',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (50,33,'6',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (51,33,'5',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (34,'kotlin',2,'общий вопрос ::::');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (35,'kotlin',2,'общий вопрос 3');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (52,35,'Т\акой ответ 4',true);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (36,'java',0,'Как меня зовут?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (53,36,'Папа',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (54,36,'Клон',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (55,36,'Митя',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (56,36,'Голем',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (37,'java',0,'Никакой не хочу');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (38,'kotlin',1,'Ну-ка, попробуем?!!');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (64,38,'Вот Вам Ответ!',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (63,38,'Вот Вам Неверный Ответ!',false);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (39,'java',0,'');
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (40,'java',2,'Машуня - самая любимая?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (68,40,'Да!!!!!',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (69,40,'Однозначно!!!!!!!!!!',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (70,40,'Да!!!!!!!',true);
INSERT INTO Question (id,realm,type,text) OVERRIDING SYSTEM VALUE VALUES (41,'minecraft',1,'Какой дроп у Крипера?');
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (71,41,'порох',true);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (72,41,'Фейерверки',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (73,41,'Динамит(ТНТ)',false);
	INSERT INTO Answer (id,questionId,text,correct) OVERRIDING SYSTEM VALUE VALUES (74,41,'Пластинки',true);
