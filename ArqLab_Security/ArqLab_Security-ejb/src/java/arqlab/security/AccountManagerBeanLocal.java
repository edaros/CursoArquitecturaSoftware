/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package arqlab.security;

import javax.ejb.Local;

/**
 *
 * @author sortiz
 */
@Local
public interface AccountManagerBeanLocal {

    Boolean deposit(String AccountNumber, Float Amount);

    Float getBalance(String AccountNumber);

    Boolean close(String AccountNumber);
    
}
