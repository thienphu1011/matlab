
function [img_sub, img_avg] = lab2_part2(S_list)
    if nargin < 1
        S_list = [2, 5];    
    end

    
    member1 = 'Thien Phu';
    member2 = 'Dinh Hieu';
    names_tag = sprintf('(%s, %s)', member1, member2);

    
    img_gray = rgb2gray(imread('DailyShow.jpg'));
    [N, M] = size(img_gray);

  
    figure('Name', 'Lab 2 - Part 4.2: Spatial Scaling (S = 2 & S = 5)', ...
           'Color', 'w', 'WindowState', 'maximized');

   
    W0 = 0.30;
    H0 = 0.56;
    Y0 = 0.22;

    
    axes('Position', [0.05, Y0, W0, H0]);
    imshow(img_gray);
    axis on;
    add_caption(sprintf('Original gray (%dx%d)', N, M), names_tag);

    
    numS = length(S_list);
    for k = 1:numS
        S = S_list(k);
        [img_sub, img_avg] = scale_by_factor(img_gray, S);
        [newN, newM] = size(img_sub);

        Ws = W0 / S;
        Hs = H0 / S;

      
        if numS == 1
            Ys = Y0 + (H0 - Hs) / 2;            
        elseif numS == 2
            if k == 1
                Ys = (Y0 + H0) - Hs;           
            else
                Ys = Y0;                        
            end
        else
            y_centers = linspace(Y0 + H0 - Hs/2, Y0 + Hs/2, numS);
            Ys = y_centers(k) - Hs / 2;
        end

       
        axes('Position', [0.54 - Ws/2, Ys, Ws, Hs]);
        imshow(img_sub);
        axis on;
        add_caption(sprintf('Simple scaling S=%d (%dx%d)', S, newN, newM), names_tag);

       
        axes('Position', [0.82 - Ws/2, Ys, Ws, Hs]);
        imshow(img_avg);
        axis on;
        add_caption(sprintf('Average scaling S=%d (%dx%d)', S, newN, newM), names_tag);
    end
end


function [img_sub, img_avg] = scale_by_factor(img_gray, S)
    [N, M] = size(img_gray);
    newN = floor(N / S);
    newM = floor(M / S);

    img_sub = zeros(newN, newM, 'uint8');
    img_avg = zeros(newN, newM, 'uint8');

    offset = ceil(S / 2);

    for i = 1:newN
        r_start = (i - 1) * S + 1;
        r_end   = i * S;
        for j = 1:newM
            c_start = (j - 1) * S + 1;
            c_end   = j * S;

            block = img_gray(r_start:r_end, c_start:c_end);
          
            img_sub(i, j) = block(offset, offset);
          
            img_avg(i, j) = uint8(round(mean(double(block(:)))));
        end
    end
end


function add_caption(txt, names_tag)
    h = xlabel({txt, names_tag}, 'FontSize', 10, 'FontAngle', 'italic', 'Color', 'k');
    set(h, 'Visible', 'on');
end