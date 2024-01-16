package com.memo.post.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data // getters와 setters를 다 가지고 있다.
public class Post {
	private int id;
	private int userId;
	private String subject;
	private String content;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
