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

    @Inject
    Movie movie;
    
    boolean edit = false;
    
    Movie editingMovie = new Movie();
    
    DBCollection movieCollection;

    @PostConstruct
    private void initDB() {
        Mongo m;
        try {
            m = new Mongo();
            DB db = m.getDB("moviesDB");
            movieCollection = db.getCollection("movies");
            if (movieCollection == null) {
                movieCollection = db.createCollection("movies", null);
            }
        } catch (UnknownHostException ex) {
            Logger.getLogger(MovieSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void createMovie(Movie m) {
        BasicDBObject doc = m.toDBObject();
        movieCollection.insert(doc);
    }
    
    @Override
    public void createMovie() {
        BasicDBObject doc = movie.toDBObject();
        movieCollection.insert(doc);
    }

    public List<Movie> getMovies() {
        ArrayList<Movie> movies = new ArrayList<Movie>();
        DBCursor cur = movieCollection.find();
        for (DBObject doc : cur.toArray()) {
            movies.add(Movie.fromDBObject(doc));
        }
        return movies;
    }

    public List<Movie> findMovies() {
        ArrayList<Movie> findMovies = new ArrayList<Movie>();
        BasicDBObject query = new BasicDBObject("name", movie.getName());
        DBCursor cur = movieCollection.find(query);
        for (DBObject doc : cur.toArray()) {
            findMovies.add(Movie.fromDBObject(doc));
        }
        return findMovies;
    }


    public void delete(Movie m) {
        BasicDBObject query = new BasicDBObject("name", m.getName());        
        DBCursor cur = movieCollection.find(query);
        for (DBObject doc : cur.toArray()) {
            movieCollection.remove(doc);
        }        
    }
    
    public Movie getEditingMovie(){
        return this.editingMovie;
    }
    public void edit(Movie m){
        this.editingMovie = m;
        this.edit = true;
    }
    
    public boolean isEdit(){
        return this.edit;
    }
        
    public void save(){
        movieCollection.update(movie.toDBObject(),this.editingMovie.toDBObject());
        this.edit = false;
    }

}
