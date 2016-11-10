data = load('Iris_data_norm_train.txt');

[row_count,column_count]=size(data);
x = data(:,1:column_count-1);# attributes of the training data
y = data(1:row_count,column_count);# the desired output of the dataset

#for testing purposes
data1 = load('iris_data_norm_test.txt');

[row_count1,column_count1]=size(data1);
x1 = data1(:,1:column_count1-1);# attributes of the testing data
y1 = data1(1:row_count1,column_count1);# the desired output of the dataset

weights =100*[1 1 1 1];
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

for current_row=1:row_count1
out = weights*transpose(x1(current_row, 1:(column_count1-1)));
if (sign(out) != y1(current_row, 1))
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
title("Perceptron Learning Algorithm");
print('perceptron.png','-dpng');
weights
