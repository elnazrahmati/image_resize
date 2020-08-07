function Output_Image = My_Imresize_BL (Input_Image, Resizing_Factor) 
    input_dimension = size(Input_Image);
    output_dimension = [floor(input_dimension(1)*Resizing_Factor), floor(input_dimension(2)*Resizing_Factor)];
    Output_Image = double(zeros(output_dimension(1), output_dimension(2), 3));
    step = 1 / Resizing_Factor;
    temp = Input_Image(:,1,:);
    Input_Image = horzcat(temp, Input_Image);
    temp = Input_Image(:,input_dimension(2),:);
    Input_Image = horzcat(Input_Image, temp);
    temp = Input_Image(1,:,:);
    Input_Image = vertcat(temp, Input_Image);
    temp = Input_Image(input_dimension(1),:,:);
    Input_Image = vertcat(Input_Image, temp);
    for i = 1 : output_dimension(1)
        for j = 1 : output_dimension(2)
            i_temp = floor(i * step)+1;
            j_temp = floor(j * step)+1;
            a = [Input_Image(i_temp, j_temp, 1),Input_Image(i_temp, j_temp, 2),Input_Image(i_temp, j_temp, 3)];
            b = [Input_Image(i_temp, j_temp+1, 1),Input_Image(i_temp, j_temp+1, 2),Input_Image(i_temp, j_temp+1, 3)];
            c = [Input_Image(i_temp+1, j_temp, 1),Input_Image(i_temp+1, j_temp, 2),Input_Image(i_temp+1, j_temp, 3)];
            d = [Input_Image(i_temp+1, j_temp+1, 1),Input_Image(i_temp+1, j_temp+1, 2),Input_Image(i_temp+1, j_temp+1, 3)];
            x = j * step - floor(j * step);
            y = i * step - floor(i * step);
            Output_Image(i, j, 1) = a(1) + (b(1) - a(1))*x + (c(1) - a(1))*y + (a(1) - b(1) - c(1) + d(1))*x*y;
            Output_Image(i, j, 2) = a(2) + (b(2) - a(2))*x + (c(2) - a(2))*y + (a(2) - b(2) - c(2) + d(2))*x*y;
            Output_Image(i, j, 3) = a(3) + (b(3) - a(3))*x + (c(3) - a(3))*y + (a(3) - b(3) - c(3) + d(3))*x*y;
        end
    end
end