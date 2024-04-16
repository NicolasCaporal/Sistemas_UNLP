package ar.edu.info.unlp.ejercicio05;

public class VideoStreamAdapter implements Media {
    private VideoStream adaptee;

    public VideoStreamAdapter(VideoStream adaptee){
        this.adaptee = adaptee;
    }

    @Override
    public String play() {
        return adaptee.reproduce();
    }

    public void setVideoStream(VideoStream videoStream) {
        this.adaptee = videoStream;
    }
}
