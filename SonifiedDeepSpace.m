rgb_image = imread("Hubble-Massive-Panorama.png");
grayscale_image = rgb2gray(rgb_image);
binarized_image = imbinarize(grayscale_image);

sound_matrix = zeros(900,1024);

for i = 1:1024
    for j = 1:900
        if binarized_image(j, i)
            amplitude = uint16(11-j/90);
            sound_matrix(j, i) = amplitude;
        end
    end
end

sound_vector = sound_matrix(:);
inverse_transform = ifft(sound_vector, 'symmetric');
sound(inverse_transform, 1800);
