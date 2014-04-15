package net.shopin.entity;

import javax.persistence.*;

import java.util.Date;

/**
 * 商品公告表
 * @Class Name ShopNotices
 * @Author huyy
 * @Create In 2013-7-12
 */
@Table(name = "SHOP_NOTICES")
@Entity
public class ShopNotices {
	private Integer sid;

	@Column(name = "SID")
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	private Integer noticeTypeSid;

	@Column(name = "NOTICE_TYPE_SID", insertable = false, updatable = false)
	@Basic
	public Integer getNoticeTypeSid() {
		return noticeTypeSid;
	}

	public void setNoticeTypeSid(Integer noticeTypeSid) {
		this.noticeTypeSid = noticeTypeSid;
	}

	private String title;

	@Column(name = "TITLE")
	@Basic
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String content;

	@Column(name = "CONTENT")
	@Basic
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	private Date noticesTime;

	@Column(name = "NOTICES_TIME")
	@Basic
	public Date getNoticesTime() {
		return noticesTime;
	}

	public void setNoticesTime(Date noticesTime) {
		this.noticesTime = noticesTime;
	}

	private String seq;

	@Column(name = "SEQ")
	@Basic
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	private Integer status;

	@Column(name = "STATUS")
	@Basic
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	private String link;

	@Column(name = "LINK")
	@Basic
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;

		ShopNotices that = (ShopNotices) o;

		if (noticeTypeSid != that.noticeTypeSid)
			return false;
		if (sid != that.sid)
			return false;
		if (content != null ? !content.equals(that.content)
				: that.content != null)
			return false;
		if (link != null ? !link.equals(that.link) : that.link != null)
			return false;
		if (noticesTime != null ? !noticesTime.equals(that.noticesTime)
				: that.noticesTime != null)
			return false;
		if (seq != null ? !seq.equals(that.seq) : that.seq != null)
			return false;
		if (status != null ? !status.equals(that.status) : that.status != null)
			return false;
		if (title != null ? !title.equals(that.title) : that.title != null)
			return false;

		return true;
	}

	@Override
	public int hashCode() {
		int result = sid;
		result = 31 * result
				+ (noticeTypeSid != null ? noticeTypeSid.hashCode() : 0);
		result = 31 * result + (title != null ? title.hashCode() : 0);
		result = 31 * result + (content != null ? content.hashCode() : 0);
		result = 31 * result
				+ (noticesTime != null ? noticesTime.hashCode() : 0);
		result = 31 * result + (seq != null ? seq.hashCode() : 0);
		result = 31 * result + (status != null ? status.hashCode() : 0);
		result = 31 * result + (link != null ? link.hashCode() : 0);
		return result;
	}

	@Override
	public String toString() {
		return "ShopNotices{" + "sid=" + sid + ", noticeTypeSid="
				+ noticeTypeSid + ", title=" + title + "}";
	}

	private NoticeType noticeType;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NOTICE_TYPE_SID", referencedColumnName = "SID")
	public NoticeType getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(NoticeType noticeType) {
		this.noticeType = noticeType;
	}
}
