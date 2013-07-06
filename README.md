focus-detector
==============

A stupid-simple system for detecting when a user is engrossed in work using Neurosky EEG.

## Explanation
In the context of a larger, multi-user TCP/IP project, a module was needed to detect when a user was focusing on work in larger-than-normal timescales (over 1 minute). The "right" way to implement this would be to employ supervised learning algorithms, most likely support vector machines, that use clustering to assign labels ("engrossed," "not engrossed") to EEG readings.

This system is not the right way to implement this functionality. Instead, it is a very quick and fairly accurate implementation that leverages the short-timescale machine learning metrics built in to the Neurosky serial interface. 

## Method 
The system runs a detector in a separate thread. The thread runs 4 times per second. Every time it runs, it 

- Checks to see if the user's attention e-sense score is over a threshold value
- If it is, it gives the user a point.
- If the number of points are over a threshold value, the user switches modes.

The two modes are "focus mode" and "not focus mode." To enter focus mode, the user must consistently get attention e-sense scores *over* a certain peak. To leave focus mode, the user must consistently score *under* a certain peak.

The score "decays" after a given interval. 

These values were decided upon chiefly by trial-and-error. This project is concerned with (1) assuring that users do not change states more than once per minute, on average and (2) minimizing false negatives for focus detection control. As of the current implementation, minimizing false positives are not a priority.

## Tweaking

The sensitivity of the focus detector can be tweaked through a UI in the running application.

* ENTER_FOC_NUM_PEAKS: This value states how many "peaks" must be detected in order for the user to enter focus mode.

* ENTER_FOC_PEAK_THRESHOLD: What Neurosky attention reading will the application consider the cutoff for a "peak"?

* ENTER_FOC_TIME: An interval for detecting peaks. 

So, for example: if NUM_PEAKS is set to 40, PEAK_THRESHOLD set to 67 and FOC_TIME set to 45, the user must get 40 scores of 67 or over within 45 seconds in order for focus to be detected.

There are analogous scores for LEAVE_FOC mode - here, the user must score *below* LEAVE_FOC_PEAK_THRESHOLD in order to count as a "peak."

All these settings can be altered persistently at the top of Detector.pde. 