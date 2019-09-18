% variables
fn = 32;
alpha = 0.0001;
iter = 1000000;
% Load data
[X, y] = ProcessData('student-por.csv',fn, true);
fprintf("Data process finished!...\n")

% data number
dn = size(X,1);

% add 1
X = [ones(dn,1) X];
% Seperate train data and test data
r = randperm(dn);

trainX = X(r(1:round(dn * 0.7)),:);
trainY = y(r(1:round(dn * 0.7)),1);
testX = X(r(round(dn * 0.7) + 1:end),:);
testY = y(r(round(dn * 0.7) + 1:end),1);


theta = rand(fn + 1,1);
[theta,j] = GradientDescent(trainX,trainY,theta,alpha,iter);

preY = testX * theta;

fprintf("Difference : %f\n",mean(abs(preY - testY)))
A = [preY testY];
fprintf("   Predict    Actual\n\n");
disp(A)

figure(1)
plot(preY,"-r","linewidth",2)
hold on
bar(testY,'FaceColor',[.2 .5 1],0.3);
legend("Predict score","Actual score","Location",'northeast');

figure(2)
plot(abs(preY-testY),"-b","linewidth",2)
title("Difference")

figure(3)
plot(j(1:1000:end),"linewidth",2)
title("Cost")
