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

Exercise 2
theta2=0:1:180;
Back_projection = iradon(im2double(sinogram),theta2,'linear','none',256);
figure(4), imshow(Back_projection);
for theta3 = 0:step:270
    radian = (theta3*pi)/180;
    image_rotation2 = rotate(image_convert,radian);
end
ssq_back_projection=0;
for i=1:256
    for j=1:256   ssq_back_projection=ssq_back_projection+(image_rotation2(i,j)-Back_projection(i,j))^2;
    end
end