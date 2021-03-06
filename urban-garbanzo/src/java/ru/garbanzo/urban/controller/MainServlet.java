/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.garbanzo.urban.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import ru.garbanzo.urban.db.JDBCUtils;
import ru.garbanzo.urban.edu.Answer;
import ru.garbanzo.urban.edu.EduAccess;
import ru.garbanzo.urban.edu.Entity;
import ru.garbanzo.urban.edu.Image;
import ru.garbanzo.urban.edu.Question;
import ru.garbanzo.urban.edu.Realm;
import ru.garbanzo.urban.edu.Storage;
import ru.garbanzo.urban.edu.Theme;
import ru.garbanzo.urban.edu.ThemeExam;
import ru.garbanzo.urban.edu.UserAnswer;
import ru.garbanzo.urban.exception.JDBCException;
import ru.garbanzo.urban.util.Utils;

/**
 * Сервлет, отвечающий за редактирование и импорт/экспорт сущностей
 * @author d.gorshenin
 */
public class MainServlet extends ErrorHandlingServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    @Override
    public void init()
            throws ServletException {
        
        
        super.init(); //To change body of generated methods, choose Tools | Templates.
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding ("UTF-8");
        String action = request.getParameter("action");
        String url = null;
        Question question;
        Utils.print("Servlet.BEFORE!!!", request.getParameterMap());
        
        Question.setImagesUploadLocation(getServletContext().getInitParameter("upload.location"));

        switch (action) {
            case "new_question": //редактирование новой карточки
                url = "/edit_question.jsp";
                Utils.print("Servlet.new_question", request.getParameterMap());
                String realmId = request.getParameter("realm");
                String themeId = request.getParameter("theme");
                Question mockQuestion = null;
                if (realmId != null || themeId != null) {
                    mockQuestion = Question.getMockQuestion(realmId, themeId);
                } else
                    mockQuestion = Question.getMockQuestion();
                request.setAttribute("action", "update_question");
                request.setAttribute("title", "Редактировать вопрос");
                request.setAttribute("edit_mode", "on");
                request.setAttribute("question", mockQuestion);
                break;
            case "add_answer": //добавление ответа в карточку
                url = "/edit_question.jsp";
                Utils.print("Servlet.add_answer", request.getParameterMap());
                Question mock = Question.getQuestionFromParameterMap(request.getParameterMap());
                mock.setNeededNewAnswer(true);
                request.setAttribute("question", mock);
                request.setAttribute("action", "update_question");
                request.setAttribute("title", "Редактировать вопрос");
                request.setAttribute("edit_mode", "on");
                break;
            case "refresh_question_edit": //добавление ответа в карточку
                url = "/edit_question.jsp";
                Utils.print("Servlet.refresh_question_edit", request.getParameterMap());
                request.setAttribute("question", Question.getQuestionFromParameterMap(request.getParameterMap()));
                request.setAttribute("action", "update_question");
                request.setAttribute("title", "Редактировать вопрос");
                request.setAttribute("edit_mode", "on");
                break;
            case "load_edit_form": //отображение формы редактирования имеющейся карточки
                url = "/edit_question.jsp";
                Utils.print("Servlet.load_edit_form", request.getParameterMap());
                Utils.print(request.getParameter("id"));
                question = Question.getById(request.getParameter("id"));
                request.setAttribute("question", question);
                request.setAttribute("action", "update_question");
                request.setAttribute("title", "Редактировать вопрос");
                request.setAttribute("edit_mode", "on");
                //request.setAttribute("disabled", "disabled");
                if (request.getParameter("themeId") != null) {
                    Theme theme = Theme.getById(request.getParameter("themeId"));
                    request.setAttribute("theme", theme);
                    request.setAttribute("orderNum", question.getOrderNum(theme));
                }
                break;
            case "update_question": //сохранение изменений в карточке
                Utils.print("Servlet.update_question", request.getParameterMap());
                try {
                    request.setAttribute("title", Integer.parseInt(request.getParameter("id")) < 0 ? "Вопрос добавлен" : "Вопрос отредактирован");
                    question = Question.saveQuestion(request.getParameter("id"), request.getParameterMap());
                    String newThemeId = request.getParameter("newThemeId");
                    themeId = request.getParameter("themeId");
                    if (newThemeId != null) {
                        question.linkThemes(new String[]{newThemeId});
                    }
                    if (themeId != null) { //пришел вопрос, редактированный в связке с темой и имеющий порядковый номер в теме
                        int orderNum;
                        try {
                            orderNum = Integer.parseInt(request.getParameter("orderNum"));
                        } catch (NumberFormatException nfe) {
                            orderNum = -1;
                        }
                        Theme theme = Theme.getById(themeId);
                        if (orderNum >= 0 && orderNum != question.getOrderNum(theme)) { //изменился порядковый номер вопроса в теме
                            theme.updateQuestionOrderNums(question, orderNum);
                        }
                    }
                } catch (JDBCException ex) {
                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
                    url = "/db_error.jsp";
                    request.setAttribute("exception", ex);
                    break;
                }
                url = "/new_question.jsp";
                request.setAttribute("question", question);
                break;

//            case "new_realm":
//                url = "/edit_realm.jsp";
//                Utils.print("Servlet.new_realm", request.getParameterMap());
//                request.setAttribute("realm", Realm.getMock());
//                request.setAttribute("action", "update_realm");
//                request.setAttribute("title", "Редактировать область");
//                break;
//            case "edit_realm":
//                url = "/edit_realm.jsp";
//                Utils.print("Servlet.edit_realm", request.getParameterMap());
//                Utils.print(request.getParameter("id"));
//                request.setAttribute("realm", Realm.getById(request.getParameter("id")));
//                request.setAttribute("action", "update_realm");
//                request.setAttribute("title", "Редактировать область");
//                break;
//            case "update_realm":
//                Realm realm;
//                Utils.print("Servlet.update_realm", request.getParameterMap());
//                try {
//                    realm = Realm.saveRealm(request.getParameter("rid"), request.getParameterMap());
//                } catch (JDBCException ex) {
//                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
//                    url = "/db_error.jsp";
//                    request.setAttribute("exception", ex);
//                    break;
//                }
//                url = "/saved_realm.jsp";
//                request.setAttribute("realm", realm);
//                request.setAttribute("title", "Область сохранена");
//                break;
//
//            case "new_theme":
//                url = "/edit_theme.jsp";
//                Utils.print("Servlet.new_theme", request.getParameterMap());
//                request.setAttribute("theme", Theme.getMock());
//                request.setAttribute("action", "update_theme");
//                request.setAttribute("title", "Редактировать тему");
//                break;
//            case "edit_theme":
//                url = "/edit_theme.jsp";
//                Utils.print("Servlet.edit_theme", request.getParameterMap());
//                Utils.print(request.getParameter("id"));
//                request.setAttribute("theme", Theme.getById(request.getParameter("id")));
//                request.setAttribute("action", "update_theme");
//                request.setAttribute("title", "Редактировать тему");
//                break;
//            case "update_theme":
//                Theme theme;
//                Utils.print("Servlet.update_theme", request.getParameterMap());
//                try {
//                    theme = Theme.saveTheme(request.getParameter("tid"), request.getParameterMap());
//                } catch (JDBCException ex) {
//                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
//                    url = "/db_error.jsp";
//                    request.setAttribute("exception", ex);
//                    break;
//                }
//                url = "/saved_theme.jsp";
//                request.setAttribute("title", "Тема сохранена");
//                request.setAttribute("theme", theme);
//                break;

            case "link_themes": // связывание карточки с темами предметной области
                Utils.print("Servlet.link_themes", request.getParameterMap());
                Utils.print("Servlet.link_themes", request.getParameterMap().get("themes"));
                Question qq = Question.getById(request.getParameter("id"));
                try {
                    qq.linkThemes(request.getParameterMap().get("themes"));
                } catch (JDBCException ex) {
                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
                    url = "/db_error.jsp";
                    request.setAttribute("exception", ex);
                    break;
                }
                request.setAttribute("question", qq);
                request.setAttribute("title", "Добавлена связь с темами");
                url = "/new_question.jsp";
                break;

            case "new_image": //окно загрузки изображения
                url = "/upload_image.jsp";
                Utils.print("Servlet.new_image", request.getParameterMap());
                break;
            case "upload_image": // сохранение (закачка) изображения
                url = "/view?info=images";
                String questionId = request.getParameter("questionId");
                if (questionId != null)
                    url = "/imgLib?questionId=" + questionId;
                Part filePart = request.getPart("file");
                String fileFullName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                InputStream fileContent = filePart.getInputStream();
                Utils.print("Servlet.upload_image", request.getParameterMap());
                Utils.print("Servlet.fileName", fileFullName);
                Utils.print("Servlet.fileContent", fileContent);
                Image image;
                if (!fileFullName.equals("")) { //пришел непустой файл
                    String[] fileNameParts = fileFullName.split("\\.");
                    String extension = fileNameParts[fileNameParts.length-1];
                    String[] name = new String[fileNameParts.length-1];
                    for (int i=0; i < fileNameParts.length-1 ; i++) {
                        name[i] = fileNameParts[i];
                    }
                    String fileName = String.join(".", name);
                    Map<String, Object> data = new HashMap<String, Object>();
                    data.put("filename", fileName);
                    data.put("extension", extension);
                    try {
                        image = Image.saveImage(-1, data);
                    } catch (JDBCException ex) {
                        Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
                        url = "/db_error.jsp";
                        request.setAttribute("exception", ex);
                        break;
                    }

                    int myByte = fileContent.read();
                    if (myByte != -1) {
                        String pathStr = this.getServletContext().getRealPath(File.separator) + getServletContext().getInitParameter("upload.location");
                        //Path path = Paths.get(pathStr);
                        File uploadsDir = new File(pathStr);
                        //if (Files.notExists(path)){
                        if (!uploadsDir.exists()) {
                            uploadsDir.mkdir();
                            // If you require it to make the entire directory path including parents,
                            // use uploadsDir.mkdirs(); here instead.
                        }
                        File file = new File(uploadsDir, "" + image.getId());
                        FileOutputStream fos = new FileOutputStream(file);
                        try {
                            while (myByte != -1) {
                                fos.write(myByte);
                                myByte = fileContent.read();
                            }
                        } catch (IOException e) {
                            image.delete();
                            throw new RuntimeException(e);
                            
                        } finally {
                            fos.close();
                        }
                        
                    }
                }
                break;
                
            case "upload_sql": //загрузка SQL-файла с данными
                {
                    url = "/";
                    Part part = request.getPart("file");
                    try (BufferedReader br = new BufferedReader(
                                new InputStreamReader(part.getInputStream(), "UTF-8"));) {
                        
                        
                        int chr;
                        int ap_count = 0; //счетчик апострофов, нужен, чтобы отличить разделяющий ; от внутритекстового
                        StringBuilder sb = new StringBuilder();
                        boolean firstLine = true;
                        List<String> list = new LinkedList<>();
                        while ((chr = br.read()) != -1) {
                            char c = (char)chr;
                            if (c == '\'')
                                ap_count++;
                            if (c == ';' && ap_count % 2 == 0) { //закончилось SQL-выражение
                                String stmt = sb.toString().trim();
                                if (firstLine) { // Избавляемся от служебных символов в начале файла
                                    stmt = stmt.replaceFirst("^\\W+", "");
                                    firstLine = false;
                                }
                                sb = new StringBuilder();
                                //Utils.print(stmt);
                                //int processedQty = JDBCUtils.executeUpdate(stmt);
                                //Utils.print("Обработано " + processedQty + "строк");
                                list.add(stmt);
                            } else {
                                sb.append(c);
                            }
                                
                        }
                        
                        int processedQty = JDBCUtils.executeUpdateList(list);
                        Utils.print("Обработано " + processedQty + "строк");
                        
                        Storage.init();
                        
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    } catch (JDBCException e) {
                        Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, e);
                        url = "/db_error.jsp";
                        request.setAttribute("exception", e);
                        break;
                        
                    }
                }
                break;

            case "export": //выгрузка данных в файл SQL
                Storage.init(); // реинициализация, чтобы выгрузка была строго из БД
                try {
                    if (Storage.getJdbcException() != null) {
                        throw Storage.getJdbcException();
                    }
                    final StringBuilder sb = new StringBuilder();
                        sb.append("DROP TABLE Realm IF EXISTS;\r\n");
                        sb.append("CREATE TABLE Realm (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, text VARCHAR(20), description VARCHAR(2000));\r\n");
                        sb.append("DROP TABLE Theme IF EXISTS;\r\n");
                        sb.append("CREATE TABLE Theme (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, realmId int, text VARCHAR(2000), number DOUBLE);\r\n");
                        sb.append("DROP TABLE Question IF EXISTS;\r\n");
                        sb.append("CREATE TABLE Question (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, realmId int, type int, text VARCHAR(4000), regDate TIMESTAMP, updateDate TIMESTAMP);\r\n");
                        sb.append("\tDROP TABLE Answer IF EXISTS;\r\n");
                        sb.append("\tCREATE TABLE Answer (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, questionId int, correct boolean, text VARCHAR(4000), comment VARCHAR(2000));\r\n");
                        sb.append("DROP TABLE ThemeQuestion IF EXISTS;\r\n");
                        sb.append("CREATE TABLE ThemeQuestion (themeId int, questionId int, orderNum int, PRIMARY KEY(themeId, questionId));\r\n");
                        sb.append("DROP TABLE Image IF EXISTS;\r\n");
                        sb.append("CREATE TABLE Image (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, filename VARCHAR(2000), extension VARCHAR(10));\r\n");
                        sb.append("DROP TABLE UserAnswer IF EXISTS;\r\n");
                        sb.append("CREATE TABLE UserAnswer (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, questionId int, correct boolean, answerDate TIMESTAMP);\r\n");
                        sb.append("DROP TABLE ThemeExam IF EXISTS;\r\n");
                        sb.append("CREATE TABLE ThemeExam (id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, themeId int, percentage DOUBLE, date TIMESTAMP);\r\n");
//                    for (Realm r: Realm.getMap().values()) {
//                        sb.append(r.getSQLExportString());
//                    }
                    
                    Realm.getMap().values().stream()
                            .sorted(Entity.PK_COMPARATOR)
                            .map(Entity::getSQLExportString)
                            .forEach(sb::append);

//                    for (Theme t: Theme.getMap().values()) {
//                        sb.append(t.getSQLExportString());
//                    }

                    Theme.getMap().values().stream()
                            .sorted(Entity.PK_COMPARATOR)
                            .map(Entity::getSQLExportString)
                            .forEach(sb::append);

//                    for (Question q: Question.getMap().values()) {
//                        sb.append(q.getSQLExportString());
//                        for (Answer a: q.getAnswerMap().values()) {
//                            sb.append("\t"+a.getSQLExportString());
//                        }
//                    }

                    Question.getMap().values().stream()
                            .sorted(Entity.PK_COMPARATOR)
                            .forEach( q -> {
                                sb.append(q.getSQLExportString());
                                q.getAnswerMap().values().stream()
                                        .sorted(Entity.PK_COMPARATOR)
                                        .map(a -> "\t"+a.getSQLExportString())
                                        .forEach(sb::append);
                            });

//                    for (Entity themeQuestion :  EduAccess.getThemeQuestionSet()) {
//                        sb.append(themeQuestion.getSQLExportString());
//                    }

                    EduAccess.getThemeQuestionSet().stream()
                            .sorted(Entity.PK_COMPARATOR)
                            .map(Entity::getSQLExportString)
                            .forEach(sb::append);

//                    for (Image i: Image.getMap().values()) {
//                        sb.append(i.getSQLExportString());
//                    }

                    Image.getMap().values().stream()
                            .sorted(Entity.PK_COMPARATOR)
                            .map(Entity::getSQLExportString)
                            .forEach(sb::append);

//                    for (UserAnswer ua: UserAnswer.getMap().values()) {
//                        sb.append(ua.getSQLExportString());
//                    }

                    UserAnswer.getMap().values().stream()
                            .sorted(Entity.PK_COMPARATOR)
                            .map(Entity::getSQLExportString)
                            .forEach(sb::append);

//                    for (ThemeExam te: ThemeExam.getMap().values()) {
//                        sb.append(te.getSQLExportString());
//                    }

                    ThemeExam.getMap().values().stream()
                            .sorted(Entity.PK_COMPARATOR)
                            .map(Entity::getSQLExportString)
                            .forEach(sb::append);

                    Utils.print(sb);
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    response.setHeader("Content-Disposition", "attachment; filename=\"questions.sql\"");
                    PrintWriter out = response.getWriter();
                    out.print(sb.toString());
                } catch (JDBCException ex) {
                    Logger.getLogger(MainServlet.class.getName()).log(Level.SEVERE, null, ex);
                    url = "/db_error.jsp";
                    request.setAttribute("exception", ex);
                    break;
                }
                break;
                
        }
        if (url != null)
            getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        Set<String> allowedActions= new HashSet<String>();
        allowedActions.add("new_theme");
        allowedActions.add("new_realm");
        allowedActions.add("new_question");
        allowedActions.add("export");
        allowedActions.add("new_question2");
        allowedActions.add("new_image");
        allowedActions.add("upload_image");
        allowedActions.add("edit_realm");
        allowedActions.add("edit_theme");
        allowedActions.add("load_edit_form");
        if (allowedActions.contains(action))
            processRequest(request, response);
        else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("Недопустимые параметры");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
