package com.test.web.entity;

/*entity定义参数,@DateTimeFormat 定义的是时间对象格式,Date类型需要*/
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Baoxiu {
    private String id;

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date time;

    private String type;

    private String name;

    private String phone;
//    
//    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date exceptedTime;

    private String location;

    private String url;

    private String state;

    private String delFlag;
    
    private String address;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getExceptedTime() {
        return exceptedTime;
    }

    public void setExceptedTime(Date exceptedTime) {
        this.exceptedTime = exceptedTime;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag == null ? null : delFlag.trim();
    }

	@Override
	public String toString() {
		return "Baoxiu [id=" + id + ", time=" + time + ", type=" + type + ", name=" + name + ", phone=" + phone
				+ ", exceptedTime=" + exceptedTime + ", location=" + location + ", url=" + url + ", state=" + state
				+ ", delFlag=" + delFlag + ", address=" + address + "]";
	}
    
}