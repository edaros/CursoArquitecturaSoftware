/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lab.model;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import javax.enterprise.inject.Model;
import javax.validation.constraints.Size;

/**
 *
 * @author sortiz
 */

@Model
public class Movie {
    
    @Size(min=1, max=20)
private String name;

@Size(min=2, max=3)
private String language;

private int year;

    public String getName() {
        return name;
    }

    public String getLanguage() {
        return language;
    }

    public int getYear() {
        return year;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public void setYear(int year) {
        this.year = year;
    }
    
    public BasicDBObject toDBObject(){
        BasicDBObject doc = new BasicDBObject();
        
        doc.put("name", this.name);
        doc.put("year", this.year);
        doc.put("language", this.language);
        
        return doc;
    }
    
    public static Movie fromDBObject(DBObject doc){
        Movie m = new Movie();
        m.name =  (String) doc.get("name");
        m.year = (Integer) doc.get("year");
        m.language = (String)doc.get("language");
        return m;
        
    }
    
    @Override
    public String toString(){
        return name + ", " + year + ", " + language;                
    }
    
}
