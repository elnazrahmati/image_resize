function Output_Image = My_Imresize (Input_Image, Resizing_Factor) 
    input_dimension = size(Input_Image);
    output_dimension = [floor(input_dimension(1)*Resizing_Factor), floor(input_dimension(2)*Resizing_Factor)];
    Output_Image = double(zeros(output_dimension(1), output_dimension(2)));
    step = 1/Resizing_Factor;
    
    for i = 0 : output_dimension(1)-2
        for j = 0 : output_dimension(2)-2
            i_temp = floor(i * step)+1;
            j_temp = floor(j * step)+1;
            if (i * step == floor(i * step)) && (j * step == floor(j * step))
                Output_Image(i+1, j+1) = Input_Image(i_temp, j_temp);
            elseif i * step == floor(i * step)
                a = Input_Image(i_temp, j_temp);
                b = Input_Image(i_temp, j_temp+1);
                Output_Image(i+1, j+1) = (a+b)/2;
            elseif j * step == floor(j * step)
                a = Input_Image(i_temp, j_temp);
                c = Input_Image(i_temp+1, j_temp);
                Output_Image(i+1, j+1) = (a+c)/2;
            else
                a = Input_Image(i_temp, j_temp);
                b = Input_Image(i_temp, j_temp+1);
                c = Input_Image(i_temp+1, j_temp);
                d = Input_Image(i_temp+1, j_temp+1);
                Output_Image(i+1, j+1) = (a+b+c+d)/4;
            end
            Output_Image(:,256) = Output_Image(:,255);
            Output_Image(256,:) = Output_Image(255,:);
            Output_Image(256,256) = Output_Image(255,255);
        end
    end
end