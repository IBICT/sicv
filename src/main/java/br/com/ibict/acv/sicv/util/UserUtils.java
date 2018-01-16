/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ibict.acv.sicv.util;

/**
 *
 * @author deivdywilliamsilva
 */
public class UserUtils {

    public static int getPriorit(String perfil) {
        switch (perfil) {
            case "ADMINISTRADOR":
                return 4;
            case "REVISOR DE QUALIDADE":
                return 3;
            case "REVISOR DE TECNOLOGIA":
                return 2;
            default:
                return 1;
        }
    }

}
