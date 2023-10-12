package jretana.topicservice.controller;
import jretana.topicservice.model.TopicCS;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/topic")
public class TopicRestController {

    ///// GET
    @GetMapping(path = "/{topicUUID}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<TopicCS> searchTopic(@PathVariable(required = true) UUID topicUUID) {
        // find topic in db
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping(path = "")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<TopicCS>> searchAllTopics() {
        //List<UserCS> users = usersRepo.findAll();
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
