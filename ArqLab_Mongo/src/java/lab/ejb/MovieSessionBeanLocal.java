/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package lab.ejb;

import java.util.List;
import javax.ejb.Local;
import lab.model.Movie;

/**
 *
 * @author sortiz
 */
@Local
public interface MovieSessionBeanLocal {
    
 public abstract void createMovie();
 
 public abstract void createMovie(Movie m);
 
 public abstract List<Movie> getMovies();
 
 public abstract List<Movie> findMovies();
 
public abstract void delete(Movie m);

public abstract void edit(Movie m);

public abstract boolean isEdit();

public abstract void save();

public abstract Movie getEditingMovie();

}
