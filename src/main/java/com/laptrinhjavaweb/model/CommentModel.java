package com.laptrinhjavaweb.model;

public class CommentModel extends AbstractModel<CommentModel> {
	private String content;
	private Long userId;
	private Long newId;
	private String titleNew;
	private int[] count = new int[2];
	private String userComment;
	private String roleUser;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getNewId() {
		return newId;
	}
	public void setNewId(Long newId) {
		this.newId = newId;
	}
	public String getTitleNew() {
		return titleNew;
	}
	public void setTitleNew(String titleNew) {
		this.titleNew = titleNew;
	}
	public int[] getCount() {
		return count;
	}
	public void setCount(int totalItemNew, int totalUserNew) {
		this.count[0]=totalItemNew;
		this.count[1]=totalUserNew;
	}
	public String getUserComment() {
		return userComment;
	}
	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}
	public String getRoleUser() {
		return roleUser;
	}
	public void setRoleUser(String roleUser) {
		this.roleUser = roleUser;
	}
}
