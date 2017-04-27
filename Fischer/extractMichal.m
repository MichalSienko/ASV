clear all
close all
clc
F=0
T=0
for i =1:16
    for j = 1:26
%%Load SIFT descriptor
        tic
        fprintf('i:%d  j:%d\n',i,j)
        nameD1 = ['./imageFD/DoG/',num2str(i),'/',num2str(j)];
        load([nameD1,'/SIFT']);
        %[f,d_sift] = extract(im1,'sift'); %if sift wasn't made
%MICHAL POWER 2
        d_michal = d_sift.^2;

        %disp (d_output(2:10,3:4))

%%Saving
        detectType=1
        if detectType == 1
            nameF = ['./imageFD/DoG/',num2str(i),'/',num2str(j)];
        end
        if size(dir(nameF),1) ==0
            mkdir(nameF)
        end



        save([nameF,'/MICHAL'],'f','d_michal')
        t = toc;
        fprintf('time cost: %.2f secs\n',t);
        T = T+t;
        F = F+ size(d_michal,2);
    end
end