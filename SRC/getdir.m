function dir = getdir(initdir)
    tmp = randi(6);
    if tmp == 1||tmp == 2||tmp==3
        tmp = 1;
    elseif tmp == 4||tmp ==5
        tmp = 2;
    elseif tmp == 6
        tmp = 3;
    end
    switch initdir
        case 1
            if tmp == 1
                dir = 1;
            elseif tmp == 2
                dir = 4;
            elseif tmp == 3
                dir = 3;
            end
        case 2
            if tmp == 1
                dir = 2;
            elseif tmp == 2
                dir = 3;
            elseif tmp == 3
                dir = 4;
            end
        case 3
            if tmp == 1
                dir = 3;
            elseif tmp == 2
                dir = 1;
            elseif tmp == 3
                dir = 2;
            end
        case 4
            if tmp == 1
                dir = 4;
            elseif tmp == 2
                dir = 2;
            elseif tmp == 3
                dir = 1;
            end
    end
end     