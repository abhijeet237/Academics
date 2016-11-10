%--------------------user-input segment---------------
p0 = [0 0 0];
p1 = [0 0 1];
p2 = [0 1 0];
p3 = [1 0 0];
p4 = [1 1 1];
p5 = [0 1 1];

u_max = 1;
u_min = 0;
t_max = 10;
t_min = 0;
t = 1/2 %for all segments, also t<t_max as if t>t_max, then value of T goes -ve which is not correct

M = [-1 3 -3 1;3 -6 3 0;-3 0 3 0;1 4 1 0];


scaling_factor = 0;
U_o = 1;
p = [p0; p1; p2; p3; p4; p5];

[row_count,column_count] = size(p);

speed = @(t) t.^3+t.^2+t+1; % giving speed function as an input to the system
% calculating length of each segment
for i=1:row_count-3
	v = [p(i,:); p(i+1,:); p(i+2,:); p(i+3,:);];
	x=p(:,1);
	y=p(:,2);
	z=p(:,3);

	f = @(u) sqrt(((1/6)*(-3*u.^2 + 6*u - 3)*z(1) + (1/6)*(9*u.^2 - 12*u)*z(2) + (1/6)*(-9*u.^2 + 6*u + 3)*z(3) + (1/2)*(u.^2)*z(4)).^2 + ((1/6)*(-3*u.^2 + 6*u - 3)*x(1) + (1/6)*(9*u.^2 - 12*u)*x(2) + (1/6)*(-9*u.^2 + 6*u + 3)*x(3) + (1/2)*(u.^2)*x(4)).^2 + ((1/6)*(-3*u.^2 + 6*u - 3)*y(1) + (1/6)*(9*u.^2 - 12*u)*y(2) + (1/6)*(-9*u.^2 + 6*u + 3)*y(3) + (1/2)*(u.^2)*y(4)).^2);
	% hard-coded the derivative as results coming from "diff" are not matching then that done from hand
	length_segment = quad(f, u_min, u_max); %finding length of arc of a particular segment from u_min to a particular value of u
	scaling_factor = length_segment/quad(speed, t_max, t_min); %in order to remove the problem of scaling factor
	l = scaling_factor*quad(speed, t_min, t); %arc-length of the curve
	U_o = u_min + (t*(u_max-u_min))/length_segment;
	U = U_o;
	j=0; %to check for the case when U = U_o
	F = 10;
	while(F > 0.001) %not checking until F becomes '0' because it then gives "ABNORMAL RETURN FROM DQAGI" error 
		if(j==0)
			P = quad(f, u_min, U_o);
			F = P - l;
			j++;
		else
			U = U - (F/length_segment);
			P = quad(f, u_min, U);
			F = P - l;
		end
	end
	U %value of T for which F -> 0 of that segment
endfor

