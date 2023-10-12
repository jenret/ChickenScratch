package jretana.userservice.controller;

import jretana.userservice.model.UserCS;
import jretana.userservice.model.UserProfile;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/user")
public class UserRestController {

    ///// GET
    @GetMapping(path = "/{userUUID}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<UserCS> searchUser(@PathVariable(required = true)UUID userUUID) {
        // find user in db
        //UserCS user =
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping(path = "/profile/{userProfileUUID}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<UserProfile> searchUserProfile(@PathVariable(required = true)UUID userProfileUUID) {
        // find the user profile in db
        // find the images needed in S3
        // banner and profile
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /// ONLY FOR TESTING
    @GetMapping(path = "")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<UserCS>> searchUser() {
        //List<UserCS> users = usersRepo.findAll();
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /////// POST
    @PostMapping("")
    @ResponseStatus(HttpStatus.CREATED)
    public void createUser(@RequestBody UserCS user) {
        user.setUserUUID(UUID.randomUUID());
        //usersRepo.save(user);
    }

    @PostMapping("/profile")
    @ResponseStatus(HttpStatus.CREATED)
    public void createUserProfile(@RequestBody UserProfile userProfile) {
        userProfile.setUserProfileUUID(UUID.randomUUID());
        //usersRepo.save(user);
    }

    /////// PUT
    @PutMapping(path = "/{userUUID}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateUser(@PathVariable(required = true) UUID userUUID, @RequestBody UserCS user) {
        if (!user.getUserUUID().equals(userUUID)) {
            throw new RuntimeException("The two values did not match");
        }

        //usersRepo.save(user);
    }

    @PutMapping(path = "/profile/{userProfileUUID}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateUserProfile(@PathVariable(required = true) UUID userProfileUUID, @RequestBody UserProfile userProfile) {
        if (!userProfile.getUserProfileUUID().equals(userProfileUUID)) {
            throw new RuntimeException("The two values did not match");
        }

        //usersRepo.save(user);
    }

    /////// DELETE
    @DeleteMapping(path = "/{userUUID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteUser(@PathVariable(required = true) UUID userUUID) {

        //usersRepo.deleteById(userUUID);
    }

    @DeleteMapping(path = "/profile/{userProfileUUID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteUserProfile(@PathVariable(required = true) UUID userProfileUUID) {
        // make sure to check that user has been deleted first and then delete
        //usersRepo.deleteById(userUUID);
    }
}
