needles = 500000;
needle_length = 0.10;
tile_length = needle_length*2;
angles = rand(1,needles)*360;

a = rand(2,needles);
b = a+[needle_length*cosd(angles+90);needle_length*sind(angles+90)];

x = [a(1,:);b(1,:)];
y = [a(2,:);b(2,:)];

% x = [a(1,:);b(1,:);c(1,:);d(1,:);a(1,:);a(1,:);c(1,:);b(1,:);d(1,:)];
% y = [a(2,:);b(2,:);c(2,:);d(2,:);a(2,:);a(2,:);c(2,:);b(2,:);d(2,:)];

% diagonals_x = [a(1,:);c(1,:);b(1,:);d(1,:)];
%diagonals_y = [a(2,:);c(2,:);b(2,:);d(2,:)];

x_intersections = floor(x(1,:)/tile_length) ~= floor(x(2,:)/tile_length);
y_intersections = floor(y(1,:)/tile_length) ~= floor(y(2,:)/tile_length);
intersections = sum(x_intersections | y_intersections);

probability = intersections/needles;

% piEstimate = ((4*needle_length*tile_length)-(tile_length*tile_length))/(probability*tile_length*tile_length)
piEstimate = (needles*(4 * needle_length * tile_length - (needle_length*needle_length)))/(intersections*(tile_length*tile_length))
% Ncc = sum(xor(all_intersections([1:2:end]),all_intersections([2:2:end])));
% rootEstimate = 2 - (Ncc/intersections)

% plot(x,y);
glines = 0:tile_length:1;
for i = 1:length(glines)
    xline(glines(i));
    yline(glines(i));
end
axis equal
axis([0 1 0 1]);


% 
% n = sum(floor(xb/L) ~= floor(xe/L));
% piEstimate = 2 * N / n