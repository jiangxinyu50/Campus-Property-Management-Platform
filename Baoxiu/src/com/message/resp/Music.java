package com.message.resp;

/** 
 * 音乐model 
 *  
 */  
public class Music {  
    // 专辑名称  
    private String albumName;  
    // 音乐图片  
    private String albumPic;  
    // 音乐ID  
    private String songId;
    //音乐名称
    private String songName;
    // 高质量音乐链接，WIFI环境优先使用该链接播放音乐  
    private String songUrl;  
    //演唱者
    private String userName ="";
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getAlbumPic() {
		return albumPic;
	}
	public void setAlbumPic(String albumPic) {
		this.albumPic = albumPic;
	}
	public String getSongId() {
		return songId;
	}
	public void setSongId(String songId) {
		this.songId = songId;
	}
	public String getSongName() {
		return songName;
	}
	public void setSongName(String songName) {
		this.songName = songName;
	}
	public String getSongUrl() {
		return songUrl;
	}
	public void setSongUrl(String songUrl) {
		this.songUrl = songUrl;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
    
     
}  

