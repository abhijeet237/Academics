data=load('complete_dataset.txt');
x = data(:,1:4);
y=data(1:150,5);
trx = transpose(x);
a = trx*x;
b = trx*y;

w = inv(a)*b;
w
