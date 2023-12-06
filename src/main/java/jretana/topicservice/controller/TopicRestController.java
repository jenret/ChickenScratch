package jretana.topicservice.controller;
import com.amazonaws.services.dynamodbv2.document.Item;
import com.amazonaws.services.dynamodbv2.document.Table;
import jretana.topicservice.config.DynamoDBConfig;
import jretana.topicservice.model.TopicCS;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/topic")
public class TopicRestController {

    DynamoDBConfig dynamoDBConfig = new DynamoDBConfig();

    ///// GET
    @GetMapping(path = "/{topicUUID}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<TopicCS> searchTopic(@PathVariable(required = true) UUID topicUUID) {
        // find topic in db
        Table topicsTable = dynamoDBConfig.getDynamoDBTable("Topics");
        Item topic = topicsTable.getItem("TopicUUID", topicUUID.toString());
        TopicCS topicCS = new TopicCS();
        topicCS.setTopicUUID(UUID.fromString(topic.getString("TopicUUID")));
        topicCS.setTopicName(topic.getString("TopicName"));
        return new ResponseEntity<TopicCS>(topicCS, HttpStatus.OK);
    }

    @GetMapping(path = "")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<TopicCS>> searchAllTopics() {
        //make list for topics to send
        List<TopicCS> topicCSList = new ArrayList<>();
        //get table in db
        Table topicsTable = dynamoDBConfig.getDynamoDBTable("Topics");
        //populate list
        
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /////// POST
    @PostMapping("")
    @ResponseStatus(HttpStatus.CREATED)
    public void createTopic(@RequestBody TopicCS topic) {
        topic.setTopicUUID(UUID.randomUUID());
        //usersRepo.save(user);
    }

    /////// PUT
    @PutMapping(path = "/{topicUUID}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateTopic(@PathVariable(required = true) UUID topicUUID, @RequestBody TopicCS topic) {
        if (!topic.getTopicUUID().equals(topicUUID)) {
            throw new RuntimeException("The two values did not match");
        }

        //usersRepo.save(user);
    }

    /////// DELETE
    @DeleteMapping(path = "/{topicUUID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteTopic(@PathVariable(required = true) UUID topicUUID) {

        //usersRepo.deleteById(userUUID);
    }
}
