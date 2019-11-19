function P = PowerCal(posx,posy,base)
    x=0;
    y=0;
    dis=0;
    posx = posx.*10;
    posy = posy.*10;
    switch base
        case 1
            x = 750;
            y = 750;
        case 2
            x = 2250;
            y = 750;
        case 3
            x = 750;
            y = 2250;
        case 4
            x = 2250;
            y = 2250;
    end
    dis = sqrt((abs(x-posx)).^2+(abs(y-posy)).^2)-1;
    if dis < 0
        P = -50;
    elseif dis == 0
        P = -60;
    else
    P = -60-20*log10(dis);
    P = round(P);
    end
end