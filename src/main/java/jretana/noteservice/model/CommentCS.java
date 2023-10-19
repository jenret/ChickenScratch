package jretana.noteservice.model;

import java.util.ArrayList;
import java.util.UUID;

public class CommentCS {

    private UUID commentUUID;

    private String comment;

    private UserCS commentAuthor;

    private int likes;

    private int dislikes;

    private ArrayList<CommentCS> replies;

    public CommentCS() {
    }

    public CommentCS(UUID commentUUID, String comment, UserCS commentAuthor, int likes, int dislikes, ArrayList<CommentCS> replies) {
        this.commentUUID = commentUUID;
        this.comment = comment;
        this.commentAuthor = commentAuthor;
        this.likes = likes;
        this.dislikes = dislikes;
        this.replies = replies;
    }

    public UUID getCommentUUID() {
        return commentUUID;
    }

    public void setCommentUUID(UUID commentUUID) {
        this.commentUUID = commentUUID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public UserCS getCommentAuthor() {
        return commentAuthor;
    }

    public void setCommentAuthor(UserCS commentAuthor) {
        this.commentAuthor = commentAuthor;
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

    public ArrayList<CommentCS> getReplies() {
        return replies;
    }

    public void setReplies(ArrayList<CommentCS> replies) {
        this.replies = replies;
    }
}
