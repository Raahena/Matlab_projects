clc;
clear all;


img =imread('bbb.jpg');
imshow(img);

red=img(:,:,1);
green=img(:,:,2);
blue=img(:,:,3);

figure(1);
subplot(2,2,1);
imshow(img);
title('Original image');
subplot(2,2,2);
imshow(red);
title('Red plane');
subplot(2,2,3);
imshow(green);
title('Green plane');
subplot(2,2,4);
imshow(blue);
title('Blue plane');

figure(2);
level=0.57;
bw2=im2bw(blue,level);
subplot(2,2,1);
imshow(bw2);
title('Blue plane threshold');

fill=imfill(bw2,'holes');
subplot(2,2,2);
imshow(fill);
title('holes filled');

clearimg=imclearborder(fill);
subplot(2,2,3);
imshow(clearimg);
title('Remove blobs on border');
se=strel('disk',7);
open=imopen(fill,se);
subplot(2,2,4);
imshow(open);
title('Remove small blobs');


diameter=regionprops(open,'MajorAxisLength');


diameterPixels = diameter(1).MajorAxisLength;

if ~isempty(diameter)
    disp(['Measured Diameter of the object: ', num2str(diameterPixels), ' pixels']);
else
    disp('No objects detected.');
end

figure(3);
imshow(img);
d=imdistline;
