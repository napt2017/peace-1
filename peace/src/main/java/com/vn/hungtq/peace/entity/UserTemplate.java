package com.vn.hungtq.peace.entity;

import javax.persistence.*;
import java.util.Arrays;

/**
 * Created by napt2017 on 4/15/2017.
 */
@Entity
@Table(name = "user_template", schema = "peace", catalog = "")
public class UserTemplate {
    private int id;
    private String title;
    private String htmlCode;
    private byte[] image;
    private int userId;
    private Boolean isDefault;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "html_code")
    public String getHtmlCode() {
        return htmlCode;
    }

    public void setHtmlCode(String htmlCode) {
        this.htmlCode = htmlCode;
    }

    @Basic
    @Column(name = "image")
    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    @Basic
    @Column(name = "user_id")
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserTemplate that = (UserTemplate) o;

        if (id != that.id) return false;
        if (userId != that.userId) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (htmlCode != null ? !htmlCode.equals(that.htmlCode) : that.htmlCode != null) return false;
        if (!Arrays.equals(image, that.image)) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (htmlCode != null ? htmlCode.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(image);
        result = 31 * result + userId;
        return result;
    }

    @Basic
    @Column(name = "is_default")
    public Boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Boolean isDefault) {
        this.isDefault = isDefault;
    }
}
