flight_data = readtable('powered flight/3/data.csv');
rc_ele = flight_data(:,"rc_ele").rc_ele;
gyro_pitch = flight_data(:, "gyro_pitch").gyro_pitch;
Ts = 0.001;
order = 4;
train_data = iddata(gyro_pitch, rc_ele, Ts);
tf = tfest(train_data, order);
figure;
compare(train_data,tf);
ylabel('pitch (gyro)')
xlabel('time')
title('train data')
legend('actual', 'predicted')
flight_data_2 = readtable('powered flight/5/data.csv');
rc_ele_2 = flight_data_2(:,"rc_ele").rc_ele;
gyro_pitch_2 = flight_data_2(:, "gyro_pitch").gyro_pitch;
val_data = iddata(gyro_pitch_2, rc_ele_2, Ts);
figure;
compare(val_data, tf);
ylabel('pitch (gyro)')
xlabel('time')
title('val data')
legend('actual', 'predicted')