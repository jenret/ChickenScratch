package jretana.topicservice.controller;

import jretana.topicservice.config.DynamoDBConfig;
import jretana.topicservice.config.S3Config;
import jretana.topicservice.model.UserCS;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.http.HttpClient;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/topic/admin")
public class AdminRestController {

    ///// GET
    @GetMapping(path = "/{topicUUID}/{userUUID}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<UserCS>> searchAllAdmins(@PathVariable(required = true) UUID topicUUID, @PathVariable(required = true) UUID userUUID) {
        // call get topic by id
        //TopicCS topic = return from request
        HttpClient client = HttpClient.newHttpClient();
//        HttpRequest request = HttpRequest.newBuilder()
//                .uri(new URI("http://idk/topic/" + topicUUID))
//                .GET()
//                .build();
        // our topic object will have the list of admins
        // first check if this user is an admin
        boolean userIsAdmin = false;

//        for (UserCS user: topiclist) {
//            if (user.getUserUUID() == userUUID) {
//                userIsAdmin = true;
//            }
//        }

        if (userIsAdmin) {
            // return our list of admins
            return new ResponseEntity<>(HttpStatus.OK);
        }
        else {
            // if not return unauthorized error
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
    }

    @GetMapping(path="/testAWSConnections")
    public String checkConnections() {
        S3Config s3Config = new S3Config();
        DynamoDBConfig dynamoDBConfig = new DynamoDBConfig();

        s3Config.getS3Client();
        dynamoDBConfig.getDynamoDBClient();

        return "Your moms AWS connection holes work a ha ha";
    }
}
