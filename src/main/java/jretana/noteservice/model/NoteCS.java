package jretana.noteservice.model;

import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.UUID;

public class NoteCS {

    private UUID noteUUID;

    private String fileName;

    private BufferedImage imageFile;

    private UserCS noteAuthor;

    private int likes;

    private int dislikes;

    private ArrayList<CommentCS> comments;

    public NoteCS() {
    }

    public NoteCS(UUID noteUUID, String fileName, UserCS noteAuthor, int likes, int dislikes, ArrayList<CommentCS> comments) {
        this.noteUUID = noteUUID;
        this.fileName = fileName;
        this.noteAuthor = noteAuthor;
        this.likes = likes;
        this.dislikes = dislikes;
        this.comments = comments;
    }

    public NoteCS(UUID noteUUID, String fileName, BufferedImage imageFile, UserCS noteAuthor, int likes, int dislikes, ArrayList<CommentCS> comments) {
        this.noteUUID = noteUUID;
        this.fileName = fileName;
        this.imageFile = imageFile;
        this.noteAuthor = noteAuthor;
        this.likes = likes;
        this.dislikes = dislikes;
        this.comments = comments;
    }

    public UUID getNoteUUID() {
        return noteUUID;
    }

    public void setNoteUUID(UUID noteUUID) {
        this.noteUUID = noteUUID;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public BufferedImage getImageFile() {
        return imageFile;
    }

    public void setImageFile(BufferedImage imageFile) {
        this.imageFile = imageFile;
    }

    public UserCS getNoteAuthor() {
        return noteAuthor;
    }

    public void setNoteAuthor(UserCS noteAuthor) {
        this.noteAuthor = noteAuthor;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getDislikes() {
        return dislikes;
    }

    public void setDislikes(int dislikes) {
        this.dislikes = dislikes;
    }

    public ArrayList<CommentCS> getComments() {
        return comments;
    }

    public void setComments(ArrayList<CommentCS> comments) {
        this.comments = comments;
    }
}
