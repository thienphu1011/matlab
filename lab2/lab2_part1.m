
function lab2_part1(filename)
    if nargin < 1
        filename = 'DailyShow.jpg';
    end

   
    member1 = 'Thien Phu';
    member2 = 'Dinh Hieu';
    names_tag = sprintf('(%s, %s)', member1, member2);

   
    img_rgb  = imread(filename);
    img_gray = rgb2gray(img_rgb);
    [N, M]   = size(img_gray);
    fprintf('Grayscale image dimensions: %d x %d\n', N, M);

 
    h1 = [-1 0 1; -2 0 2; -1 0 1];
    h2 = [ 1 2 1;  0 0 0; -1 -2 -1];

    img_d = double(img_gray);
    M1 = conv2(img_d, h1, 'same');
    M2 = conv2(img_d, h2, 'same');

    col_grad = uint8(abs(M1));
    row_grad = uint8(abs(M2));
    edge_det = uint8(sqrt(M1.^2 + M2.^2));
    edge_inv = 255 - edge_det;

   
    figure('Name', 'Lab 2 - Part 4.1', 'Color', 'w', 'WindowState', 'maximized');

    subplot(2, 3, 1);
    imshow(img_rgb);
    add_caption('Original image', names_tag);

    subplot(2, 3, 2);
    imshow(img_gray);
    add_caption('Gray image', names_tag);

    subplot(2, 3, 3);
    imshow(col_grad);
    add_caption('Column gradient result', names_tag);

    subplot(2, 3, 4);
    imshow(row_grad);
    add_caption('Row gradient result', names_tag);

    subplot(2, 3, 5);
    imshow(edge_det);
    add_caption('Edge detection', names_tag);

    subplot(2, 3, 6);
    imshow(edge_inv);
    add_caption('Edge detection (invert)', names_tag);
end

function add_caption(txt, names_tag)
    full_txt = sprintf('%s %s', txt, names_tag);
    h = xlabel(full_txt, 'FontSize', 10, 'FontAngle', 'italic', 'Color', 'k');
    set(h, 'Visible', 'on');
end