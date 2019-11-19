clear
clc
secsthatwouldhaveonecar = fix(1/((1/30)*exp(-1/30)));
time = 1;use = 0;times = 0;
count = 1; %count the # of cars that have ever been activated
car = zeros(3000,9); %array to store the state of cars
best = zeros(86400,1);P = zeros(10000,4);change = 0;  % best's variable
thresh = zeros(86400,1);changet = 0; %threshold's variable
entropy = zeros(86400,1);changeEn = 0; %entropy's variable
mymethod = zeros(86400,1);changemy = 0; %mymoethod's variable
powerb = 0;powert = 0;powere = 0;powermy = 0; %variables that help store the power state

% simulation
while(time<86400)
%     initial the car position and direction
    carOX = randi(secsthatwouldhaveonecar);
    if carOX == 31
        startpoint = randi(12);
        switch startpoint
            case 1
                car(count,1) = 2;
                car(count,2) = 75;
                car(count,3) = 0;
                car(count,4) = 1;
                car(count,5) = 1;
                car(count,6) = 1;
                car(count,7) = 1;
            case 2
                car(count,1) = 2;
                car(count,2) = 150;
                car(count,3) = 0;
                car(count,4) = 1;
                car(count,5) = 1;
                car(count,6) = 1;
                car(count,7) = 1;
            case 3
                car(count,1) = 2;
                car(count,2) = 225;
                car(count,3) = 0;
                car(count,4) = 2;
                car(count,5) = 2;
                car(count,6) = 2;
                car(count,7) = 2;
            case 4
                car(count,1) = 4;
                car(count,2) = 0;
                car(count,3) = 75;
                car(count,4) = 1;
                car(count,5) = 1;
                car(count,6) = 1;
                car(count,7) = 1;
            case 5
                car(count,1) = 3;
                car(count,2) = 300;
                car(count,3) = 75;
                car(count,4) = 2;
                car(count,5) = 2;
                car(count,6) = 2;
                car(count,7) = 2;
            case 6
                car(count,1) = 4;
                car(count,2) = 0;
                car(count,3) = 150;
                car(count,4) = 1;
                car(count,5) = 1;
                car(count,6) = 1;
                car(count,7) = 1;
            case 7
                car(count,1) = 3;
                car(count,2) = 300;
                car(count,3) = 150;
                car(count,4) = 2;
                car(count,5) = 2;
                car(count,6) = 2;
                car(count,7) = 2;
            case 8
                car(count,1) = 4;
                car(count,2) = 0;
                car(count,3) = 225;
                car(count,4) = 3;
                car(count,5) = 3;
                car(count,6) = 3;
                car(count,7) = 3;
            case 9
                car(count,1) = 3;
                car(count,2) = 300;
                car(count,3) = 225;
                car(count,4) = 4;
                car(count,5) = 4;
                car(count,6) = 4;
                car(count,7) = 4;
            case 10
                car(count,1) = 1;
                car(count,2) = 75;
                car(count,3) = 300;
                car(count,4) = 3;
                car(count,5) = 3;
                car(count,6) = 3;
                car(count,7) = 3;
            case 11
                car(count,1) = 1;
                car(count,2) = 150;
                car(count,3) = 300;
                car(count,4) = 3;
                car(count,5) = 3;
                car(count,6) = 3;
                car(count,7) = 3;
            case 12
                car(count,1) = 1;
                car(count,2) = 225;
                car(count,3) = 300;
                car(count,4) = 4;
                car(count,5) = 4;
                car(count,6) = 4;
                car(count,7) = 4;
        end
        count = count + 1;
        car(count,8) = time;
    end
%         car walk in the map or leave the map
    for i = 1 : count
        if car(i,1) == 1 && (car(i,2)==75||car(i,2)==150||car(i,2)==225) && car(i,3) == 0
            car(i,1) = 0;
            car(i,9) = time;
            for j = 1 : 4
                P(i,j) = 0;
            end
        elseif car(i,1) == 2 && (car(i,2)==75||car(i,2)==150||car(i,2)==225) && car(i,3) == 300
            car(i,1) = 0;
            car(i,9) = time;
            for j = 1 : 4
                P(i,j) = 0;
            end
        elseif car(i,1) == 3 && (car(i,3)==75||car(i,3)==150||car(i,3)==225) && car(i,2) == 0
            car(i,1) = 0;
            car(i,9) = time;
            for j = 1 : 4
                P(i,j) = 0;
            end
        elseif car(i,1) == 4 && (car(i,3)==75||car(i,3)==150||car(i,3)==225) && car(i,2) == 300
            car(i,1) = 0;
            car(i,9) = time;
            for j = 1 : 4
                P(i,j) = 0;
            end
        end
        
        
        switch car(i,1)
            case 1  %up
                car(i,3) = car(i,3) - 1;
                if car(i,2) == 0 && car(i,3) == 0
                    car(i,1) = 4;
                elseif car(i,2) == 300 && car(i,3) == 0
                    car(i,1) = 3;
                elseif (car(i,2) == 75 ||car(i,2) == 150 || car(i,2) == 225|| car(i,2) == 0|| car(i,2) == 300)&&(car(i,3) == 300 ||car(i,3) == 0 ||car(i,3) == 75 ||car(i,3) == 150 || car(i,3) == 225)
                    car(i,1) = getdir(car(i,1));
                end
            case 2  %down
                car(i,3) = car(i,3) + 1;
                if car(i,2) == 0 && car(i,3) == 300
                    car(i,1) = 4;
                elseif car(i,2) == 300 && car(i,3) == 300
                    car(i,1) = 3;
                elseif (car(i,2) == 0 ||car(i,2) == 75 ||car(i,2) == 150 || car(i,2) == 225||car(i,2) == 300)&&(car(i,3) == 300 ||car(i,3) == 0 ||car(i,3) == 75 ||car(i,3) == 150 || car(i,3) == 225)
                    car(i,1) = getdir(car(i,1));
                end
            case 3  %left
                car(i,2) = car(i,2) - 1;
                if car(i,2) == 0 && car(i,3) == 0
                    car(i,1) = 2;
                elseif car(i,2) == 0 && car(i,3) == 300
                    car(i,1) = 1;
                elseif (car(i,2) == 0 ||car(i,2) == 75 ||car(i,2) == 150 || car(i,2) == 225||car(i,2) == 300)&&(car(i,3) == 0||car(i,3) == 75 ||car(i,3) == 150 || car(i,3) == 225||car(i,3) == 300)
                    car(i,1) = getdir(car(i,1));
                end
            case 4  %right
                car(i,2) = car(i,2) + 1;
                if car(i,2) == 300 && car(i,3) == 0
                    car(i,1) = 2;
                elseif car(i,2) == 300 && car(i,3) == 300
                    car(i,1) = 1;
                elseif (car(i,2) == 0 ||car(i,2) == 75 ||car(i,2) == 150 || car(i,2) == 225||car(i,2) == 300)&&(car(i,3) == 0||car(i,3) == 75 ||car(i,3) == 150 || car(i,3) == 225||car(i,3) == 300)
                    car(i,1) = getdir(car(i,1));
                end
        end
    end
    
%     best calculate
    for i = 1 : count
       if car(i,1) ~= 0
           big = -100000;
           bigbase = 0;
           for j = 1 : 4
               P(i,j) = PowerCal(car(i,2),car(i,3),j);
               if P(i,j) >= big
                   big = P(i,j);
                   bigbase = j;
               end
           end
           if bigbase ~= car(i,4)
               car(i,4) = bigbase;
               change = change + 1;
           end
           powerb = powerb + P(i,car(i,4));
       end
    end
    best(time) = change;

%    threshold calculate
    for i = 1 : count
       if car(i,1) ~= 0
           big = -100000;
           bigbase = 0;
           for j = 1 : 4
%                Pt(i,j) = PowerCal(car(i,2),car(i,3),j);
               if P(i,j) > big
                   big = P(i,j);
                   bigbase = j;
               end
           end
           if ((bigbase ~= car(i,5)) && (P(i,car(i,5)) < -110))
               car(i,5) = bigbase;
               changet = changet + 1;
           end
           powert = powert + P(i,car(i,5));
       end
    end
   thresh(time) = changet;
   
%     entropy calculate
    for i = 1 : count
       if car(i,1) ~= 0
           big = -100000;
           bigbase = 0;
           for j = 1 : 4
%                Pe(i,j) = PowerCal(car(i,2),car(i,3),j);
               if P(i,j) >= big
                   big = P(i,j);
                   bigbase = j;
               end
           end
           use = P(i,(car(i,6)));
           if big - use > 5
               car(i,6) = bigbase;
               changeEn = changeEn + 1;
           end
           powere = powere + P(i,car(i,6));
       end
    end
    entropy(time) = changeEn;
    
%     my method
    for i = 1 : count
        use = 0;
        bigbase = 0;
        big = -10000;
        if car(i,1) ~= 0
            for j = 1 : 4
                if P(i,j) > P(i,car(i,7))
                    use = use + 1;
                end
                if P(i,j) >= big
                   big = P(i,j);
                   bigbase = j;
               end
            end
            if use > 1
                car(i,7) = bigbase;
                changemy = changemy + 1;
            end
            powermy = powermy + P(i,car(i,7));
        end
    end
    mymethod(time) = changemy;
    
    time = time + 1;
end

% calculate the times that car in the map
for i = 1 : count
    if car(i,8) ~= 0 && car(i,9) ==0
        car(i,9) = time;
    end
    times = times + (car(i,9)-car(i,8));
end

% calculate the power mea of all policies
powerb = powerb/times;
powert = powert/times;
powere = powere/times;
powermy = powermy/times;

% plot the results
hold on
plot(best,'ro');
xlabel('time(sec)');
ylabel('time of handoffs');
plot(thresh,'bo');
plot(entropy,'go');
plot(mymethod,'yo');
hold off