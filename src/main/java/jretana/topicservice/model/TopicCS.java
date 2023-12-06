package jretana.topicservice.model;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class TopicCS {

    private UUID topicUUID;

    private String topicName;

    private List<UserCS> topicAdmins = new ArrayList<>();

    public TopicCS() {
    }

    public TopicCS(UUID topicUUID, String topicName, List<UserCS> topicAdmins) {
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

    public List<UserCS> getTopicAdmins() {
        return topicAdmins;
    }

    public void setTopicAdmins(List<UserCS> topicAdmins) {
        this.topicAdmins = topicAdmins;
    }
}
