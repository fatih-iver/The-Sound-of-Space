% read the sound file
[y,Fs] = audioread("PinkPanther30.wav");


% get number of peaks after applying lowpass filter
n1 = numel(findpeaks(lowpass(y,1000,Fs)));
n2 = numel(findpeaks(lowpass(y,2000,Fs)));
n3 = numel(findpeaks(lowpass(y,3000,Fs)));
n4 = numel(findpeaks(lowpass(y,4000,Fs)));

% plot number of peaks versus cut-off frequencies
plot([1000 2000 3000 4000], [n1 n2 n3 n4]);

% name x axis & y axis accordingly
xlabel('Cut-Off Frequencies'); 
ylabel('Number of Peaks'); 



