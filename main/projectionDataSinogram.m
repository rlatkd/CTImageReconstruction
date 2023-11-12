img_original = imread('0429.jpg');    
image = imresize(img_original,[256,256]);  
image = rgb2gray(image);                
image_convert = im2double(image);               
figure(1), imshow(image_convert);
step=1;
sinogram = [];                                  
for theta = 0:step:180
    radian = (theta*pi)/180;
    image_rotation = rotate(image_convert,radian);
    projection_data = sum(image_rotation,2);
    sinogram = uint8([projection_data sinogram]);
end
figure(2), imshow(image_rotation);
figure(3), imshow(sinogram);