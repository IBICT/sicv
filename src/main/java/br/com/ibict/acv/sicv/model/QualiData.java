/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ibict.acv.sicv.model;

import com.google.gson.annotations.Expose;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author deivdywilliamsilva
 */
@Entity
@Table(name = "qualidata")
public class QualiData implements Serializable {
    
    @Id
    @Expose
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private Archive archive;
    
    private Boolean q1;
    
    private Boolean q2;
    
    private Boolean q3;
    
    private Boolean q4;
    
    private Boolean q5;
    
    private Boolean q6;
    
    private Boolean q7;
    
    private Boolean q8;
    
    private Boolean q9;
    
    private Boolean q10;
    
    private Boolean q11;
    
    private Boolean q12;
    
    private Boolean q13;
    
    private Boolean q14;
    
    private Boolean q15;
    
    private Boolean q16;
    
    private Boolean q17;
    
    private Boolean q18;
    
    private Boolean q19;
    
    private Boolean q20;
    
    private Boolean q21;
    
    private Boolean q22;
    
    private Boolean q23;
    
    private Boolean q24;
    
    private Boolean q25;
    
    private Boolean q26;
    
    private Boolean q27;
    
    private Boolean q28;
    
    private Boolean q29;
    
    private Boolean q30;
    
    private Boolean q31;
    
    private Boolean q32;
    
    private Boolean q33;
    
    private Boolean q34;
    
    private Boolean q35;
    
    private Boolean q36;
    
    private Boolean q37;
    
    private Boolean q38;
    
    private Boolean q39;
    
    private Boolean q40;
    
    private Boolean q41;
    
    private Boolean q42;
    
    private String comment1;
    
    private String comment2;
    
    private String comment3;
    
    private String comment4;
    
    private String comment5;
    
    private String comment6;
    
    private String comment7;
    
    private String comment8;
    
    private String comment9;
    
    private String comment10;
    
    private String comment11;
    
    private String comment12;
    
    private String comment13;
    
    private String comment14;
    
    private String comment15;
    
    private String comment16;
    
    private String comment17;
    
    private String comment18;
    
    private String comment19;
    
    private String comment20;
    
    private String comment21;
    
    private String comment22;
    
    private String comment23;
    
    private String comment24;
    
    private String comment25;
    
    private String comment26;
    
    private String comment28;
    
    private String comment29;
    
    private String comment30;
    
    private String comment31;
    
    private String comment32;
    
    private String comment33;
    
    private String comment34;
    
    private String comment35;
    
    private String comment36;
    
    private String comment37;
    
    private String comment38;
    
    private String comment39;
    
    private String comment40;
    
    private String comment41;
    
    private String comment42;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Archive getArchive() {
        return archive;
    }

    public void setArchive(Archive archive) {
        this.archive = archive;
    }

    public Boolean getQ1() {
        return q1;
    }

    public void setQ1(Boolean q1) {
        this.q1 = q1;
    }

    public Boolean getQ2() {
        return q2;
    }

    public void setQ2(Boolean q2) {
        this.q2 = q2;
    }

    public Boolean getQ3() {
        return q3;
    }

    public void setQ3(Boolean q3) {
        this.q3 = q3;
    }

    public Boolean getQ4() {
        return q4;
    }

    public void setQ4(Boolean q4) {
        this.q4 = q4;
    }

    public Boolean getQ5() {
        return q5;
    }

    public void setQ5(Boolean q5) {
        this.q5 = q5;
    }

    public Boolean getQ6() {
        return q6;
    }

    public void setQ6(Boolean q6) {
        this.q6 = q6;
    }

    public Boolean getQ7() {
        return q7;
    }

    public void setQ7(Boolean q7) {
        this.q7 = q7;
    }

    public Boolean getQ8() {
        return q8;
    }

    public void setQ8(Boolean q8) {
        this.q8 = q8;
    }

    public Boolean getQ9() {
        return q9;
    }

    public void setQ9(Boolean q9) {
        this.q9 = q9;
    }

    public Boolean getQ10() {
        return q10;
    }

    public void setQ10(Boolean q10) {
        this.q10 = q10;
    }

    public Boolean getQ11() {
        return q11;
    }

    public void setQ11(Boolean q11) {
        this.q11 = q11;
    }

    public Boolean getQ12() {
        return q12;
    }

    public void setQ12(Boolean q12) {
        this.q12 = q12;
    }

    public Boolean getQ13() {
        return q13;
    }

    public void setQ13(Boolean q13) {
        this.q13 = q13;
    }

    public Boolean getQ14() {
        return q14;
    }

    public void setQ14(Boolean q14) {
        this.q14 = q14;
    }

    public Boolean getQ15() {
        return q15;
    }

    public void setQ15(Boolean q15) {
        this.q15 = q15;
    }

    public Boolean getQ16() {
        return q16;
    }

    public void setQ16(Boolean q16) {
        this.q16 = q16;
    }

    public Boolean getQ17() {
        return q17;
    }

    public void setQ17(Boolean q17) {
        this.q17 = q17;
    }

    public Boolean getQ18() {
        return q18;
    }

    public void setQ18(Boolean q18) {
        this.q18 = q18;
    }

    public Boolean getQ19() {
        return q19;
    }

    public void setQ19(Boolean q19) {
        this.q19 = q19;
    }

    public Boolean getQ20() {
        return q20;
    }

    public void setQ20(Boolean q20) {
        this.q20 = q20;
    }

    public Boolean getQ21() {
        return q21;
    }

    public void setQ21(Boolean q21) {
        this.q21 = q21;
    }

    public Boolean getQ22() {
        return q22;
    }

    public void setQ22(Boolean q22) {
        this.q22 = q22;
    }

    public Boolean getQ23() {
        return q23;
    }

    public void setQ23(Boolean q23) {
        this.q23 = q23;
    }

    public Boolean getQ24() {
        return q24;
    }

    public void setQ24(Boolean q24) {
        this.q24 = q24;
    }

    public Boolean getQ25() {
        return q25;
    }

    public void setQ25(Boolean q25) {
        this.q25 = q25;
    }

    public Boolean getQ26() {
        return q26;
    }

    public void setQ26(Boolean q26) {
        this.q26 = q26;
    }

    public Boolean getQ27() {
        return q27;
    }

    public void setQ27(Boolean q27) {
        this.q27 = q27;
    }

    public Boolean getQ28() {
        return q28;
    }

    public void setQ28(Boolean q28) {
        this.q28 = q28;
    }

    public Boolean getQ29() {
        return q29;
    }

    public void setQ29(Boolean q29) {
        this.q29 = q29;
    }

    public Boolean getQ30() {
        return q30;
    }

    public void setQ30(Boolean q30) {
        this.q30 = q30;
    }

    public Boolean getQ31() {
        return q31;
    }

    public void setQ31(Boolean q31) {
        this.q31 = q31;
    }

    public Boolean getQ32() {
        return q32;
    }

    public void setQ32(Boolean q32) {
        this.q32 = q32;
    }

    public Boolean getQ33() {
        return q33;
    }

    public void setQ33(Boolean q33) {
        this.q33 = q33;
    }

    public Boolean getQ34() {
        return q34;
    }

    public void setQ34(Boolean q34) {
        this.q34 = q34;
    }

    public Boolean getQ35() {
        return q35;
    }

    public void setQ35(Boolean q35) {
        this.q35 = q35;
    }

    public Boolean getQ36() {
        return q36;
    }

    public void setQ36(Boolean q36) {
        this.q36 = q36;
    }

    public Boolean getQ37() {
        return q37;
    }

    public void setQ37(Boolean q37) {
        this.q37 = q37;
    }

    public Boolean getQ38() {
        return q38;
    }

    public void setQ38(Boolean q38) {
        this.q38 = q38;
    }

    public Boolean getQ39() {
        return q39;
    }

    public void setQ39(Boolean q39) {
        this.q39 = q39;
    }

    public Boolean getQ40() {
        return q40;
    }

    public void setQ40(Boolean q40) {
        this.q40 = q40;
    }

    public Boolean getQ41() {
        return q41;
    }

    public void setQ41(Boolean q41) {
        this.q41 = q41;
    }

    public Boolean getQ42() {
        return q42;
    }

    public void setQ42(Boolean q42) {
        this.q42 = q42;
    }

    public String getComment1() {
        return comment1;
    }

    public void setComment1(String comment1) {
        this.comment1 = comment1;
    }

    public String getComment2() {
        return comment2;
    }

    public void setComment2(String comment2) {
        this.comment2 = comment2;
    }

    public String getComment3() {
        return comment3;
    }

    public void setComment3(String comment3) {
        this.comment3 = comment3;
    }

    public String getComment4() {
        return comment4;
    }

    public void setComment4(String comment4) {
        this.comment4 = comment4;
    }

    public String getComment5() {
        return comment5;
    }

    public void setComment5(String comment5) {
        this.comment5 = comment5;
    }

    public String getComment6() {
        return comment6;
    }

    public void setComment6(String comment6) {
        this.comment6 = comment6;
    }

    public String getComment7() {
        return comment7;
    }

    public void setComment7(String comment7) {
        this.comment7 = comment7;
    }
    
    public String getComment8() {
        return comment8;
    }

    public void setComment8(String comment8) {
        this.comment8 = comment8;
    }

    public String getComment9() {
        return comment9;
    }

    public void setComment9(String comment9) {
        this.comment9 = comment9;
    }

    public String getComment10() {
        return comment10;
    }

    public void setComment10(String comment10) {
        this.comment10 = comment10;
    }

    public String getComment11() {
        return comment11;
    }

    public void setComment11(String comment11) {
        this.comment11 = comment11;
    }

    public String getComment12() {
        return comment12;
    }

    public void setComment12(String comment12) {
        this.comment12 = comment12;
    }

    public String getComment13() {
        return comment13;
    }

    public void setComment13(String comment13) {
        this.comment13 = comment13;
    }

    public String getComment14() {
        return comment14;
    }

    public void setComment14(String comment14) {
        this.comment14 = comment14;
    }

    public String getComment15() {
        return comment15;
    }

    public void setComment15(String comment15) {
        this.comment15 = comment15;
    }

    public String getComment16() {
        return comment16;
    }

    public void setComment16(String comment16) {
        this.comment16 = comment16;
    }

    public String getComment17() {
        return comment17;
    }

    public void setComment17(String comment17) {
        this.comment17 = comment17;
    }

    public String getComment18() {
        return comment18;
    }

    public void setComment18(String comment18) {
        this.comment18 = comment18;
    }

    public String getComment19() {
        return comment19;
    }

    public void setComment19(String comment19) {
        this.comment19 = comment19;
    }

    public String getComment20() {
        return comment20;
    }

    public void setComment20(String comment20) {
        this.comment20 = comment20;
    }

    public String getComment21() {
        return comment21;
    }

    public void setComment21(String comment21) {
        this.comment21 = comment21;
    }

    public String getComment22() {
        return comment22;
    }

    public void setComment22(String comment22) {
        this.comment22 = comment22;
    }

    public String getComment23() {
        return comment23;
    }

    public void setComment23(String comment23) {
        this.comment23 = comment23;
    }

    public String getComment24() {
        return comment24;
    }

    public void setComment24(String comment24) {
        this.comment24 = comment24;
    }

    public String getComment25() {
        return comment25;
    }

    public void setComment25(String comment25) {
        this.comment25 = comment25;
    }

    public String getComment26() {
        return comment26;
    }

    public void setComment26(String comment26) {
        this.comment26 = comment26;
    }

    public String getComment28() {
        return comment28;
    }

    public void setComment28(String comment28) {
        this.comment28 = comment28;
    }

    public String getComment29() {
        return comment29;
    }

    public void setComment29(String comment29) {
        this.comment29 = comment29;
    }

    public String getComment30() {
        return comment30;
    }

    public void setComment30(String comment30) {
        this.comment30 = comment30;
    }

    public String getComment31() {
        return comment31;
    }

    public void setComment31(String comment31) {
        this.comment31 = comment31;
    }

    public String getComment32() {
        return comment32;
    }

    public void setComment32(String comment32) {
        this.comment32 = comment32;
    }

    public String getComment33() {
        return comment33;
    }

    public void setComment33(String comment33) {
        this.comment33 = comment33;
    }

    public String getComment34() {
        return comment34;
    }

    public void setComment34(String comment34) {
        this.comment34 = comment34;
    }

    public String getComment35() {
        return comment35;
    }

    public void setComment35(String comment35) {
        this.comment35 = comment35;
    }

    public String getComment36() {
        return comment36;
    }

    public void setComment36(String comment36) {
        this.comment36 = comment36;
    }

    public String getComment37() {
        return comment37;
    }

    public void setComment37(String comment37) {
        this.comment37 = comment37;
    }

    public String getComment38() {
        return comment38;
    }

    public void setComment38(String comment38) {
        this.comment38 = comment38;
    }

    public String getComment39() {
        return comment39;
    }

    public void setComment39(String comment39) {
        this.comment39 = comment39;
    }

    public String getComment40() {
        return comment40;
    }

    public void setComment40(String comment40) {
        this.comment40 = comment40;
    }

    public String getComment41() {
        return comment41;
    }

    public void setComment41(String comment41) {
        this.comment41 = comment41;
    }

    public String getComment42() {
        return comment42;
    }

    public void setComment42(String comment42) {
        this.comment42 = comment42;
    }
    
}
