/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lab.ejb;

import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.inject.Named;
import lab.model.Movie;

/**
 *
 * @author sortiz
 */
@Stateless
@Named
public class MovieSessionBean implements MovieSessionBeanLocal {
    
    @Inject Movie movie;
    
    DBCollection movieCollection;
    
@PostConstruct
private void initDB(){
    Mongo m;
    try {
        m = new Mongo();
        DB db = m.getDB("moviesDB");
        movieCollection = db.getCollection("movies");
        if(movieCollection == null){
            movieCollection = db.createCollection("movies", null);          
        }
    }catch(UnknownHostException ex){
        Logger.getLogger(MovieSessionBean.class.getName()).log(Level.SEVERE, null, ex);
    }
}

public void createMovie(){
    BasicDBObject doc = movie.toDBObject();
    movieCollection.insert(doc);
    
}

public List<Movie> getMovies(){
   ArrayList<Movie> movies = new ArrayList<Movie>();
    DBCursor cur = movieCollection.find();
    for(DBObject doc :cur.toArray()){
        movies.add(Movie.fromDBObject(doc));
    }
    return movies;
    
    
}

}


