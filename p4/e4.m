interpol_near = iradon(sinogram,theta2,'nearest','Ram-Lak',256);
interpol_lin = iradon(sinogram,theta2,'linear','Ram-Lak',256);
interpol_spl = iradon(sinogram,theta2,'spline','Ram-Lak',256);
interpol_pch = iradon(sinogram,theta2,'pchip','Ram-Lak',256);
interpol_cub = iradon(sinogram,theta2,'cubic','Ram-Lak',256);
interpol_v5cu = iradon(sinogram,theta2,'v5cubic','Ram-Lak',256);
SSQ_interpolation_difference = zeros(6,1);
for i = 1:256
    for  j = 1:256
       SSQ_interpolation_difference(1,1) = SSQ_interpolation_difference(1,1)+ (image_rotation2(i,j) - interpol_near(i,j))^2;
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_interpolation_difference(2,1) = SSQ_interpolation_difference(2,1)+ (image_rotation2(i,j) - interpol_lin(i,j))^2;
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_interpolation_difference(3,1) = SSQ_interpolation_difference(3,1)+ (image_rotation2(i,j) - interpol_spl(i,j))^2; 
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_interpolation_difference(4,1) = SSQ_interpolation_difference(4,1)+ (image_rotation2(i,j) - interpol_pch(i,j))^2; 
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_interpolation_difference(5,1) = SSQ_interpolation_difference(5,1)+ (image_rotation2(i,j) - interpol_cub(i,j))^2;
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_interpolation_difference(6,1) = SSQ_interpolation_difference(6,1)+ (image_rotation2(i,j) - interpol_v5cu(i,j))^2; 
    end
end