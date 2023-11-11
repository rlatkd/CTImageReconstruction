SSQ_filter_difference = zeros(5,1);
for i = 1:256
    for  j = 1:256
       SSQ_filter_difference(1,1) = SSQ_filter_difference(1,1)+ (image_rotation2(i,j) - filtered_Back_projection_Ram_Lak(i,j))^2;
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_filter_difference(2,1) = SSQ_filter_difference(2,1)+ (image_rotation2(i,j) - filtered_Back_projection_Shepp_Logan(i,j))^2;
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_filter_difference(3,1) = SSQ_filter_difference(3,1)+ (image_rotation2(i,j) - filtered_Back_projection_Hamming(i,j))^2; 
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_filter_difference(4,1) = SSQ_filter_difference(4,1)+ (image_rotation2(i,j) - filtered_Back_projection_Hann(i,j))^2; 
    end
end
for i = 1:256
    for  j = 1:256
       SSQ_filter_difference(5,1) = SSQ_filter_difference(5,1)+ (image_rotation2(i,j) - filtered_Back_projection_Cosine(i,j))^2; 
    end
end