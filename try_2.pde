import processing.serial.*;
import mindset.*;
import ddf.minim.*;
import controlP5.*;

ControlP5 cp5;

Minim minim;
AudioSample enter_foc_chime, leave_foc_chime;

Neurosky neurosky = new Neurosky();
String com_port = "/dev/tty.MindWave"; //on mac /dev/     on windows, COM#

Detector detector = new Detector();

color bg = color(12);

void setup() {

	size(500,200);
	//the framerate controls detector sensitivity indirectly
	//a better implementation would use separate thread for the detector.
	frameRate(20);

	//control p5 for the testing UI
	cp5 = new ControlP5(this);
	setup_tweaks_gui();

	//sounds to indicate entering and leaving focus
	minim = new Minim(this);
  	enter_foc_chime = minim.loadSample(dataPath("enter_foc_chime.wav"), 512);
  	leave_foc_chime = minim.loadSample(dataPath("leave_foc_chime.wav"), 512);

	neurosky.initialize(this,com_port,false);

	// detector runs in a separate thread
	// it samples the neurosky once every 250ms
	detector.start();

}

void draw() {

	if (detector.focus_detected())
		background(200);
	else
		background(12);

	neurosky.update();

	update_cp5();

}

// public void stop() {
// 	super.stop();
// }
