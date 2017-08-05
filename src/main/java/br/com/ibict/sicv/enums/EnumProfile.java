package br.com.ibict.sicv.enums;

/**
 * Provide and resolve names in order to get roles or authorities
 * about users 
 * 
 * @author Wellington Stanley 
 */
public enum EnumProfile {

	ADMIN("Admin"),
    QUALITY_REVIEWER("Quality Reviewer"),
    TECHNICAL_REVIWER("Technical Reviwer"),
    USER("User");

    private String profile;

    EnumProfile(String profile) {
        this.profile = profile;
    }

    public String getProfile() {
        return this.profile;
    }
    
	/**
	 * Get a {@link EnumProfile} from string profile
	 * 
	 * @param profileText
	 *            text of profile to be retrieved a {@link EnumProfile}
	 * @return {@link EnumProfile} that match with profile Text
	 */
    public static EnumProfile getProfile(String profileText) {
        for (EnumProfile enumP : EnumProfile.values()) {
          if (enumP.profile.equalsIgnoreCase(profileText)) {
            return enumP;
          }
        }
        return null;
    }

}
