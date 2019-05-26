rgb_image = imread("Hubble-Massive-Panorama.png");
grayscale_image = rgb2gray(rgb_image);
binarized_image = imbinarize(grayscale_image);
imshow(grayscale_image)
