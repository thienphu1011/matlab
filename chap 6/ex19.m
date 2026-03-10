disp('Enter the coordinates for Point 1:');
x1 = input('x1: '); y1 = input('y1: ');

disp('Enter the coordinates for Point 2:');
x2 = input('x2: '); y2 = input('y2: ');

disp('Enter the coordinates for Point 3:');
x3 = input('x3: '); y3 = input('y3: ');

total_area = calcTriangleArea([x1, y1], [x2, y2], [x3, y3]);

fprintf('\nThe area of the triangle is: %.4f\n', total_area);


function area = calcTriangleArea(p1, p2, p3)
    function d = calcDistance(ptA, ptB)
        d = sqrt((ptA(1) - ptB(1))^2 + (ptA(2) - ptB(2))^2);
    end

    a = calcDistance(p1, p2);
    b = calcDistance(p2, p3);
    c = calcDistance(p3, p1);

    s = (a + b + c) / 2;

    area = sqrt(s * (s - a) * (s - b) * (s - c));
end