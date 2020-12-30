package kic.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import kic.admin.models.Categorie;
import kic.admin.models.Course;
import kic.admin.models.Room;
import org.sqlite.SQLiteConfig;

/**
 *
 * @author user0
 */
public class DbController {

    private static Connection dbConn;

    public DbController(String pathToDbFile) throws ClassNotFoundException, SQLException {
        if (dbConn == null) {
            Class.forName("org.sqlite.JDBC");
            SQLiteConfig config = new SQLiteConfig();
            config.enforceForeignKeys(true);
            dbConn = DriverManager.getConnection("jdbc:sqlite:" + pathToDbFile);
        }
    }

    public void insertRoomInDb(Room newRoom) throws SQLException {
        dbConn.createStatement().executeUpdate("insert into room values('"
                                + newRoom.getId() + "', " + newRoom.getCapacity() + ");");
    }
    
    public ResultSet fetchRoomsFromDb() throws SQLException{
        return dbConn.createStatement().executeQuery("select * from room;");
    }
    
    public void DeleteRoomInDb(String roomId) throws SQLException {
        dbConn.createStatement().executeUpdate("delete from room where id='"+ roomId + "'");
    }
    
    
    //categorie
    public void insertCategorieInDb(Categorie newCategorie) throws SQLException {
        dbConn.createStatement().executeUpdate("insert into categories values('"
                                + newCategorie.getId() + "', '" + newCategorie.getName()+ "');");
    }
    
    public ResultSet fetchCategoriesFromDb() throws SQLException{
        return dbConn.createStatement().executeQuery("select * from categories;");
    }
    
    //course
    public void insertCourseInDb(Course newCourse) throws SQLException {
        dbConn.createStatement().executeUpdate("insert into course values("
        + CountCoursesFromDb() + ", '" + newCourse.getCode()+ "'"
        + ", '" + newCourse.getTitle()+ "', '" + newCourse.getShort_name()+ "'"
                + ", '" + newCourse.getCategory()+ "', " + newCourse.getCredits()+ ""
                        + ", '" + newCourse.getIs_elective()+ "');");
    }
    
    public ResultSet fetchCoursesFromDb() throws SQLException{
        return dbConn.createStatement().executeQuery("select code,title,short_name,name as category,credits,is_elective from course c1,categories c2 where c1.category=c2.id;");
    }
    
     public int CountCoursesFromDb() throws SQLException{
        ResultSet rs = dbConn.createStatement().executeQuery("select count(id) as total from course;");
        int total = 0;
        while (rs.next()) {
            total = rs.getInt("total");
        }
        total++;
        return total;
    }
}