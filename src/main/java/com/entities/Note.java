package com.entities;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="NOTES")
public class Note
{
	@Id
	@GeneratedValue
	@Column(name="NOTE_ID")
	private int id;
	
	@Column(name="NOTE_TITLE")
	private String title;
	
	@Column(name="NOTE_CONTENT")
	private String content;
	
	@Column(name="NOTE_ADDED_ON")
	private Date addedOn;
	
	// GETTERS AND SETTERS
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public Date getAddedOn()
	{
		return addedOn;
	}
	public void setAddedOn(Date addedOn)
	{
		this.addedOn = addedOn;
	}
	
	// CONSTRUCTORS
	public Note()
	{
		super();
		// TODO Auto-generated constructor stub
	}
	public Note(String title, String content, Date addedOn)
	{
		super();
		this.title = title;
		this.content = content;
		this.addedOn = addedOn;
	}
	@Override
	public String toString()
	{
		return "Note [id=" + id + ", title=" + title + ", content=" + content + ", addedOn=" + addedOn + "]";
	}	
	
	
}
