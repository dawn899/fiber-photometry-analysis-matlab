Fiber Photometry Analysis of Feeding Onsets
This repository contains MATLAB code for aligning calcium signals to feeding onset events during an ad libitum feeding session. The demo come from one mouse recorded over a defined time interval.

Required inputs
1. Photometry data: Two columns containing recording time and the corresponding z-scored calcium signal.
2. Feeding onset times (eat_start): The time point at which each feeding bout begins.
The recording times and eat_start values must use the same time reference and units.

What the code does?
For each eat_start time point within the selected recording interval, the code extracts the calcium signal before and after feeding onset. It then combines the aligned segments from all feeding onset events in that interval for further analysis or visualization.

How to use?
Prepare the photometry data (time_Zscore) and the eating_start time points.
Load both inputs in MATLAB and set the analysis interval and the time window around feeding onset in the code.
Run the analysis code to obtain the combined feeding-aligned calcium signals.
