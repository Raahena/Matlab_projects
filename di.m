rgb = imread("im.jpeg");
imshow(rgb);
d = drawline;
pos = d.Position;
diffPos = diff(pos);
diameter = hypot(diffPos(1),diffPos(2));
imshow(rgb)
h = viscircles(centers,radii);
gray_image = im2gray(rgb);
imshow(gray_image);
[centers,radii] = imfindcircles(rgb,[20 25],ObjectPolarity="dark",Sensitivity=0.9);