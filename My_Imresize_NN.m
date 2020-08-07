
function Output_Image = My_Imresize_NN (Input_Image, Resizing_Factor)
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
            x_dis = i * step - floor(i * step);
            y_dis = j * step - floor(j * step);
            x = floor(i * step)+1;
            y = floor(j * step)+1;
            if (x_dis <= 0.5)&&(y_dis <= 0.5)
                Output_Image(i, j, 1) = Input_Image(x, y, 1);
                Output_Image(i, j, 2) = Input_Image(x, y, 2);
                Output_Image(i, j, 3) = Input_Image(x, y, 3);
            end
            if (x_dis < 0.5)&&(y_dis > 0.5)
                Output_Image(i, j, 1) = Input_Image(x, y+1, 1);
                Output_Image(i, j, 2) = Input_Image(x, y+1, 2);
                Output_Image(i, j, 3) = Input_Image(x, y+1, 3);
            end
            if (x_dis > 0.5)&&(y_dis < 0.5)
                Output_Image(i, j, 1) = Input_Image(x+1, y, 1);
                Output_Image(i, j, 2) = Input_Image(x+1, y, 2);
                Output_Image(i, j, 3) = Input_Image(x+1, y, 3);
            end
            if (x_dis > 0.5)&&(y_dis > 0.5)
                Output_Image(i, j, 1) = Input_Image(x+1, y+1, 1);
                Output_Image(i, j, 2) = Input_Image(x+1, y+1, 2);
                Output_Image(i, j, 3) = Input_Image(x+1, y+1, 3);
            end
        end
    end
end