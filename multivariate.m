data = load('complete_dataset.txt');
[row_count,column_count]=size(data);
x = data(:,1:column_count-1);# attributes of the training data
y = data(1:row_count,column_count);# the desired output of the dataset


weights =100*ones(1,column_count-1);

EIN(1)=0;
EOUT(1)=0;
Ein = 0;
Eout= 0;
for iteration= 1:10
for current_row=1:row_count

out = weights*transpose(x(current_row, 1:column_count-1));

if (sign(out) != y(current_row,1))
Ein++;
weights = weights + y(current_row, 1)*x(current_row, 1:(column_count-1));
endif
endfor

for current_row=1:row_count #starting testing loop from the next row of training part
out = weights*transpose(x(current_row, 1:(column_count-1)));
if (sign(out) != y(current_row, 1))
Eout++;
endif
endfor
EIN(iteration) = Ein;
EOUT(iteration) = Eout;
Ein = 0;
Eout = 0;

endfor

plot(EIN, "b");
hold on 
grid on
plot(EOUT,"r");
xlabel("Epochs");
ylabel("Ein: Blue Line, Eout: Red Line");
legend('Ein','Eout');
title("Multivariate PLA");
print('multivariate.png','-dpng');
weights
