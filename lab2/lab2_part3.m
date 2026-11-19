
function lab2_part3(filename)
    if nargin < 1
        filename = 'DailyShow.jpg';
    end

   
    member1 = 'Thien Phu';
    member2 = 'Dinh Hieu';
    names_tag = sprintf('(%s, %s)', member1, member2);

    img = imread(filename);

    % (i)   x[N-n+1, m]     
    img_i = flipud(img);

    % (ii)  x[n, M-m+1]       
    img_ii = fliplr(img);

    % (iii) x[N-n+1, M-m+1]  
    img_iii = flipud(fliplr(img));

    figure('Name', 'Lab 2 - Part 4.3', 'Color', 'w', 'WindowState', 'maximized');

    subplot(2, 2, 1);
    imshow(img);
    add_caption('Original image x[n, m]', names_tag);

    subplot(2, 2, 2);
    imshow(img_i);
    add_caption('(i) x[N-n+1, m] (flipud)', names_tag);

    subplot(2, 2, 3);
    imshow(img_ii);
    add_caption('(ii) x[n, M-m+1] (fliplr)', names_tag);

    subplot(2, 2, 4);
    imshow(img_iii);
    add_caption('(iii) x[N-n+1, M-m+1] (flipud + fliplr)', names_tag);
end

function add_caption(txt, names_tag)
    full_txt = sprintf('%s %s', txt, names_tag);
    h = xlabel(full_txt, 'FontSize', 10, 'FontAngle', 'italic', 'Color', 'k');
    set(h, 'Visible', 'on');
end