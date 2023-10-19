package jretana.noteservice.model;

import java.util.ArrayList;
import java.util.UUID;

public class TopicCS {

    private UUID topicUUID;

    private String topicName;

    private ArrayList<UserCS> topicAdmins;

    public TopicCS() {
    }

    public TopicCS(UUID topicUUID, String topicName, ArrayList<UserCS> topicAdmins) {
        this.topicUUID = topicUUID;
        this.topicName = topicName;
        this.topicAdmins = topicAdmins;
    }

    public UUID getTopicUUID() {
        return topicUUID;
    }

    public void setTopicUUID(UUID topicUUID) {
        this.topicUUID = topicUUID;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public ArrayList<UserCS> getTopicAdmins() {
        return topicAdmins;
    }

    public void setTopicAdmins(ArrayList<UserCS> topicAdmins) {
        this.topicAdmins = topicAdmins;
    }
}
