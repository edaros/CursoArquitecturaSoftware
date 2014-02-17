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
 
 public abstract List<Movie> getMovies();
    
}
