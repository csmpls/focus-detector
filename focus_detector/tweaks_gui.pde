void setup_tweaks_gui() {

	ControlGroup enter_focus = cp5.addGroup("TO ENTER FOCUS", 15,30);
	//enter_focus.moveTo(tweak_win);
	cp5.begin(enter_focus,5,10);
	cp5.addSlider("enter_foc_num_peaks", 5, 60).linebreak();
	cp5.addSlider("enter_foc_peak_thresh", 0,100).linebreak();
	cp5.addSlider("enter_foc_time",10,120).linebreak();
	cp5.end();

	ControlGroup leave_focus = cp5.addGroup("TO LEAVE FOCUS", 240,30);
	//leave_focus.moveTo(tweak_win);
	cp5.begin(leave_focus,5,10);
	cp5.addSlider("leave_foc_num_peaks", 5, 60).linebreak();
	cp5.addSlider("leave_foc_peak_thresh", 0,100).linebreak();
	cp5.addSlider("leave_foc_time",10,120).linebreak();
	cp5.end();

	ControlGroup eeg_readings = cp5.addGroup("EEG READINGS", 15, 150);
	cp5.begin(eeg_readings,45,10);
	cp5.addSlider("med_pulse",0,100);
	cp5.addSlider("attn_pulse",0,100);
	cp5.end();


	cp5.controller("enter_foc_num_peaks").setValue(detector.enter_foc_num_peaks);
	cp5.controller("enter_foc_peak_thresh").setValue(detector.enter_foc_peak_thresh);
	cp5.controller("enter_foc_time").setValue(detector.enter_foc_time);

	cp5.controller("leave_foc_num_peaks").setValue(detector.leave_foc_num_peaks);
	cp5.controller("leave_foc_peak_thresh").setValue(detector.leave_foc_peak_thresh);
	cp5.controller("leave_foc_time").setValue(detector.leave_foc_time);
}


void update_cp5() {

  cp5.controller("med_pulse").setValue(neurosky.med_pulse);
  cp5.controller("attn_pulse").setValue(neurosky.attn_pulse);

  fill(255);
  text(detector.peaks, 450,175);

}


public void enter_foc_num_peaks(int v) { detector.enter_foc_num_peaks=v; }

public void enter_foc_peak_thresh(int v) { detector.enter_foc_peak_thresh=v; }

public void enter_foc_time(int v) { detector.enter_foc_time=v; }


public void leave_foc_num_peaks(int v) { detector.leave_foc_num_peaks=v; }

public void leave_foc_peak_thresh(int v) { detector.leave_foc_peak_thresh=v; }

public void leave_foc_time(int v) { detector.leave_foc_time=v; }

