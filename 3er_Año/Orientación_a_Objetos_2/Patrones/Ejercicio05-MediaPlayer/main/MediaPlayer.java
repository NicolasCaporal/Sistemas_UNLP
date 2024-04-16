package ar.edu.info.unlp.ejercicio05;

public class MediaPlayer {
	private Media media;

	public MediaPlayer(Media media){
		this.media = media;
	}

	public String playMedia(){
		return media.play();
	}

	public void setMedia(Media media){
		this.media = media;
	}

	public Media getMedia(){
		return this.media;
	}
}
