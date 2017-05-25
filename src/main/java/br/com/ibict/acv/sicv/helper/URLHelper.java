package br.com.ibict.acv.sicv.helper;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author deivdy
 */
public class URLHelper {

    public static String getURLWithContextPath(HttpServletRequest request) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }

}
