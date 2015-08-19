package com.qaproject.entity;

import javax.persistence.*;

/**
 * Created by khangtnse60992 on 5/30/2015.
 */
@Entity
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id")
    private Integer id;
    @Column(name = "ObjectId")
    private Integer objectId;
    @Column(name = "NotificationType")
    private Integer notificationType;
    @Column(name = "IsViewed")
    private Integer isViewed;
    @JoinColumn(name = "SenderId", referencedColumnName = "Id")
    @ManyToOne
    private User senderId;
    @JoinColumn(name = "ReceiverId", referencedColumnName = "Id")
    @ManyToOne
    private User receiverId;

    public Notification() {
    }

    public Notification(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getObjectId() {
        return objectId;
    }

    public void setObjectId(Integer objectId) {
        this.objectId = objectId;
    }

    public Integer getNotificationType() {
        return notificationType;
    }

    public void setNotificationType(Integer notificationType) {
        this.notificationType = notificationType;
    }

    public Integer getIsViewed() {
        return isViewed;
    }

    public void setIsViewed(Integer isViewed) {
        this.isViewed = isViewed;
    }

    public User getSenderId() {
        return senderId;
    }

    public void setSenderId(User senderId) {
        this.senderId = senderId;
    }

    public User getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(User receiverId) {
        this.receiverId = receiverId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Notification)) {
            return false;
        }
        Notification other = (Notification) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.qaproject.entity.Notification[ id=" + id + " ]";
    }

}
