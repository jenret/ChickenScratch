package jretana.userservice.model;

import java.util.UUID;

public class UserProfile {

    private UUID userProfileUUID;

    private String username;

    private String displayname;

    private String bioDescription;

    private String profilePicturePath;

    private String bannerPicturePath;

    public UserProfile() {
    }

    public UserProfile(UUID userProfileUUID, String username, String displayname, String bioDescription, String profilePicturePath, String bannerPicturePath) {
        this.userProfileUUID = userProfileUUID;
        this.username = username;
        this.displayname = displayname;
        this.bioDescription = bioDescription;
        this.profilePicturePath = profilePicturePath;
        this.bannerPicturePath = bannerPicturePath;
    }

    public UUID getUserProfileUUID() {
        return userProfileUUID;
    }

    public void setUserProfileUUID(UUID userProfileUUID) {
        this.userProfileUUID = userProfileUUID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

    public String getBioDescription() {
        return bioDescription;
    }

    public void setBioDescription(String bioDescription) {
        this.bioDescription = bioDescription;
    }

    public String getProfilePicturePath() {
        return profilePicturePath;
    }

    public void setProfilePicturePath(String profilePicturePath) {
        this.profilePicturePath = profilePicturePath;
    }

    public String getBannerPicturePath() {
        return bannerPicturePath;
    }

    public void setBannerPicturePath(String bannerPicturePath) {
        this.bannerPicturePath = bannerPicturePath;
    }
}
