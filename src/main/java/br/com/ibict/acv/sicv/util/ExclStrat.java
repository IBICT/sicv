package br.com.ibict.acv.sicv.util;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;

/**
 *
 * @see https://stackoverflow.com/questions/4802887/gson-how-to-exclude-specific-fields-from-serialization-without-annotations
 */
public class ExclStrat implements ExclusionStrategy {
    private Class<?> c;
        private String fieldName;
        public ExclStrat(String fqfn) throws SecurityException, NoSuchFieldException, ClassNotFoundException
        {
            this.c = Class.forName(fqfn.substring(0, fqfn.lastIndexOf(".")));
            this.fieldName = fqfn.substring(fqfn.lastIndexOf(".")+1);
        }
        public boolean shouldSkipClass(Class<?> arg0) {
            return false;
        }

        public boolean shouldSkipField(FieldAttributes f) {

            return (f.getDeclaringClass() == c && f.getName().equals(fieldName));
        }

}
