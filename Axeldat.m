clear;
clc;
T = 1000000;% For 1000000 iterations
tpi = raspi %Create target Raspberry Pi object
enableSPI(tpi); %Enable SPI
Ax_dat = lis331(tpi,'CE1'); %Select any available SPI channel
cal_pos = Ax_dat.readAcceleration; %To obtain reference position
pos_dat = zeros(T,3); %Memory allocation
pos_dat(1,:) = cal_pos; %First row stores the base position
test = true;
i = 2;
while test
    pos_dat(i,:) = Ax_dat.readAcceleration;
    i = i+1;
    if i == T
        test = false;
    end
end
writematrix(pos_dat,'Posdat,csv');