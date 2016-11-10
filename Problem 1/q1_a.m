%--------------------user-input segment---------------
p0 = [0 0 0];
p1 = [0 0 1];
p2 = [0 1 0];
p3 = [1 0 0];
p4 = [1 1 1];
p5 = [0 1 1];

%for all segments, also s<L, i.e complete length of segment, as if s>L, then value of T goes -ve which is not correct

%-------------------initialization segment--------------
M = [-1 3 -3 1;3 -6 3 0;-3 0 3 0;1 4 1 0];
t_max = 1; %maximum value of variable t
t_min = 0; %minimum value of variable t
T_o = 0;
p = [p0; p1; p2; p3; p4; p5]; %storing all 6 given row-matrices into a single matrix

[row_count,column_count]=size(p); 

% Calculation of T for each segment
for i=1:row_count-3
	v = [p(i,:); p(i+1,:); p(i+2,:); p(i+3,:);];
	x=p(:,1);
	y=p(:,2);
	z=p(:,3);

	f = @(t) sqrt(((1/6)*(-3*t.^2 + 6*t - 3)*z(1) + (1/6)*(9*t.^2 - 12*t)*z(2) + (1/6)*(-9*t.^2 + 6*t + 3)*z(3) + (1/2)*(t.^2)*z(4)).^2 + ((1/6)*(-3*t.^2 + 6*t - 3)*x(1) + (1/6)*(9*t.^2 - 12*t)*x(2) + (1/6)*(-9*t.^2 + 6*t + 3)*x(3) + (1/2)*(t.^2)*x(4)).^2 + ((1/6)*(-3*t.^2 + 6*t - 3)*y(1) + (1/6)*(9*t.^2 - 12*t)*y(2) + (1/6)*(-9*t.^2 + 6*t + 3)*y(3) + (1/2)*(t.^2)*y(4)).^2);
	% hard-coded the derivative as results coming from "diff" are not matching then that done using pen-paper
	length_segment = quad(f, t_min, t_max) % complete length of a particular arc
	
	s = input("Enter value of 's' for current segment\n");
	
	T_o = t_min + (s*(t_max-t_min))/length_segment;
	T = T_o;
	
	j=0; %to check fot the case when T=T_o
	F = 10;
	%------------------main part of program-------------------
	while(F > 0.000001) %not checking until F becomes '0' because it then gives "ABNORMAL RETURN FROM DQAGI" error 
		if(j==0)  % In case of 1st iteration
			g = quad(f, t_min, T_o);
			F = g - s;
			j++;
		else
			T = T - F/f;
			g = quad(f, t_min, T);
			F = g - s;
		end
	end
	T %value of T for which F -> 0 of that segment
endfor
