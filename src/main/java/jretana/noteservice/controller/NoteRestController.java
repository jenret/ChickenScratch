package jretana.noteservice.controller;

import jretana.noteservice.model.NoteCS;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.awt.image.BufferedImage;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/note")
public class NoteRestController {

    ///// GET
    @GetMapping(path = "/{noteUUID}")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<NoteCS> searchNote(@PathVariable(required = true) UUID noteUUID) {
        // find note in db
        // first the image from S3
        // then the object in Dynamo to retrieve comments and likes
        // frontend will handle displaying comments and likes
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping(path = "")
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<List<NoteCS>> searchAllNotes() {
        //List<UserCS> users = usersRepo.findAll();
        return new ResponseEntity<>(HttpStatus.OK);
    }

    /////// POST
    @PostMapping("")
    @ResponseStatus(HttpStatus.CREATED)
    public void createNote(@RequestBody NoteCS note) {
        note.setNoteUUID(UUID.randomUUID());
        // send the object information (no image) to dynamo
        // filename set to uuid so it can be found and matched
        BufferedImage img = note.getImageFile();
        note.setFileName(note.getNoteUUID().toString());
        // send the image to S3
    }

    /////// PUT
    @PutMapping(path = "/{noteUUID}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateNote(@PathVariable(required = true) UUID noteUUID, @RequestBody NoteCS note) {
        if (!note.getNoteUUID().equals(noteUUID)) {
            throw new RuntimeException("The two values did not match");
        }
        // send the object information (no image) to dynamo
        // filename set to uuid so it can be found and matched
        note.setFileName(note.getNoteUUID().toString());
        // send the image to S3
    }

    /////// DELETE
    @DeleteMapping(path = "/{noteUUID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteNote(@PathVariable(required = true) UUID noteUUID) {
        // find the note in dynamo
        // use uuid and grab the file with same name in S3
    }
}
