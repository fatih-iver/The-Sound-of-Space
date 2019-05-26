% read rgb image
rgb_image = imread("Hubble-Massive-Panorama.png");
% convert the rgb image to a grayscale image
grayscale_image = rgb2gray(rgb_image);
% convert the grayscale image to a binarized image
binarized_image = imbinarize(grayscale_image);
% initialize a matrix to hold sound data
sound_matrix = zeros(1000,1024);

for i = 1:1024
    for j = 1:900
        % check for a non-black cell
        if binarized_image(j, i)
            % calculate the amplitude
            amplitude = uint16(11-j/90);
            % fill the sound matrix with the amplitude
            sound_matrix(j, i) = amplitude;
        end
    end
end

% get sound vector from the sound matrix
sound_vector = sound_matrix(:);
% use inverse fourier transform to get time domain version
y = ifft(sound_vector, 'symmetric');
% set sampling frequency
Fs = 1000;
% create the sound file
audiowrite("Hubble-Massive-Panorama.wav", y, Fs);
% read the created sound file
[y,Fs] = audioread("Hubble-Massive-Panorama.wav");
% play the created sound file
sound(y, Fs);
