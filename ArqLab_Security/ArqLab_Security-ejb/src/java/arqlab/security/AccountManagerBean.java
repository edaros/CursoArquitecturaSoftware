/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package arqlab.security;

import javax.annotation.security.PermitAll;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;

/**
 *
 * @author sortiz
 */
@Stateless
public class AccountManagerBean implements AccountManagerBeanLocal {

    @PermitAll
    @Override
    public Boolean deposit(String AccountNumber, Float Amount) {
        System.out.println("Deposit of " + Float.toString(Amount) + 
                "to account " + AccountNumber);
        return true;
    }

    @PermitAll
    @Override
    public Float getBalance(String AccountNumber) {
        System.out.println("Balance for account" + AccountNumber + " is 1000");
        return 1000f;
    }

    @PermitAll
    @Override
    public Boolean close(String AccountNumber) {
        System.out.println("Closing account " + AccountNumber);
        return true;
    }

}
