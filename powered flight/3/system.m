flight_data = readtable('data.csv');
thr = flight_data(:,"rc_thr").rc_thr;
acc_X = flight_data(:, "acc_X").acc_X;
Ts = 0.001;
order = 4;
data = iddata(acc_X, thr, Ts);
tf = tfest(data, order);
