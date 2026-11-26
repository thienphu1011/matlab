
function out = lab2_expand(filename)
    if nargin < 1
        filename = 'DailyShow.jpg';
    end

    
    member1 = 'Thien Phu';
    member2 = 'Dinh Hieu';
    names_tag = sprintf('(%s, %s)', member1, member2);

    img = rgb2gray(imread(filename));
    [N, M, C] = size(img);

    img_d = double(img);
    out_d = zeros(2 * N, 2 * M, C);

    for ch = 1:C
        X = img_d(:, :, ch);
        Y = zeros(2 * N, 2 * M);

        
        Y(1:2:2*N-1, 1:2:2*M-1) = X;

        
        Y(1:2:2*N-1, 2:2:2*M-2) = (X(:, 1:M-1) + X(:, 2:M)) / 2;

        
        Y(2:2:2*N-2, 1:2:2*M-1) = (X(1:N-1, :) + X(2:N, :)) / 2;

       
        Y(2:2:2*N-2, 2:2:2*M-2) = (X(1:N-1, 1:M-1) + X(1:N-1, 2:M) + ...
                                   X(2:N,   1:M-1) + X(2:N,   2:M)) / 4;

        
        Y(:, 2*M) = Y(:, 2*M - 1);
        Y(2*N, :) = Y(2*N - 1, :);

        out_d(:, :, ch) = Y;
    end

    out = uint8(round(out_d));

   
    figure('Name', 'Lab 2 - Part 4.4', 'Color', 'w', 'WindowState', 'maximized');

   
    axes('Position', [0.06, 0.31, 0.25, 0.38]);
    imshow(img);
    axis on; 
    add_caption(sprintf('Original image (%dx%d)', N, M), names_tag);

   
    axes('Position', [0.39, 0.12, 0.50, 0.76]);
    imshow(out);
    axis on; 
    add_caption(sprintf('Bilinear interpolation 2x (%dx%d)', 2*N, 2*M), names_tag);
end

function add_caption(txt, names_tag)
    full_txt = sprintf('%s %s', txt, names_tag);
    h = xlabel(full_txt, 'FontSize', 10, 'FontAngle', 'italic', 'Color', 'k');
    set(h, 'Visible', 'on');
end