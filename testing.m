squares = 1000;
side_length = 0.10;
plank_length = side_length*2;
angles = rand(1,squares)*360;
estimates = zeros(1,squares);

a = rand(2,squares);
b = a+[side_length*cosd(angles+90);side_length*sind(angles+90)];
c = b+[side_length*cosd(angles+180);side_length*sind(angles+180)];
d = c+[side_length*cosd(angles+270);side_length*sind(angles+270)];

x = [a(1,:);b(1,:);c(1,:);d(1,:);a(1,:)];
y = [a(2,:);b(2,:);c(2,:);d(2,:);a(2,:)];

% x = [a(1,:);b(1,:);c(1,:);d(1,:);a(1,:);a(1,:);c(1,:);b(1,:);d(1,:)];
% y = [a(2,:);b(2,:);c(2,:);d(2,:);a(2,:);a(2,:);c(2,:);b(2,:);d(2,:)];

diagonals_x = [a(1,:);c(1,:);b(1,:);d(1,:)];
%diagonals_y = [a(2,:);c(2,:);b(2,:);d(2,:)];

all_intersections = floor(diagonals_x([1:2:end])/plank_length) ~= floor(diagonals_x([2:2:end])/plank_length);
intersections = all_intersections([1:2:end]) | all_intersections([2:2:end]);
no_intersections = sum(intersections);
piEstimate = 2 * squares/no_intersections

% for i = 1:squares
%    estimates(i) = 2 * i/sum(intersections(1:i));
% end

% plot(estimates)

% Ncc = sum(xor(all_intersections([1:2:end]),all_intersections([2:2:end])));
% rootEstimate = 2 - (Ncc/no_intersections)

plot(x,y);
% glines = 0:side_length:1;
% for i = 1:length(glines)
%     xline(glines(i));
% end
% axis equal
% axis([0 1 0 1]);


% 
% n = sum(floor(xb/L) ~= floor(xe/L));
% piEstimate = 2 * N / n