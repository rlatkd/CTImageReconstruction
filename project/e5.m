img_original = imread('0429.jpg');    
image = imresize(img_original,[256,256]);  
image = rgb2gray(image);                
image_convert = im2double(image);               
sinogram = [];                                 
step = 1;
for theta = 0:step:180
            radian = (theta*pi)/180;
            image_rotation = rotate(image_convert,radian);
            projection_data = sum(image_rotation,2);
            sinogram = uint8([projection_data sinogram]);
end
theta2=0:step:180;
[filtered_Back_projection_Ram_Lak1,H1] = iradon(sinogram,theta2,'spline','Ram-Lak',256);
figure(), imshow(filtered_Back_projection_Ram_Lak1);


// rotate
function [ rotate_image ] = rotate( original_image, radian )
 [x0,y0] = size(original_image);
rotate_image = [];
for i=1:x0
    for j=1:y0
        xn = (i-x0/2)*cos(radian) - (j-y0/2)*sin(radian) +x0/2;
        yn = (i-x0/2)*sin(radian) + (j-y0/2)*cos(radian) +y0/2;
        
        if(xn<1 || yn<1 || xn>x0-1 || yn>y0-1)
            rotate_image(j,i) = 0;
        else
            p=floor(xn);
            q=floor(yn);
            a=xn-p;
            b=yn-q;
            rotate_image(j,i)=(1-b)*((1-a)*original_image(q,p)+a*original_image(q,p+1))+b*((1-a)*original_image(q+1,p)+a*original_image(q+1,p+1));
        end
    end
end


// angle
clear all; 
close all;
 img_original = imread('111.jpg');    
image = imresize(img_original,[256,256]);  
image = rgb2gray(image);                
image_convert = im2double(image);               
  sinogram = [];                                 
step = 15;
for theta = 0:step:180
            radian = (theta*pi)/180;
            image_rotation = rotate(image_convert,radian);
            projection_data = sum(image_rotation,2);
            sinogram = uint8([projection_data sinogram]);
end
theta2=0:step:180;
 [filtered_Back_projection_Hann,H1] = iradon(sinogram,theta2,'spline','Hann',256);
figure(16), imshow(filtered_Back_projection_Hann)