package db_func;

public class PostDTO {
	private String postNum;
	private String postTitle;
	private String postContent;
	private String postWriter;
	private String postDate;
	private String postViewCount;
	
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getPostViewCount() {
		return postViewCount;
	}
	public void setPostViewCount(String postViewCount) {
		this.postViewCount = postViewCount;
	}
}
