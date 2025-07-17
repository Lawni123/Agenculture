package com.Agriculture.OBJ;

public class Message {
    private int sid;
    public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	private String sender;
    private String mail;
    private String subject;
    private String message;
    private String id;
    
    public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

   

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
