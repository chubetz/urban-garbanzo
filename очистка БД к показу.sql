DELETE FROM Realm WHERE ID NOT IN (4,8, 11,12)
DELETE FROM Theme WHERE RealmID NOT IN (SELECT ID FROM Realm)
DELETE FROM Question WHERE RealmID NOT IN (SELECT ID FROM Realm)
DELETE FROM Answer WHERE QuestionID NOT IN (SELECT ID FROM Question)
DELETE FROM ThemeQuestion WHERE QuestionID NOT IN (SELECT ID FROM Question)
DELETE FROM Image WHERE ID IN (2,3)
DELETE FROM UserAnswer WHERE QuestionID NOT IN (SELECT ID FROM Question)
DELETE FROM ThemeExam WHERE ThemeID NOT IN (SELECT ID FROM Theme)

